---
id: T-008
name: Implement auth and reconnect flows
status: backlog
created: 2026-04-15T21:14:00Z
updated: 2026-04-15T21:14:00Z
linear_issue_id:
github_issue:
github_pr:
depends_on: [T-002, T-004, T-005]
conflicts_with: []
parallel: true
priority: medium
estimate: L
---

# Task: Implement auth and reconnect flows

## Description
Add the connection, authentication, and reconnect behavior needed to make the alpha trustworthy outside happy-path demos.

## Acceptance Criteria
- [ ] Connection states are clear and recoverable.
- [ ] Auth failures and expired state are surfaced usefully.
- [ ] Reconnect behavior does not leave the app in misleading or stale state.

## Technical Notes
- Keep auth and transport concerns separate from domain UI state.
- Design for real mobile interruptions and app lifecycle transitions.

## Definition of Done
- [ ] Implementation complete
- [ ] Tests pass
- [ ] Review complete
- [ ] Docs updated

## Evidence Log
- 2026-04-15: Task created because reliability is part of the alpha value proposition.
