---
id: T-002
name: Define gateway client contract and connection model
status: ready
created: 2026-04-15T21:14:00Z
updated: 2026-04-15T21:14:00Z
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
- [ ] Gateway connection assumptions are written down in implementation-facing form.
- [ ] Connection lifecycle states are defined.
- [ ] Session and activity data needed for the alpha are identified.
- [ ] Open questions are called out instead of hidden in code.

## Technical Notes
- Stay gateway-first and avoid inventing a parallel backend layer.
- Separate authentication, connection transport, and domain state clearly.

## Definition of Done
- [ ] Implementation complete
- [ ] Tests pass
- [ ] Review complete
- [ ] Docs updated

## Evidence Log
- 2026-04-15: Task created from the architecture baseline and alpha planning pass.
