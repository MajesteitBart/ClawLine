# Decisions: ClawLine Skill Slash Commands

## Initial Decisions

- Reuse the existing slash-command and autocomplete primitives in the Happy-derived composer.
- Introduce a registry-backed skill metadata layer instead of hard-coded UI logic.
- Start with a curated set of high-value skills rather than full skill coverage.

## Open Questions

- Which skills belong in the first supported set?
- Which skills need richer argument prompting beyond inline slash syntax?
