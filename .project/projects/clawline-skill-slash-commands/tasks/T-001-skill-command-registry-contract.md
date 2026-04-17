---
id: T-001
name: Define skill command registry contract
status: done
created: 2026-04-16T20:54:06Z
updated: 2026-04-16T21:28:02Z
linear_issue_id:
github_issue:
github_pr:
depends_on: []
conflicts_with: []
parallel: true
priority: high
estimate: S
---

# Task: Define skill command registry contract

## Description

Create the canonical metadata shape for supported slash commands, using the existing `session.metadata.slashCommands` path as the availability source and layering curated metadata on top.

## Acceptance Criteria
- [x] Registry contract is defined
- [x] First supported command set is explicit
- [x] Registry is sufficient to drive autocomplete suggestions

## Technical Notes

Prefer a small registry-backed model over hard-coded UI conditionals. Keep the first slice grounded in the current metadata-backed command flow rather than inventing a separate skill runtime contract.

## Definition of Done
- [x] Implementation complete
- [x] Tests pass
- [x] Review complete
- [x] Docs updated

## Evidence Log
- 2026-04-16: Task created from HANDBOOK-aligned project breakdown.
- 2026-04-16: Tightened task scope to match the real code path: existing slash commands already come from `session.metadata.slashCommands`.
- 2026-04-16: Added `packages/happy-app/sources/sync/slashCommandRegistry.ts` as the canonical registry overlay and refactored `suggestionCommands.ts` to consume it.
- 2026-04-16: Verified the registry contract with targeted `vitest` coverage for normalization, deduplication, filtering, and registry-backed command lookup.
- 2026-04-16: `pnpm --filter happy-app exec vitest run sources/sync/slashCommandRegistry.test.ts sources/sync/suggestionCommands.test.ts` passed.
- 2026-04-16: `pnpm --filter happy-app exec tsc --noEmit` passed.
- 2026-04-16: `bash .agents/scripts/pm/validate.sh` passed.
- 2026-04-16: `pnpm --filter happy-app test -- run ...` still fails due to unrelated pre-existing suite failures in `settings.spec.ts`, `modeHacks.test.ts`, `modelModeOptions.test.ts`, and `parseMarkdownBlock.test.ts`.
