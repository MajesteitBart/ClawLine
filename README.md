# ClawLine

ClawLine is **built on Happy** and focused on **OpenClaw mobile integration**.

This repo has pivoted from the earlier custom Flutter alpha into a Happy-based mobile fork adapted toward the OpenClaw gateway and session model.

## What changed

- The previous Flutter app shell under `app/clawline` has been removed.
- The repository now contains an imported snapshot of [`slopus/happy`](https://github.com/slopus/happy) as the new codebase foundation.
- The existing ClawLine delivery and architecture layer is intentionally retained:
  - `.agents/`
  - `.project/`
  - `.delano/`
  - `docs/architecture_outline.md`

## Upstream base

- Upstream remote: `upstream-happy`
- Imported upstream commit: `ea41c4c`

This keeps the repo aligned with a real mobile product that already has:
- Expo / React Native app foundations
- mobile + web client structure
- session-oriented chat UI
- remote sync infrastructure
- voice architecture
- protocol and attachment design work already in progress

## ClawLine product direction

The intended fork direction is:

- keep Happy's strongest mobile UX and infrastructure patterns,
- replace Happy's provider and machine-centric assumptions with OpenClaw's gateway and session model,
- preserve ClawLine's Delano planning, architecture, and custom skills,
- push toward a genuinely multimodal OpenClaw mobile client.

## Important local docs

- `docs/architecture_outline.md`: original OpenClaw mobile architecture baseline
- `docs/happy-multimodal-fork-assessment.md`: current assessment of what Happy gives us and how to adapt it
- `.project/context/`: repo planning and delivery context

## Key repo areas

- `packages/happy-app/`: imported mobile and web client base
- `packages/happy-agent/`: agent control layer from Happy
- `packages/happy-cli/`: CLI wrapper from Happy
- `packages/happy-server/`: Happy backend implementation
- `packages/happy-wire/`: protocol and wire-layer types
- `.agents/`: retained Delano runtime and skill layer for ClawLine
- `.project/`: retained project planning and execution truth

## Recommended implementation stance

Use Happy as the new interaction shell and mobile foundation, but treat OpenClaw Gateway as the long-term source of truth. The best next step is not to rebrand everything immediately, but to adapt the mobile app surface and session model first, then replace backend assumptions slice by slice.
