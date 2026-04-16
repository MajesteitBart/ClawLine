# Project Structure

Document major repository boundaries and ownership.

## Canonical Boundaries
- `README.md`: repo purpose and pivot summary.
- `AGENTS.md`: local agent guidance for Delano-style execution in this repository.
- `docs/architecture_outline.md`: original OpenClaw mobile architecture baseline.
- `docs/happy-multimodal-fork-assessment.md`: current pivot and multimodal assessment.
- `HANDBOOK.md`: Delano operating handbook and canonical delivery model.
- `.project/`: delivery truth for this repository, including context files and concrete project artifacts.
- `.agents/`: shared Delano runtime, rules, hooks, scripts, logs, and skills.
- `.delano/`: Delano support layer shipped by the installer.

## Runtime Areas
- `packages/happy-app/`: imported Expo / React Native app base.
- `packages/happy-agent/`: upstream agent helper package.
- `packages/happy-cli/`: upstream CLI package.
- `packages/happy-server/`: upstream backend package, useful for study and selective reuse.
- `packages/happy-wire/`: upstream session and protocol work.
- `.agents/scripts/pm/`: Delano project lifecycle scripts (`init`, `validate`, `status`, `next`).
- `.agents/skills/`: Delano core skills plus retained custom repo skill assets.

## Documentation Areas
- `docs/architecture_outline.md`: OpenClaw product baseline.
- `docs/happy-multimodal-fork-assessment.md`: adaptation guidance for the new base.
- `.project/context/*.md`: repo-wide durable context.
- `.project/projects/<slug>/`: project-specific spec, plan, decisions, workstreams, tasks, and updates.

## Working Notes
- The previous custom Flutter app has been intentionally removed.
- The imported Happy codebase is the new implementation base, but not the final product model.
- Preserve Delano planning truth while adapting the runtime stack.
