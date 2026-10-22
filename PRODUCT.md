# Product

<!-- impeccable:product-schema 1 -->

## Platform

adaptive

## Stack

Flutter (latest stable) and Dart 3 for Android, iOS, and responsive web. Firebase provides authentication, Firestore, Cloud Functions, Cloud Messaging, and Remote Config. Drift provides the local cache and durable outbox.

## Users

Teams that delegate time-sensitive work across reporting lines. Individual contributors need a clear queue and fast acknowledgement flow; creators and managers need confidence that stalled work becomes visible without constant manual chasing; administrators need auditable policy, permission, and notification controls.

## Product Purpose

The product makes ownership, urgency, and escalation explicit. Work is assigned, accepted or declined, completed through a constrained status machine, and automatically escalated through an organization-defined chain when it is overdue, blocked, or ignored. Success means fewer silently stalled tasks, predictable SLA handling, and an audit trail that explains every important decision.

## Positioning

Unlike a generic task list, the product combines acceptance-based delegation, business-hours-aware SLAs, deterministic priority scoring, and a server-authoritative escalation ladder whose decisions are previewable on the client and fully audited.

## Operating Context

Users work on phones, tablets, and desktop web across multiple time zones. They move between personal work queues, delegated work, team oversight, escalation-policy editing, notification triage, and analytics. Connectivity may be intermittent, so cached reads, queued writes, visible sync state, and conflict recovery are part of the primary workflow.

## Capabilities and Constraints

- Roles: owner, admin, manager, member, and viewer, scoped to an organization.
- Task assignment includes acceptance windows, away delegates, workload warnings, and a depth limit for reassignment.
- Priority controls ordering, SLA deadlines, and escalation behavior.
- The server is authoritative for escalation; a pure Dart mirror is for preview and tests only.
- All layer boundaries return typed `Result` values. Domain code remains pure Dart.
- No secrets are stored in the repository. Firebase is replaceable through repository interfaces.
- The working product name is **Relay**. This is an inferred implementation label, not a confirmed brand commitment.

## Evidence on Hand

The supplied implementation brief is the sole source of product truth. There are no supplied logos, brand assets, customer claims, testimonials, or production data; future work must not fabricate them. Any sample task and analytics data must be clearly identified as illustrative.

## Product Principles

- Nothing important stalls silently.
- Every automatic action is explainable and auditable.
- Urgency is visible without turning the interface into an alarm panel.
- Offline work is durable and its sync state is legible.
- Authority is enforced independently at every boundary.

## Accessibility & Inclusion

Meet WCAG AA contrast, provide 44 pt iOS and 48 dp Android touch targets, support text scaling to 200%, semantic labels, full keyboard navigation, screen readers, reduced motion, light and dark themes, and localization-ready copy.

