# System Patterns

Capture architecture and delivery patterns that should be reused.

## Handbook-First Delivery
- Delano is the operating model for this repository.
- Architecture and delivery intent should move from `docs/architecture_outline.md` into `.project/context/` and `.project/projects/` before implementation expands.

## File-Contract-First State
- Repository truth lives in committed markdown and registry files, not in chat memory.
- `docs/architecture_outline.md` is the current product baseline.
- `.project/context/` holds repo-wide truth.
- `.project/projects/clawline-android-alpha/` holds the first executable alpha plan.

## Gateway-First Mobile Client
- ClawLine should reuse existing OpenClaw gateway state and control surfaces.
- New mobile work should favor thin, explicit client layers over backend reinvention.

## Session-First Product Surface
- Sessions are the core user-facing unit of work.
- Chat, activity, and console views should all reinforce the same session and gateway mental model.

## Compatibility Without Dual Truth
- Compatibility directories such as `.claude/` may exist, but `.agents/` and `.project/` remain canonical.
- Do not maintain competing descriptions of the product or delivery state across multiple doc systems.

## Conservative Installation
- Prefer additive, reversible changes in the early repo stage.
- Validate before publishing major project-structure updates.
- Keep imported third-party skill content aligned with local repo rules when necessary.
