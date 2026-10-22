# Escalation

## Authority and Triggers

The scheduled function runs once per minute, while the task-write trigger evaluates the affected task immediately. Both call the same pure TypeScript evaluator and transact through the same idempotent writer.

Trigger start times:

- `unacknowledged`: `assignedAt + acceptanceWindow` while status remains assigned.
- `overdue`: `dueAt` while status is not done/cancelled.
- `slaBreach`: `slaDeadlineAt`.
- `stalled`: `lastActivityAt + priorityStallThreshold` while in progress.
- `blockedTooLong`: `blockedAt + priorityBlockThreshold` while blocked.
- `manual`: the server-accepted manual request timestamp and non-empty reason.

## Algorithm

1. Validate the current task version and skip deleted or terminal work.
2. Stop while `snoozedUntil` is in the future.
3. Select task policy, else team policy, else organization default; verify it is active and applies to task priority/team.
4. Determine active triggers and their starts using the assignee business calendar.
5. Select the next ordered step. Its delay is measured from the last escalation event, or the trigger start when there is no event.
6. If not elapsed, return an ineligible decision with the next evaluation instant.
7. Resolve targets, preventing reporting-line cycles. Missing manager falls back to team lead, then active admin, then owner. An empty result is replaced by the owner and logs a warning.
8. In a Firestore transaction, verify task version and absence of `taskId:level:triggerType`. Write the key, updated task, escalation event, task activity, and notification intents atomically.
9. Dispatch notifications after commit. Quiet hours defer non-critical channels; critical bypasses quiet hours. Away recipients route through delegates with a depth limit of two.
10. At the final level, repeat no more than `maxRepeats`. Afterwards set `needsAttention` and notify the owner once.

## Concurrency

Accepting a task and escalating it race on the task version. Whichever transaction commits first forces the other to re-read. If acceptance wins, the escalation becomes ineligible; if escalation wins, acceptance still succeeds on retry and emits a de-escalation event. Double taps and function retries hit the same deterministic key and do not duplicate work or notifications.

## De-escalation

Acceptance resets unacknowledged escalation. Completion clears all active escalation and `needsAttention`. Clearing a blocker removes only escalation attributable to `blockedTooLong`; independent overdue/SLA escalation remains. Moving teams re-resolves policy and clamps the level to the highest equivalent elapsed step without replaying notifications.

## Worked Example

A high-priority task is assigned Monday at 16:30 in Manila with working hours 09:00–17:00. Its one-hour acceptance window ends Tuesday at 09:30. If policy level 1 waits 30 business minutes after the trigger, it fires Tuesday at 10:00. A retry at 10:01 observes the same `taskId:1:unacknowledged` key and performs no work. If the assignee accepts at 10:02, a de-escalation event resets the level and records both events in order.

## Shared Fixtures

`test/fixtures/escalation_cases.json` is loaded by Dart tests and the Functions test runner. Cases include quiet hours, away chains, manager cycles, maximum repeats, retry idempotency, accept/escalate races, blocker clearing, team policy changes, DST, and malformed policy input.

