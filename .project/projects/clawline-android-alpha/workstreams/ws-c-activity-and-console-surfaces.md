---
name: WS-C Activity and Console Surfaces
owner: bart
status: planned
created: 2026-04-15T21:14:00Z
updated: 2026-04-15T21:14:00Z
---

# Workstream: WS-C Activity and Console Surfaces

## Objective
Deliver the operator surfaces that make ClawLine better than Telegram for monitoring and intervention without trying to ship full desktop admin parity.

## Owned Files/Areas
- Activity feed and approvals visibility.
- Recent failure and run-state summaries.
- Read-first console views for gateway, nodes, channels, skills, and cron.

## Dependencies
- Depends on WS-A for shared UI patterns.
- Depends on WS-B for gateway connectivity and session context.

## Risks
- Information density overwhelming the mobile layout.
- Pulling too much raw debug detail into default views.
- Stretching into mutation/admin flows too early.

## Handoff Criteria
- Bart can inspect live session activity and approvals state.
- Bart can open a compact console overview for the most valuable system health surfaces.
