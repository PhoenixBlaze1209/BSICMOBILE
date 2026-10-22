# Priority and SLA

## Score

`PriorityScorer.score(task, now)` is deterministic and clamped to `[0, 100]`:

```text
100 × (0.40 × priority + 0.35 × urgency + 0.15 × blocking + 0.10 × age)
```

- `priority = (weight - 1) / 3`, mapping low/medium/high/critical to `0, 1/3, 2/3, 1`.
- `urgency = clamp(elapsed / total, 0, 1)` from creation to due time; missing/invalid due windows contribute `0`; overdue is `1`.
- `blocking = min(transitivelyBlockedCount, 10) / 10`.
- `age = min(ageInMinutes, 43,200) / 43,200`, capped at 30 days.

The score is stored only as a query projection; domain callers can recompute it. Boundary tests cover all-zero input, a maximum score, overdue tasks, future creation timestamps, no due date, and transitive-blocking caps.

## Stable Ordering

Lists sort by status group, score descending, due date ascending (`null` last), creation time ascending, then task ID ascending as the deterministic tie-breaker.

## SLA Deadline

`SlaCalculator` consumes a `BusinessCalendar` containing an IANA timezone, one or more working intervals per weekday, and local-date holidays. It advances in local wall-clock working intervals and converts interval boundaries through timezone rules so DST gaps and overlaps do not duplicate or lose business duration.

Default SLA business durations are configurable per organization. Safe defaults are: critical 4 hours, high 8 hours, medium 24 hours, low 72 hours. Acceptance windows are critical 15 minutes, high 1 hour, medium 4 hours, and low 24 hours.

Priority may be raised by any actor with task edit permission. Lowering requires creator or manager permission. Every change increments the version, appends activity, and plans watcher notifications.

