---
name: WS-B Composer Invocation UX
owner: bart
status: planned
created: 2026-04-16T20:54:06Z
updated: 2026-04-16T20:54:06Z
---

# Workstream: WS-B Composer Invocation UX

## Objective

Integrate registry-backed skill slash commands into the composer with autocomplete, predictable insertion, and lightweight argument guidance.

## Owned Files/Areas

- composer slash-command suggestion flow
- autocomplete ranking and insertion behavior
- argument scaffolding and validation UX

## Dependencies

- WS-A skill registry exists
- current slash-command primitives in the Happy-derived composer remain reusable

## Risks

- intrusive inline prompting could make the composer feel heavier
- too many suggestions could reduce relevance on mobile

## Handoff Criteria

- supported skills appear in slash-command suggestions
- choosing a skill inserts or scaffolds the invocation predictably
- common argument entry works without raw syntax hunting
