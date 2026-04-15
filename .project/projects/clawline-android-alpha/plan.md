---
name: ClawLine Android Alpha
status: planned
lead: bart
created: 2026-04-15T21:14:00Z
updated: 2026-04-15T21:14:00Z
linear_project_id:
risk_level: medium
spec_status_at_plan_time: approved
---

# Delivery Plan: ClawLine Android Alpha

## What Changed After Probe
- The work moved from capability research into execution planning because the architecture is specific enough to guide implementation.
- The repo now uses Delano as the canonical planning and delivery layer instead of keeping the architecture as a standalone note.
- The first milestone is intentionally narrow: app shell, gateway connectivity, session core, activity visibility, and read-first console value.

## Architecture Decisions
- Flutter is the client framework, with Android as the first shipping target.
- OpenClaw gateway remains the system of record for sessions, activity, tools, logs, nodes, and admin state.
- The app is session-first, not transport-first.
- Clean chat and operator depth stay one tap apart, but not mixed in the default reading mode.
- The alpha should favor read-first console surfaces over broad write/admin mutation.

## Probe-Driven Architecture Changes
- No new backend layer is planned for the alpha.
- Mobile scope is centered on operator workflows that beat Telegram in clarity and control.
- Device-node ambition stays secondary until the mobile operator core is stable.

## Workstream Design
- **WS-A Foundation and App Shell**
  - establish the Flutter workspace, app shell, navigation, theming, and shared UI primitives.
- **WS-B Gateway Connectivity and Session Core**
  - define the gateway client contract, connection model, session list, and active-session state.
- **WS-C Activity and Console Surfaces**
  - build operator-facing activity, approvals visibility, and read-first console views.
- **WS-D Quality and Alpha Readiness**
  - testing, smoke validation, rollout notes, and alpha hardening.

## Milestone Strategy
- **M0 Repo and planning readiness**
  - complete Delano context, project spec, workstreams, and first task queue.
- **M1 Connected app shell**
  - finish WS-A and the first gateway/session primitives from WS-B.
- **M2 Operator core**
  - finish session chat, activity, and initial console value.
- **M3 Alpha readiness**
  - harden connection states, smoke test on device, and prepare internal alpha usage.

## Rollout Strategy
- Start with Bart-only internal alpha.
- Keep destructive or high-risk console actions out of scope for the first release.
- Release by capability slices, not by trying to deliver all console depth at once.

## Test Strategy
- Use Dart unit tests for models and client-state logic.
- Use Flutter widget tests for navigation, session views, and critical empty/loading/error states.
- Use mocked gateway responses early, then graduate to a real gateway smoke environment.
- Track Android smoke evidence for launch, connect, session switch, chat, activity, and console routes.

## Rollback Strategy
- Keep alpha features modular so unstable surfaces can be disabled without breaking core chat.
- Prefer read-only console screens first to reduce rollback risk.
- If realtime activity proves noisy or brittle, degrade gracefully to recent-state summaries instead of shipping broken live views.

## Remaining Delivery Risks
- Gateway contracts may still need client-facing normalization.
- Auth and reconnect edge cases may take more time than the happy-path shell work.
- Over-indexing on admin depth could delay the mobile session core.
- Package choices for state, realtime transport, and local persistence should stay pragmatic and reversible.
