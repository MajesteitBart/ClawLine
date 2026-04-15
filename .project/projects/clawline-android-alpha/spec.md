---
name: ClawLine Android Alpha
slug: clawline-android-alpha
owner: bart
status: active
created: 2026-04-15T21:14:00Z
updated: 2026-04-15T21:14:00Z
outcome: Ship an internal Android alpha that lets Bart connect to his OpenClaw gateway, work across sessions, inspect live activity, and read core console state with enough reliability to replace Telegram for at least three daily operator workflows.
uncertainty: medium
probe_required: true
probe_status: completed
---

# Spec: ClawLine Android Alpha

## Executive Summary
ClawLine Android Alpha is the first execution project for turning OpenClaw’s researched mobile opportunity into a real operator-grade Android app. The alpha should prove that Bart can use a native Flutter client to connect to his gateway, move between sessions, continue chat, inspect live system activity, and check key console state without depending on Telegram as the primary mobile surface.

## Problem and Users
- Bart currently has transport access to OpenClaw, but not a purpose-built mobile workspace for operating it.
- Telegram is a useful channel, but it is not a strong session-first operator console.
- OpenClaw already has the backend capabilities needed for a serious mobile client, so the remaining challenge is product architecture, execution, and scope discipline.
- Primary user is Bart. Later users may include trusted collaborators with narrower permissions and less debug depth.

## Outcome and Success Metrics
- Internal alpha app can connect to a target OpenClaw gateway on Android.
- Bart can open a session list, switch sessions, and continue at least one active session from mobile.
- Bart can inspect live activity for the current session, including tool progress and approvals state.
- Bart can open a console-style overview for gateway and node health in read-first form.
- Bart judges the alpha good enough to replace Telegram for at least three recurring mobile operator workflows.

## Scope
### In Scope
- Flutter Android app foundation.
- App shell, navigation, and design-system baseline.
- Gateway connection and session data model.
- Session list, active chat view, and composer shell.
- Activity view for live run state, tool activity, and approvals visibility.
- Read-first console surfaces for gateway, nodes, channels, skills, and cron health as feasible in alpha.
- Alpha validation notes, smoke routes, and rollout preparation.

### Out of Scope
- iOS parity.
- Full desktop Control UI parity.
- Deep collaborator permissions model.
- New server-side orchestration layer outside the existing OpenClaw gateway.
- Overbuilt node/device control surfaces before the mobile operator core is solid.

## Functional Requirements
- Support secure connection to an OpenClaw gateway endpoint.
- Represent sessions as the primary unit of work.
- Show a mobile-first session list with clear active-state context.
- Render chat in a clean default mode that hides raw operator detail unless requested.
- Provide an activity surface for live tool state, approvals, and recent failures.
- Provide a console surface for high-value gateway and node health data.
- Support attachment and voice-ready composition hooks, even if the first alpha keeps some actions shallow.
- Preserve clear routing and agent/session context instead of hiding it behind generic chat metaphors.

## Non-Functional Requirements
- Android-first reliability.
- Clear loading, offline, reconnecting, and error states.
- Repo-relative docs and auditable Delano artifacts.
- Feature delivery in small, testable slices.
- No backend reinvention that duplicates gateway truth.

## Hypotheses and Unknowns
- A read-first console will deliver enough operator value in alpha without needing full admin mutation flows.
- The existing gateway surfaces are sufficient for a session-first mobile client without a dedicated mobile API layer.
- Voice and attachment hooks can be scoped lightly in alpha without weakening the core product bet.
- Connection, auth, and recovery flows may need refinement once real device testing starts.

## Touchpoints to Exercise
- Gateway connect / reconnect flow.
- Session list and session switch.
- Active session chat and composer shell.
- Activity feed including tool progress and approvals state.
- Console overview for gateway and node health.
- Android notification and lifecycle behavior as the app matures.

## Probe Findings
- The architecture audit confirmed OpenClaw already has the core backend model needed for the app.
- The biggest gap is product architecture and interface quality, not backend feasibility.
- The strongest differentiation is a session-first operator console plus node companion, not a generic mobile AI chat clone.

## Footguns Discovered
- Treating channels like Telegram as the primary product model instead of a transport layer.
- Mixing clean chat and raw debug/operator detail into one noisy default view.
- Recreating backend state instead of using the gateway as the source of truth.
- Letting scope sprawl into full desktop admin parity too early.

## Remaining Unknowns
- Exact mobile auth and pairing UX.
- Whether WebSocket and admin surfaces need a thin mobile-specific client adapter.
- The minimum viable console depth that feels useful without overloading the alpha.
- The best package choices for state, realtime transport, and secure local persistence once implementation starts.

## Dependencies
- OpenClaw gateway availability and stable mobile-consumable surfaces.
- Flutter and Android toolchain.
- Access to Android test hardware or emulator for smoke validation.
- GitHub remote for repo publishing and iteration.

## Approval Notes
- `docs/architecture_outline.md` is the current approved planning baseline for this spec.
- Bart explicitly asked for a strong repo setup with no half-work scaffolding.
