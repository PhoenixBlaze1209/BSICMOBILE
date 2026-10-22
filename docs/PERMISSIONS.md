# Permissions

Permissions are evaluated by one pure `PermissionPolicy` in application code and independently reimplemented in Firestore rules and callable functions.

| Capability | Owner | Admin | Manager | Member | Viewer |
|---|:---:|:---:|:---:|:---:|:---:|
| Read organization/task data | ✓ | ✓ | ✓ | ✓ | ✓ |
| Create and edit own tasks | ✓ | ✓ | ✓ | ✓ | — |
| Edit any team task | ✓ | ✓ | managed teams | assigned/created only | — |
| Assign or reassign | ✓ | ✓ | managed teams | self-assign/open tasks | — |
| Force blocked transition/reopen | ✓ | ✓ | managed teams | — | — |
| Lower priority | ✓ | ✓ | managed teams | creator only | — |
| Manual escalation | ✓ | ✓ | managed teams | assigned/created only | — |
| Change `escalationPolicyId` | ✓ | ✓ | managed teams | — | — |
| Manage members/teams | ✓ | ✓ | managed teams (limited) | — | — |
| Manage org policies/settings | ✓ | ✓ | — | — | — |
| Delete organization/export all data | ✓ | — | — | — | — |

Suspended members have no tenant access. Away members retain reads and ordinary writes but assignment routes to an eligible delegate. Owner-only operations require recent authentication in the client and server.

Rules enforce organization isolation by membership document, immutable IDs and ownership fields, an explicit allowed field-diff per capability, append-only audit history, and version increments. Storage rules repeat organization and attachment constraints. UI affordances may hide forbidden actions, but hiding is never treated as authorization.

