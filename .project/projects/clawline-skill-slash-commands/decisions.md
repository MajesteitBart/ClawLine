# Decisions: ClawLine Skill Slash Commands

## Initial Decisions

- Reuse the existing slash-command and autocomplete primitives in the Happy-derived composer.
- Treat `session.metadata.slashCommands` as the current command availability source.
- Introduce a registry-backed metadata overlay instead of hard-coded UI logic.
- Start with a curated set of high-value skills rather than full skill coverage.

## Open Questions

- Which metadata-backed commands belong in the first curated set of richer labels and hints?
- Which skills need richer argument prompting beyond inline slash syntax?
