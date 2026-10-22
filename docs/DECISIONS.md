# Decisions

## Recorded Defaults

1. **Working name:** Relay. The brief does not supply a brand name; this neutral internal label avoids implying a commercial identity.
2. **Visual direction:** a rail-dispatch board translated into Material 3: aligned operational rows, route markers, explicit handoff ladders, and restrained exception colors. No railway decoration is used.
3. **Calendar:** Monday–Friday, 09:00–17:00 in each assignee's IANA timezone, with no holidays until configured.
4. **SLA defaults:** critical 4 business hours, high 8, medium 24, low 72.
5. **Stalled thresholds:** critical 1 business hour, high 4, medium 8, low 24.
6. **Blocked thresholds:** critical 1 business hour, high 4, medium 8, low 24.
7. **Workload warning threshold:** 8 open critical/high tasks.
8. **Reassignment depth:** three; a manager is required afterwards.
9. **Pagination:** 25 records with opaque cursor tokens.
10. **Attachment policy:** 25 MiB each; PDF, common office documents, images, and plain text; server MIME inspection is authoritative.
11. **Search:** normalized Firestore prefix tokens behind a replaceable search repository.
12. **Web/iOS limitation:** Apple and Google sign-in are exposed only when platform configuration is present; absence produces a recoverable configuration failure, never a broken button.

## Conflict Resolutions

- Freezed entities cannot enforce validating public generated factories by themselves without a private validated constructor boundary. Public creation therefore goes through validating static factories returning `Result<Entity>`; generated JSON adapters remain data-layer DTO concerns.
- Firestore cannot generally enforce arbitrary graph cycle detection in security rules. Rules enforce field shape and permissions; trusted application/server transactions perform DFS cycle validation before writes.
- “Latest stable Flutter” cannot be pinned forever. CI reads the pinned channel/version from `.fvmrc`; dependency versions remain exact in the lockfile and are advanced intentionally.
- Email is optional and disabled unless a provider configuration exists. Inbox and push remain first-class.

