import {readFileSync} from "node:fs";
import {afterAll, beforeAll, describe, expect, it} from "vitest";
import {
  assertFails,
  assertSucceeds,
  initializeTestEnvironment,
  type RulesTestEnvironment,
} from "@firebase/rules-unit-testing";

let environment: RulesTestEnvironment;

beforeAll(async () => {
  environment = await initializeTestEnvironment({
    projectId: "demo-relay",
    firestore: {
      rules: readFileSync(new URL("../../firestore.rules", import.meta.url), "utf8"),
      host: "127.0.0.1",
      port: 8180,
    },
  });
  await environment.withSecurityRulesDisabled(async (context) => {
    const db = context.firestore();
    await db.doc("orgs/org-1").set({ownerId: "owner", name: "Relay"});
    await db.doc("orgs/org-1/members/member").set({role: "member", status: "active"});
    await db.doc("orgs/org-1/tasks/task-1").set({orgId: "org-1", title: "Task", version: 1});
  });
});

afterAll(async () => environment.cleanup());

describe("Firestore tenant rules", () => {
  it("denies anonymous and cross-tenant reads", async () => {
    await assertFails(environment.unauthenticatedContext().firestore().doc("orgs/org-1/tasks/task-1").get());
    await assertFails(environment.authenticatedContext("outsider").firestore().doc("orgs/org-1/tasks/task-1").get());
  });

  it("allows an active member to read and enforces version increments", async () => {
    const task = environment.authenticatedContext("member").firestore().doc("orgs/org-1/tasks/task-1");
    await assertSucceeds(task.get());
    await assertFails(task.update({title: "Skipped version", version: 3}));
    await assertSucceeds(task.update({title: "Allowed", version: 2, updatedAt: new Date()}));
    expect(true).toBe(true);
  });
});

