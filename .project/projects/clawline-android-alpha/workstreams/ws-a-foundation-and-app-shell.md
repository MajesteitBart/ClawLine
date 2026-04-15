---
name: WS-A Foundation and App Shell
owner: bart
status: in-progress
created: 2026-04-15T21:14:00Z
updated: 2026-04-15T22:38:34Z
---

# Workstream: WS-A Foundation and App Shell

## Objective
Establish the Flutter app foundation, navigation model, and visual structure needed to support the alpha without locking the repo into premature implementation detail.

## Owned Files/Areas
- Flutter workspace bootstrap and package structure.
- App shell, navigation, theming, design tokens, and shared UI primitives.
- Shared empty, loading, and error states for core surfaces.

## Dependencies
- None for bootstrap work.
- Should stay aligned with `docs/architecture_outline.md` and the alpha spec.

## Risks
- Overbuilding design system depth before the gateway-connected flows exist.
- Letting shell structure drift away from session-first IA.

## Handoff Criteria
- App shell can launch.
- Primary navigation matches the alpha IA.
- Shared UI primitives are ready for session, activity, and console surfaces.

## Progress Notes
- The stock Flutter counter template has been replaced with a real ClawLine shell for Chats, Activity, Console, and Settings.
- Shared panel and status primitives now support the first operator-facing surfaces.
