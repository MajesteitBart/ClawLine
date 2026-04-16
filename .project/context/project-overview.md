# Project Overview

## Mission
- Build ClawLine as an OpenClaw mobile product on top of a Happy-derived Expo / React Native base.
- Preserve the original operator-first architecture while pivoting away from the earlier custom Flutter shell.
- Make mobile OpenClaw materially better than Telegram for daily operator workflows, with a credible path toward multimodal interaction.

## Active Delivery Scopes
- Re-establish the alpha on the new Happy-based foundation.
- Adapt the imported mobile shell to OpenClaw Gateway sessions and operator state.
- Preserve Delano planning, custom skills, and architecture context while the implementation base changes.

## Current Health
- Delano runtime and repo planning assets remain intact in `.agents/`, `.project/`, and `.delano/`.
- The old Flutter alpha shell under `app/clawline` has been removed.
- An upstream snapshot of `slopus/happy` now provides the main codebase foundation, including `packages/happy-app`, `packages/happy-server`, and related workspace packages.
- Main near-term risks are backend-model mismatch, attachment transport design, and avoiding a parallel control plane instead of reusing OpenClaw Gateway.
