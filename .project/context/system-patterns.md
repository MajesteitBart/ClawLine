# System Patterns

Capture architecture and delivery patterns that should be reused.

## Handbook-First Delivery
- Delano remains the operating model for this repository.
- Architecture and delivery intent should stay explicit in `docs/` and `.project/`, even while the codebase foundation changes.

## OpenClaw-Authority Pattern
- OpenClaw Gateway should remain the long-term authority for sessions, tools, approvals, nodes, logs, cron, skills, and state.
- Imported upstream infrastructure is a means to accelerate the client, not a replacement for the core OpenClaw system model.

## Happy-as-Shell Pattern
- Reuse Happy for the mobile shell, interaction patterns, and selected protocol ideas.
- Do not inherit Happy's provider/machine/server assumptions blindly.
- Adapt incrementally: keep what improves mobile UX, replace what conflicts with OpenClaw architecture.

## File-Contract-First State
- Repository truth lives in committed markdown and registry files, not in chat memory.
- `docs/architecture_outline.md` remains the product baseline.
- `docs/happy-multimodal-fork-assessment.md` captures the current pivot rationale.
- `.project/context/` holds repo-wide truth.

## Session-First Product Surface
- Sessions remain the core user-facing unit of work.
- Chat, activity, and console views should reinforce the same session and gateway mental model.

## Multimodal-in-Slices
- Add multimodal capabilities in high-value layers rather than all at once.
- Preferred order: text foundation first, then image input/rendering, then voice adaptation, then richer artifact and device flows.

## Conservative Pivoting
- Preserve recoverability when replacing foundations.
- Prefer upstream remotes and documented imported commits over opaque copy-pastes.
- Keep repo-specific planning and skills intact during infrastructure swaps.
