# Project Style Guide

## Naming
- Use kebab-case for project slugs and repository-facing structural identifiers.
- Use `WS-*` names for workstreams and `T-###` identifiers for tasks.
- Keep task names short, implementation-oriented, and specific enough to verify.

## Documentation Conventions
- Use UTC ISO timestamps in frontmatter.
- Prefer repository-relative paths in markdown.
- Keep architecture language aligned with `docs/architecture_outline.md` unless an explicit project decision updates the baseline.
- When a decision changes delivery shape, record it in the project `decisions.md` instead of burying it in chat.

## Review Expectations
- `delano validate` should pass before publishing major planning changes.
- No placeholder frontmatter or empty template sections should remain in active project files.
- Planning updates should leave the next dependency-safe task obvious.
- For UI work, collect at least brief smoke evidence and note any major visual or usability gaps before calling work review-ready.
