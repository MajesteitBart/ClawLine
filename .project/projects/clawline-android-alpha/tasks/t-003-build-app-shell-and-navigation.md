---
id: T-003
name: Build app shell and primary navigation
status: in-progress
created: 2026-04-15T21:14:00Z
updated: 2026-04-15T22:38:34Z
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
- [x] Bottom-level navigation reflects the planned IA.
- [x] Core routes render placeholder or scaffold content cleanly.
- [x] Shared empty, loading, and error states exist.
- [x] The shell feels intentionally mobile, not like a squeezed desktop panel.

## Technical Notes
- Keep Device as a nested console/settings concept unless the implementation proves it deserves a top-level surface.
- Use the architecture outline as the IA source.

## Definition of Done
- [x] Implementation complete
- [ ] Tests pass
- [ ] Review complete
- [x] Docs updated

## Evidence Log
- 2026-04-15: Task queued after workspace bootstrap.
- 2026-04-15: Added the first ClawLine shell with Chats, Activity, Console, and Settings destinations plus shared cards, status pills, and a product-specific theme baseline.
