---
id: T-003
name: Build app shell and primary navigation
status: backlog
created: 2026-04-15T21:14:00Z
updated: 2026-04-15T21:14:00Z
linear_issue_id:
github_issue:
github_pr:
depends_on: [T-001]
conflicts_with: []
parallel: true
priority: high
estimate: M
---

# Task: Build app shell and primary navigation

## Description
Implement the first runnable app shell with the alpha navigation model for Chats, Activity, Console, and Settings.

## Acceptance Criteria
- [ ] Bottom-level navigation reflects the planned IA.
- [ ] Core routes render placeholder or scaffold content cleanly.
- [ ] Shared empty, loading, and error states exist.
- [ ] The shell feels intentionally mobile, not like a squeezed desktop panel.

## Technical Notes
- Keep Device as a nested console/settings concept unless the implementation proves it deserves a top-level surface.
- Use the architecture outline as the IA source.

## Definition of Done
- [ ] Implementation complete
- [ ] Tests pass
- [ ] Review complete
- [ ] Docs updated

## Evidence Log
- 2026-04-15: Task queued after workspace bootstrap.
