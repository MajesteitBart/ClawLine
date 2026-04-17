---
id: T-003
name: Add skill invocation insertion and argument guidance
status: done
created: 2026-04-16T20:54:06Z
updated: 2026-04-16T21:32:26Z
linear_issue_id:
github_issue:
github_pr:
depends_on: [T-002]
conflicts_with: []
parallel: false
priority: high
estimate: M
---

# Task: Add skill invocation insertion and argument guidance

## Description

Make selected skill commands insert predictably and support lightweight argument scaffolding for the first curated skill set.

## Acceptance Criteria
- [x] Selecting a skill command inserts or scaffolds the invocation predictably
- [x] Common arguments can be entered without raw syntax hunting
- [x] Sent invocations route cleanly through the existing OpenClaw session flow

## Technical Notes

Keep the first version lightweight and avoid over-building inline forms.

## Definition of Done
- [x] Implementation complete
- [x] Tests pass
- [x] Review complete
- [x] Docs updated

## Evidence Log
- 2026-04-16: Task created from HANDBOOK-aligned project breakdown.
- 2026-04-16: Added scaffold-aware slash command insertion via `getSlashCommandInsertion()` so curated commands can provide lightweight argument templates.
- 2026-04-16: Updated `applySuggestion()` and `AgentInput` selection handling so command insertion can highlight the first placeholder token instead of dropping the cursor at the end.
- 2026-04-16: Curated `debug` now inserts `/debug [topic]` and selects `[topic]` for immediate overwrite.
- 2026-04-16: `pnpm --filter happy-app exec vitest run sources/components/autocomplete/applySuggestion.test.ts sources/sync/slashCommandRegistry.test.ts sources/sync/suggestionCommands.test.ts` passed.
- 2026-04-16: `pnpm --filter happy-app exec tsc --noEmit` passed.
- 2026-04-16: broader `happy-app` test script remains red due to unrelated pre-existing failures outside this task scope.
