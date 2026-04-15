---
id: T-001
name: Bootstrap Flutter workspace and toolchain
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

# Task: Bootstrap Flutter workspace and toolchain

## Description
Create the initial Flutter application workspace for ClawLine, add the minimal package structure needed for growth, and ensure the repo can build and run a baseline shell.

## Acceptance Criteria
- [x] Flutter application scaffold exists in the repo.
- [x] Core package/dependency choices needed for the alpha baseline are documented in code or repo docs.
- [x] A basic app entry point builds successfully.
- [x] The repo reflects the app-first structure instead of planning-only scaffolding.

## Technical Notes
- Align the app structure with the session-first architecture.
- Keep package choices pragmatic and reversible.
- Avoid premature feature scaffolding that the first alpha does not need.

## Definition of Done
- [x] Implementation complete
- [ ] Tests pass
- [ ] Review complete
- [x] Docs updated

## Evidence Log
- 2026-04-15: Task created from the initial Delano project breakdown.
- 2026-04-15: Replaced the stock counter app with a real ClawLine shell under `app/clawline/lib/` and documented the workspace slice in `app/clawline/README.md`.
- 2026-04-15: `flutter analyze --no-pub` passed via the repo-local wrapper after wiring the shell, theme baseline, and service skeletons.
- 2026-04-15: `flutter pub get` completed successfully in `app/clawline` via the repo-local wrapper.
- 2026-04-15: `flutter test` starts and reaches the current widget and service specs, but the runner does not exit cleanly in this environment yet, so test completion still needs follow-up.
