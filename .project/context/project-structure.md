# Project Structure

Document major repository boundaries and ownership.

## Canonical Boundaries
- `README.md`: repo purpose, project goal, and onboarding entry point.
- `AGENTS.md`: local agent guidance for Delano-style execution in this repository.
- `docs/architecture_outline.md`: current architecture baseline and planning source for the first alpha.
- `HANDBOOK.md`: Delano operating handbook and canonical delivery model.
- `.project/`: delivery truth for this repository, including context files and concrete project artifacts.
- `.agents/`: shared Delano runtime, rules, hooks, scripts, logs, and skills.
- `.claude/`: compatibility mirror for agents that still expect Claude-style runtime paths.
- `.delano/`: Delano support layer shipped by the installer.

## Runtime Areas
- `.agents/scripts/pm/`: Delano project lifecycle scripts (`init`, `validate`, `status`, `next`).
- `.agents/rules/`: policy and repository guardrails.
- `.agents/skills/`: Delano core skills plus imported Flutter skills.
- `.agents/hooks/`: logging and runtime hook utilities.

## Documentation Areas
- `docs/architecture_outline.md`: product architecture baseline.
- `.project/context/*.md`: repo-wide durable context.
- `.project/projects/<slug>/`: project-specific spec, plan, decisions, workstreams, tasks, and updates.

## Working Notes
- Keep shared docs and task artifacts repository-relative.
- Avoid absolute host-specific paths in committed documents.
- Treat imported skill packs as repo runtime assets, but patch them locally if they violate Delano validation rules.
