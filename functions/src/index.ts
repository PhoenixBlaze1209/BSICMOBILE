import {getApps, initializeApp} from "firebase-admin/app";
import {FieldValue, Timestamp, getFirestore} from "firebase-admin/firestore";
import {getMessaging} from "firebase-admin/messaging";
import {logger} from "firebase-functions";
import {onDocumentWritten} from "firebase-functions/v2/firestore";
import {onSchedule} from "firebase-functions/v2/scheduler";
import {evaluate, type EscalationRecord, type PolicyStep, type TaskSnapshot} from "./evaluator.js";

if (getApps().length === 0) initializeApp();
const db = getFirestore();

async function evaluateTask(orgId: string, taskId: string): Promise<void> {
  const taskRef = db.doc(`orgs/${orgId}/tasks/${taskId}`);
  const taskDoc = await taskRef.get();
  if (!taskDoc.exists) return;
  const raw = taskDoc.data();
  if (!raw) return;
  const task = timestampsToIso({...raw, id: taskId, orgId}) as TaskSnapshot;
  const policyId = String(raw.escalationPolicyId ?? "");
  const policyDoc = policyId ? await db.doc(`orgs/${orgId}/policies/${policyId}`).get() : undefined;
  const steps = (policyDoc?.data()?.steps ?? []) as PolicyStep[];
  const eventsQuery = await taskRef.collection("escalations").orderBy("createdAt", "desc").limit(25).get();
  const events = eventsQuery.docs.map((doc) => timestampsToIso(doc.data()) as EscalationRecord);
  const decision = evaluate(task, steps, events, new Date());
  if (decision.kind === "none") return;

  await db.runTransaction(async (transaction) => {
    const current = await transaction.get(taskRef);
    if (!current.exists || current.get("version") !== task.version) return;
    if (decision.kind === "deEscalate") {
      transaction.update(taskRef, {escalationLevel: 0, needsAttention: false, version: FieldValue.increment(1), updatedAt: FieldValue.serverTimestamp()});
      transaction.set(taskRef.collection("activities").doc(), {type: "deEscalated", actorId: "system", reason: decision.reason, createdAt: FieldValue.serverTimestamp()});
      return;
    }
    if (decision.kind === "needsAttention") {
      if (current.get("needsAttention") === true) return;
      transaction.update(taskRef, {needsAttention: true, version: FieldValue.increment(1), updatedAt: FieldValue.serverTimestamp()});
      transaction.set(db.collection(`orgs/${orgId}/notifications`).doc(), {type: "needsAttention", taskId, collapseKey: `${taskId}:needsAttention`, createdAt: FieldValue.serverTimestamp()});
      return;
    }
    const keyRef = db.doc(`orgs/${orgId}/escalationKeys/${decision.idempotencyKey}`);
    if ((await transaction.get(keyRef)).exists) return;
    transaction.create(keyRef, {taskId, level: decision.step.level, trigger: decision.trigger, createdAt: FieldValue.serverTimestamp()});
    transaction.update(taskRef, {escalationLevel: decision.step.level, version: FieldValue.increment(1), updatedAt: FieldValue.serverTimestamp()});
    transaction.set(taskRef.collection("escalations").doc(), {fromLevel: task.escalationLevel, toLevel: decision.step.level, reason: decision.trigger, triggeredBy: "system", notifiedUserIds: [], repeat: decision.repeat, createdAt: FieldValue.serverTimestamp()});
    transaction.set(taskRef.collection("activities").doc(), {type: "escalated", actorId: "system", before: {level: task.escalationLevel}, after: {level: decision.step.level}, createdAt: FieldValue.serverTimestamp()});
    transaction.set(db.collection(`orgs/${orgId}/notifications`).doc(), {type: "escalated", taskId, collapseKey: decision.idempotencyKey, deliveryStatus: "pending", createdAt: FieldValue.serverTimestamp()});
  });
}

export const evaluateTaskOnWrite = onDocumentWritten("orgs/{orgId}/tasks/{taskId}", async (event) => {
  await evaluateTask(event.params.orgId, event.params.taskId);
});

export const evaluateDueTasks = onSchedule("every 1 minutes", async () => {
  const snapshot = await db.collectionGroup("tasks").where("isDeleted", "==", false).where("status", "not-in", ["done", "cancelled"]).limit(500).get();
  await Promise.all(snapshot.docs.map(async (doc) => {
    const orgId = doc.ref.parent.parent?.id;
    if (orgId) await evaluateTask(orgId, doc.id);
  }));
});

export const dispatchNotifications = onDocumentWritten("orgs/{orgId}/notifications/{notificationId}", async (event) => {
  const after = event.data?.after;
  const data = after?.data();
  if (!after || !data || data.deliveryStatus !== "pending") return;
  const tokens = Array.isArray(data.tokens) ? data.tokens.filter((value): value is string => typeof value === "string") : [];
  if (tokens.length === 0) {
    logger.warn("Notification has no resolved target tokens", {orgId: event.params.orgId, notificationId: event.params.notificationId});
    return;
  }
  const response = await getMessaging().sendEachForMulticast({tokens, data: {type: String(data.type), taskId: String(data.taskId ?? "")}});
  await after.ref.update({deliveryStatus: response.failureCount === 0 ? "sent" : "partial", sentAt: FieldValue.serverTimestamp()});
});

function timestampsToIso(value: unknown): unknown {
  if (value instanceof Timestamp) return value.toDate().toISOString();
  if (Array.isArray(value)) return value.map(timestampsToIso);
  if (value && typeof value === "object") return Object.fromEntries(Object.entries(value).map(([key, item]) => [key, timestampsToIso(item)]));
  return value;
}

