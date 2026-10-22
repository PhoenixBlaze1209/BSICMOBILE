# Test Plan

## Gates

Every change runs formatting, static analysis with strict casts/inference/raw types, unit/widget tests with coverage, Functions lint/typecheck/tests, and Firestore rules tests. Main CI additionally builds Android and web and runs emulator-backed integration tests.

## Domain and Application

- All state-machine edges, role restrictions, forced unblock/reopen, terminal states, activity and version changes.
- Priority scoring at 0/100 and every clamp; deterministic ordering.
- Business-calendar weekend, holiday, split-shift, DST gap/overlap, and cross-timezone cases.
- Dependency DFS, transitive blocker counts, self edges, long cycles.
- Assignment membership/team checks, away delegation, delegate-away depth two, deleted/suspended assignees, workload warning, reassignment depth.
- Escalation triggers, delays, snooze, quiet hours, fallbacks, manager cycles, max levels/repeats, de-escalation, policy changes, retries, and race fixtures.
- Notification preference, duplicate collapse, digest planning, token refresh/removal.
- Outbox retry/backoff, killed-mid-write recovery, mergeable and overlapping conflicts, partial bulk results.

Domain and application line coverage must remain at or above 90%.

## Presentation

Widget tests cover authentication, onboarding, all dashboard sections, filtered/paged task list, task detail, create/edit, quick assign, policy editor and preview, members, notification inbox, analytics, settings, empty/loading/error/offline states, permission gating, conflict sheet, denied notification banner, and inaccessible deep links. Each key screen is tested at compact, medium, and expanded widths and 200% text scale.

Golden tests cover both themes for design-system widgets and the debug gallery. Goldens assert icons/labels accompany priority, status, and escalation colors.

## Integration and Emulator

Automated flows: sign up; create/join organization; create and assign task; accept; advance fake/server emulator time to escalate; complete; verify de-escalation and audit history. Rules tests attempt cross-org reads, field escalation, version skipping, audit mutation, and unauthorized role changes. Functions tests simulate timeout/retry and ensure one event/notification set.

## Performance and Security

- Profile a 1,000-row virtualized list for sustained 60 fps on the reference Android device.
- Trace cold start with cached session toward the under-2-second target.
- Assert paged queries never create unbounded listeners.
- Fuzz title/description/comment limits and hostile Markdown/HTML.
- Validate upload signature, MIME, size, rate limits, App Check rejection, and PII-redacted logs.

## Verification Record

`docs/VERIFICATION.md` is produced after implementation and maps each prompt requirement to source and test evidence, with deviations explicit.

