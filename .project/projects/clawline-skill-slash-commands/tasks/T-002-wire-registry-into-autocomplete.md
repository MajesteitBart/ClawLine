---
id: T-002
name: Wire skill registry into composer autocomplete
status: backlog
created: 2026-04-16T20:54:06Z
updated: 2026-04-16T20:54:06Z
linear_issue_id:
github_issue:
github_pr:
depends_on: [T-001]
conflicts_with: []
parallel: false
priority: high
estimate: M
---

# Task: Wire skill registry into composer autocomplete

## Description

Connect the skill command registry to the existing slash-command suggestion flow in the composer.

## Acceptance Criteria
- [ ] Supported skills appear in slash suggestions
- [ ] Suggestions show clear labels and descriptions
- [ ] Suggestion ranking remains usable on mobile

## Technical Notes

Reuse current autocomplete primitives rather than building a separate system.

## Definition of Done
- [ ] Implementation complete
- [ ] Tests pass
- [ ] Review complete
- [ ] Docs updated

## Evidence Log
- 2026-04-16: Task created from HANDBOOK-aligned project breakdown.
