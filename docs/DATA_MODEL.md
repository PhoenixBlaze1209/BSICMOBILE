# Data Model

## Firestore Collections

All tenant data is nested below `orgs/{orgId}` to make isolation explicit.

| Path | Purpose |
|---|---|
| `users/{userId}` | Minimal global identity, locale, device settings |
| `users/{userId}/fcmTokens/{tokenHash}` | Token metadata and last-seen time |
| `orgs/{orgId}` | Organization and default policy/settings |
| `orgs/{orgId}/members/{userId}` | Role, reporting line, availability, delegate |
| `orgs/{orgId}/teams/{teamId}` | Team and lead |
| `orgs/{orgId}/tasks/{taskId}` | Current task aggregate and optimistic-lock version |
| `orgs/{orgId}/tasks/{taskId}/activities/{activityId}` | Append-only audit activity |
| `orgs/{orgId}/tasks/{taskId}/comments/{commentId}` | Sanitized Markdown comments |
| `orgs/{orgId}/tasks/{taskId}/escalations/{eventId}` | Append-only escalation history |
| `orgs/{orgId}/policies/{policyId}` | Escalation policy and ordered steps |
| `orgs/{orgId}/notifications/{notificationId}` | In-app delivery record |
| `orgs/{orgId}/escalationKeys/{key}` | Idempotency sentinel |

Attachments store metadata in Firestore and bytes in Cloud Storage under `orgs/{orgId}/tasks/{taskId}/{attachmentId}`. Size, MIME type, checksum, and uploader are validated before a signed upload is finalized.

## Task Document

Task timestamps are Firestore timestamps. `version` starts at 1 and every legal mutation increments exactly once. `lastActivityAt`, `assignedAt`, `blockedAt`, `needsAttention`, and `reassignmentCount` are persisted server-maintained fields used by the escalation engine. User-editable and server-maintained fields are separated in rules.

## Indexes

Composite indexes cover the cursor queries used by the UI:

- tasks: `assigneeId, isDeleted, statusGroup, score desc, dueAt, createdAt`
- tasks: `creatorId, isDeleted, statusGroup, score desc, dueAt, createdAt`
- tasks: `teamId, isDeleted, statusGroup, score desc, dueAt, createdAt`
- tasks: `needsAttention, isDeleted, updatedAt desc`
- notifications: `userId, readAt, sentAt desc`
- activities and escalation events: `createdAt desc`

Search is expressed through normalized prefix tokens for bounded Firestore search. A replaceable search repository may later move to a dedicated index without changing use cases.

## Security Rationale

Rules first verify active organization membership, then the permission, then an allowed field-diff, then `request.resource.data.version == resource.data.version + 1`. Audit documents permit create-only operations by trusted callable functions or validated members and never permit update/delete. Client rules are defense in depth; Cloud Functions re-validate every callable request and use App Check plus rate limits.

## Retention and Privacy

Soft-deleted tasks remain available to authorized auditors until the organization retention window expires. Account export is generated as a signed, expiring archive. Account deletion strips personal profile data and preserves audit actor IDs only where legally/operationally required by the organization policy.

