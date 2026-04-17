---
name: WS-A Skill Command Registry
owner: bart
status: done
created: 2026-04-16T20:54:06Z
updated: 2026-04-16T21:32:26Z
---

# Workstream: WS-A Skill Command Registry

## Objective

Define the registry-backed metadata model for supported slash commands, layering curated metadata over the existing `session.metadata.slashCommands` availability path.

## Owned Files/Areas

- slash command metadata definitions
- command discovery and lookup logic
- `packages/happy-app/sources/sync/suggestionCommands.ts`
- lightweight contract for labels, descriptions, and examples

## Dependencies

- existing OpenClaw session metadata continues to expose `slashCommands`
- current composer autocomplete can consume registry-backed suggestions

## Risks

- metadata may drift if skill names or usage evolve without a stable contract
- over-modeling the registry too early may slow delivery

## Handoff Criteria

- supported metadata-backed commands can be described by one canonical registry
- registry data is sufficient to drive autocomplete and insertion
- the initial curated command set is explicit and testable
