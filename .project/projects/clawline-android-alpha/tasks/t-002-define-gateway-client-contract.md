---
id: T-002
name: Define gateway client contract and connection model
status: in-progress
created: 2026-04-15T21:14:00Z
updated: 2026-04-15T22:38:34Z
linear_issue_id:
github_issue:
github_pr:
depends_on: []
conflicts_with: []
parallel: true
priority: high
estimate: M
---

# Task: Define gateway client contract and connection model

## Description
Translate the architecture into a concrete mobile client contract for connecting to OpenClaw, managing connection state, and retrieving session and operator data.

## Acceptance Criteria
- [x] Gateway connection assumptions are written down in implementation-facing form.
- [x] Connection lifecycle states are defined.
- [x] Session and activity data needed for the alpha are identified.
- [x] Open questions are called out instead of hidden in code.

## Technical Notes
- Stay gateway-first and avoid inventing a parallel backend layer.
- Separate authentication, connection transport, and domain state clearly.

## Definition of Done
- [x] Implementation complete
- [ ] Tests pass
- [ ] Review complete
- [x] Docs updated

## Evidence Log
- 2026-04-15: Task created from the architecture baseline and alpha planning pass.
- 2026-04-15: Added `app/clawline/lib/data/gateway/gateway_contract.dart` to define the alpha read contract for connection, sessions, transcript messages, activity, and console health.
- 2026-04-15: Added typed domain models in `app/clawline/lib/domain/models.dart` and service skeletons in `app/clawline/lib/services/` to separate transport, connection state, and session state.
- 2026-04-15: Captured open gateway questions in the contract comments and project decisions instead of burying them in UI code.
