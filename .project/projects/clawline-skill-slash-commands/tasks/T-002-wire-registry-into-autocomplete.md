---
id: T-002
name: Wire skill registry into composer autocomplete
status: done
created: 2026-04-16T20:54:06Z
updated: 2026-04-16T21:30:36Z
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

Surface the registry-backed command metadata in the existing slash-command suggestion flow in the composer.

## Acceptance Criteria
- [x] Registry-backed commands appear in slash suggestions
- [x] Suggestions show clear labels, descriptions, and any lightweight hints that fit the current row design
- [x] Suggestion ranking remains usable on mobile

## Technical Notes

Reuse current autocomplete primitives rather than building a separate system. `T-001` already routes lookup through the registry; this task is the composer-facing polish pass.

## Definition of Done
- [x] Implementation complete
- [x] Tests pass
- [x] Review complete
- [x] Docs updated

## Evidence Log
- 2026-04-16: Task created from HANDBOOK-aligned project breakdown.
- 2026-04-16: Updated `AgentInputSuggestionView` to render registry-backed command labels, slash text, and lightweight argument hints in the composer suggestion row.
- 2026-04-16: Updated `suggestionCommands.ts` ranking to prefer exact command-prefix matches and include `argumentHint` in search.
- 2026-04-16: Updated `suggestions.ts` to insert registry-backed `insertText` values instead of reconstructing command text in the mapper.
- 2026-04-16: `pnpm --filter happy-app exec vitest run sources/sync/slashCommandRegistry.test.ts sources/sync/suggestionCommands.test.ts` passed.
- 2026-04-16: `pnpm --filter happy-app exec tsc --noEmit` passed.
- 2026-04-16: broader `happy-app` test script remains red due to unrelated pre-existing failures outside this task scope.
