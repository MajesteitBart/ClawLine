---
id: T-006
name: Build activity feed and approvals view
status: backlog
created: 2026-04-15T21:14:00Z
updated: 2026-04-15T21:14:00Z
linear_issue_id:
github_issue:
github_pr:
depends_on: [T-002, T-003, T-004]
conflicts_with: []
parallel: true
priority: medium
estimate: M
---

# Task: Build activity feed and approvals view

## Description
Implement the operator activity surface that shows live run state, tool activity, and approvals visibility in a mobile-appropriate way.

## Acceptance Criteria
- [ ] Activity feed distinguishes useful operator events from chat content.
- [ ] Approvals state is visible and actionable in the UI model, even if first interactions stay shallow.
- [ ] Recent failure or warning states can be surfaced without noisy raw logs by default.

## Technical Notes
- Favor summaries first, raw detail on demand.
- Stay close to session context where possible.

## Definition of Done
- [ ] Implementation complete
- [ ] Tests pass
- [ ] Review complete
- [ ] Docs updated

## Evidence Log
- 2026-04-15: Task defined from the operator-value requirements in the architecture.
