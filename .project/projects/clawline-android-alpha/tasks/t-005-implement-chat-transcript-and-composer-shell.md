---
id: T-005
name: Implement chat transcript and composer shell
status: backlog
created: 2026-04-15T21:14:00Z
updated: 2026-04-15T21:14:00Z
linear_issue_id:
github_issue:
github_pr:
depends_on: [T-003, T-004]
conflicts_with: []
parallel: true
priority: high
estimate: L
---

# Task: Implement chat transcript and composer shell

## Description
Create the first usable chat surface for active sessions, including transcript rendering, input state, and extension points for attachments and voice.

## Acceptance Criteria
- [ ] Transcript renders session messages clearly in mobile layout.
- [ ] Composer supports typed input and exposes hooks for future voice or attachment actions.
- [ ] Loading, sending, and failure states are obvious.

## Technical Notes
- Keep clean chat as the default mode.
- Operator/debug depth should be reachable, not always visible.

## Definition of Done
- [ ] Implementation complete
- [ ] Tests pass
- [ ] Review complete
- [ ] Docs updated

## Evidence Log
- 2026-04-15: Task created for the first real mobile interaction surface.
