export type Priority = "critical" | "high" | "medium" | "low";
export type Status = "draft" | "open" | "assigned" | "accepted" | "inProgress" | "blocked" | "inReview" | "done" | "cancelled" | "declined";
export type Trigger = "unacknowledged" | "overdue" | "slaBreach" | "stalled" | "blockedTooLong" | "manual";

export interface TaskSnapshot {
  id: string;
  orgId: string;
  priority: Priority;
  status: Status;
  escalationLevel: number;
  version: number;
  dueAt?: string;
  slaDeadlineAt?: string;
  assignedAt?: string;
  lastActivityAt?: string;
  blockedAt?: string;
  snoozedUntil?: string;
  isDeleted?: boolean;
  needsAttention?: boolean;
}

export interface PolicyStep {
  level: number;
  triggerCondition: Trigger;
  afterMinutes: number;
  repeatEveryMinutes?: number;
  maxRepeats: number;
  action: "notify" | "reassign" | "raisePriority" | "notifyAndReassign";
}

export interface EscalationRecord {
  toLevel: number;
  reason: Trigger;
  createdAt: string;
}

export type Decision =
  | {kind: "none"; nextEvaluationAt?: string}
  | {kind: "deEscalate"; reason: string}
  | {kind: "needsAttention"; trigger: Trigger}
  | {kind: "escalate"; trigger: Trigger; step: PolicyStep; idempotencyKey: string; repeat: number};

const acceptanceMinutes: Record<Priority, number> = {critical: 15, high: 60, medium: 240, low: 1440};
const stalledMinutes: Record<Priority, number> = {critical: 60, high: 240, medium: 480, low: 1440};
const blockedMinutes: Record<Priority, number> = {critical: 60, high: 240, medium: 480, low: 1440};

const addMinutes = (value: string, minutes: number): Date => new Date(new Date(value).getTime() + minutes * 60_000);

function activeTrigger(task: TaskSnapshot, now: Date, manual: boolean): Trigger | undefined {
  if (manual) return "manual";
  if (task.status === "assigned" && task.assignedAt && addMinutes(task.assignedAt, acceptanceMinutes[task.priority]) <= now) return "unacknowledged";
  if (task.dueAt && new Date(task.dueAt) <= now) return "overdue";
  if (task.slaDeadlineAt && new Date(task.slaDeadlineAt) <= now) return "slaBreach";
  if (task.status === "blocked" && task.blockedAt && addMinutes(task.blockedAt, blockedMinutes[task.priority]) <= now) return "blockedTooLong";
  if (task.status === "inProgress" && task.lastActivityAt && addMinutes(task.lastActivityAt, stalledMinutes[task.priority]) <= now) return "stalled";
  return undefined;
}

export function evaluate(
  task: TaskSnapshot,
  steps: readonly PolicyStep[],
  events: readonly EscalationRecord[],
  now: Date,
  manual = false,
): Decision {
  if (task.isDeleted || task.status === "done" || task.status === "cancelled") {
    return task.escalationLevel > 0 ? {kind: "deEscalate", reason: "terminal"} : {kind: "none"};
  }
  if (task.snoozedUntil && new Date(task.snoozedUntil) > now) return {kind: "none", nextEvaluationAt: task.snoozedUntil};
  const trigger = activeTrigger(task, now, manual);
  if (!trigger) return {kind: "none"};
  const matching = steps.filter((step) => step.triggerCondition === trigger).sort((a, b) => a.level - b.level);
  if (matching.length === 0) return {kind: "none"};
  const desired = matching.find((step) => step.level === task.escalationLevel + 1) ?? matching[matching.length - 1];
  if (!desired) return {kind: "none"};
  const relevant = events.filter((event) => event.toLevel === desired.level && event.reason === trigger);
  if (task.escalationLevel >= desired.level && relevant.length > desired.maxRepeats) return {kind: "needsAttention", trigger};
  const anchor = events.length > 0
    ? new Date(Math.max(...events.map((event) => new Date(event.createdAt).getTime())))
    : triggerStart(task, trigger);
  const wait = relevant.length === 0 ? desired.afterMinutes : desired.repeatEveryMinutes;
  if (wait === undefined) return {kind: "none"};
  const eligibleAt = new Date(anchor.getTime() + wait * 60_000);
  if (eligibleAt > now) return {kind: "none", nextEvaluationAt: eligibleAt.toISOString()};
  return {
    kind: "escalate",
    trigger,
    step: desired,
    idempotencyKey: `${task.id}:${desired.level}:${trigger}`,
    repeat: relevant.length,
  };
}

function triggerStart(task: TaskSnapshot, trigger: Trigger): Date {
  const fallback = task.lastActivityAt ?? task.assignedAt ?? new Date(0).toISOString();
  switch (trigger) {
    case "unacknowledged": return addMinutes(task.assignedAt ?? fallback, acceptanceMinutes[task.priority]);
    case "overdue": return new Date(task.dueAt ?? fallback);
    case "slaBreach": return new Date(task.slaDeadlineAt ?? fallback);
    case "blockedTooLong": return new Date(task.blockedAt ?? fallback);
    case "stalled": return new Date(task.lastActivityAt ?? fallback);
    case "manual": return new Date(fallback);
  }
}

