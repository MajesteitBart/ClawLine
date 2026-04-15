---
id: T-004
name: Implement session list and session header state
status: backlog
created: 2026-04-15T21:14:00Z
updated: 2026-04-15T21:14:00Z
linear_issue_id:
github_issue:
github_pr:
depends_on: [T-001, T-002, T-003]
conflicts_with: []
parallel: true
priority: high
estimate: M
---

# Task: Implement session list and session header state

## Description
Build the session list and active-session header so the app can express the session-first mental model clearly from the first connected flows.

## Acceptance Criteria
- [ ] Session list can render mocked or real gateway-backed session data.
- [ ] Active-session header shows enough route, agent, or state context to orient Bart.
- [ ] Switching sessions updates the active route and state cleanly.

## Technical Notes
- Avoid transport-specific naming in UI state.
- Keep session metadata explicit without overloading the screen.

## Definition of Done
- [ ] Implementation complete
- [ ] Tests pass
- [ ] Review complete
- [ ] Docs updated

## Evidence Log
- 2026-04-15: Task defined during the initial alpha breakdown.
