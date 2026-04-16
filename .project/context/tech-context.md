# Tech Context

## Stack
- Expo / React Native from the imported Happy monorepo as the new client foundation.
- Node.js + pnpm workspace structure from Happy for app/server/shared packages.
- Delano for project structure, planning contracts, and execution flow.
- Git and GitHub for source control and remote collaboration.
- OpenClaw Gateway remains the intended long-term runtime authority.

## Runtime Constraints
- Gateway should remain the source of truth. ClawLine should not settle into a parallel Happy control plane.
- The product is session-first, not channel-first.
- Clean chat UX and operator/debug depth must stay close together but clearly separated.
- Multimodal work should start with the smallest high-value surfaces first, especially image input and voice routing.
- Secure remote access should favor existing OpenClaw/Gateway patterns over inventing a second ownership model.

## Integration Points
- `docs/architecture_outline.md` for the OpenClaw mobile architecture baseline.
- `docs/happy-multimodal-fork-assessment.md` for the pivot and multimodal assessment.
- `packages/happy-app/` for the current mobile/web client base.
- `.agents/scripts/pm/*` for Delano project lifecycle actions.
- `.agents/skills/*` for retained local skill assets.
- `.project/projects/` for ClawLine delivery planning.
- GitHub repo `MajesteitBart/ClawLine` as the intended remote, with `upstream-happy` added for upstream sync.
