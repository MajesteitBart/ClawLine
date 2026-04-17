---
timestamp: 2026-04-16T21:28:02Z
status: review
task: T-002
stream: WS-B
---

# Progress Update

## Completed
- Wired registry-backed command metadata into the composer-facing suggestion row.
- Rendered command label, slash text, and lightweight argument hints in `AgentInputSuggestionView`.
- Improved slash-command search ranking to prefer exact command-prefix matches and include argument hints.
- Updated the autocomplete mapper to use registry-provided `insertText`.
- Verified the changed scope with targeted `vitest` and package typecheck.

## In Progress
- None.

## Blockers
- None.

## Next Actions
- Move into `T-003` for predictable insertion and lightweight argument scaffolding.
- Keep the unrelated broader `happy-app` suite failures separate from this task stream.
