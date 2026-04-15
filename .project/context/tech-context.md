# Tech Context

## Stack
- Flutter and Dart for the client application, with Android as the first target platform.
- Delano for project structure, planning contracts, and execution flow.
- Git and GitHub for source control and remote collaboration.
- OpenClaw gateway surfaces as the runtime backend: WebSocket chat/session state plus admin and control endpoints already used by WebChat and Control UI.

## Runtime Constraints
- Gateway is the source of truth. ClawLine should stay a mobile client over existing OpenClaw state, not invent a second control plane.
- The product is session-first, not channel-first.
- Clean chat UX and operator/debug depth must stay close together but clearly separated.
- Android reliability matters more than broad feature parity in the first alpha.
- Secure remote access should assume private networking first, especially Tailscale-style connectivity and authenticated gateway access.

## Integration Points
- `docs/architecture_outline.md` for the current architecture baseline.
- `.agents/scripts/pm/*` for Delano project lifecycle actions.
- `.agents/rules/*` for repository guardrails.
- `.agents/skills/*` including the added Flutter skill pack.
- `.project/projects/clawline-android-alpha/` for the first delivery project.
- GitHub repo `MajesteitBart/ClawLine` as the intended remote.
