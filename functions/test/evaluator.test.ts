import {describe, expect, it} from "vitest";
import {evaluate, type PolicyStep, type TaskSnapshot} from "../src/evaluator.js";

const base: TaskSnapshot = {
  id: "task-1",
  orgId: "org-1",
  priority: "high",
  status: "assigned",
  escalationLevel: 0,
  version: 1,
  assignedAt: "2026-10-22T00:00:00.000Z",
};

const steps: PolicyStep[] = [{level: 1, triggerCondition: "unacknowledged", afterMinutes: 30, maxRepeats: 0, action: "notify"}];

describe("evaluate", () => {
  it("produces a deterministic key after the acceptance and step windows", () => {
    const result = evaluate(base, steps, [], new Date("2026-10-22T01:31:00.000Z"));
    expect(result).toMatchObject({kind: "escalate", idempotencyKey: "task-1:1:unacknowledged"});
  });

  it("de-escalates completed work", () => {
    expect(evaluate({...base, status: "done", escalationLevel: 2}, steps, [], new Date())).toEqual({kind: "deEscalate", reason: "terminal"});
  });
});

