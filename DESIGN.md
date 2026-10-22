# Relay Design System

Relay uses the visual logic of a rail-dispatch board: one calm operational field, clear routes, explicit handoffs, and unmissable exceptions. The metaphor is structural rather than decorative.

## Principles

- Rows are the primary unit of work; avoid card grids for task queues.
- A task's route is visible through status, assignee, SLA, and escalation markers.
- Amber identifies attention, red identifies breached commitments, and blue identifies the current actionable route. Color is always paired with an icon and label.
- Dense views remain calm through alignment, tabular numerals, restrained elevation, and generous section boundaries.
- Motion is a single route-change transition: the affected row and escalation rung advance together. Reduced-motion users receive an instant state change.

## Foundations

- 4 pt spacing grid; common steps: 4, 8, 12, 16, 24, 32, 48.
- Corners: 8 for controls, 12 for panels, 16 for sheets. Pills are reserved for compact statuses.
- Minimum targets: 48 dp on Android/web and 44 pt on iOS.
- Material 3 color roles and type roles are authoritative. Platform-safe system fonts are used for body and controls.
- Light surfaces use warm neutral canvas and graphite text. Dark surfaces use charcoal rather than absolute black.

## Components

`PriorityBadge`, `StatusChip`, `EscalationLadder`, `SlaCountdown`, `AssigneeAvatar`, `TaskCard`, `EmptyState`, `ErrorState`, `SyncIndicator`, and `ConfirmDialog` share semantic tokens and expose accessible labels.

## Adaptive Composition

- Compact: Material navigation bar, one task column, sheets for filters and quick assign.
- Medium: navigation rail and a wider task list.
- Expanded: navigation rail, list-detail split view, persistent filter controls.

## Content

Labels name actions directly. Operational timestamps use the member's time zone and tabular numerals. Sample data is marked “Illustrative.”

