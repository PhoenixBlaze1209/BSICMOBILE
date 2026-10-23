# Relay Dashboard Direction Contract

Seed key: `5924cfc2`

Approved reference: `.impeccable/mocks/relay-dashboard-c.png`

## THESIS

Relay is an operational dispatch board, not a generic productivity dashboard. Urgent ownership is visible immediately; escalation is a concrete route between named people.

## OWN-WORLD

The interface borrows from dispatch consoles: a bright cobalt command band, compact status rails, deadline columns, named operators, and connected escalation stops. Surfaces stay matte and low-elevation so state—not decoration—carries emphasis.

## STORY

The visitor accepts or declines the next assignment, scans the risk queue, expands one route to understand who receives the work next, and then moves to the full task queue or inbox.

## FIRST VIEWPORT

The first compact viewport must show the Relay identity, labeled Inbox, the full next-action band with acceptance countdown and two 48px-or-larger controls, all three risk summaries, a named three-stop escalation route, and the start of On track. The urgent task appears only once.

## FORM

Use full-bleed horizontal bands and dense rows rather than floating cards. Each row combines a severity rail, task/team/priority identity, deadline/SLA, owner/state, and disclosure. The selected row opens its connected route inline. Adaptive navigation becomes a rail at 600px without changing the dispatch grammar.

## Signature Interaction

Selecting a task uses a short fade-through with a slight shared-axis shift to reveal the route in place. Reduced-motion environments receive an immediate state change.

## Honest Risk

Dense operational rows can become illegible at large text sizes. Secondary ownership details may collapse while the task, deadline, and status remain readable and row height is allowed to grow through 200% text scaling.

## QUALITY BAR

- Frame: compact app identity, decisive full-width action band, then clearly divided operational queues.
- Depth: matte surfaces, one subtle inset route panel, no decorative card stack or gratuitous shadows.
- Ornament: severity rails, route line, and semantic status dots only; every mark communicates state.
- Lettering: heavy Relay wordmark and task titles, narrow uppercase command label, calm compact metadata.
- Motion: 260ms fade-through/shared-axis reveal with `disableAnimations` reduced-motion fallback.

