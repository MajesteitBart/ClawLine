---
name: WS-A Skill Command Registry
owner: bart
status: planned
created: 2026-04-16T20:54:06Z
updated: 2026-04-16T20:54:06Z
---

# Workstream: WS-A Skill Command Registry

## Objective

Define the registry-backed metadata model for supported skill slash commands, including names, descriptions, and argument hints.

## Owned Files/Areas

- skill command metadata definitions
- command discovery and lookup logic
- lightweight contract for labels, descriptions, and examples

## Dependencies

- existing OpenClaw skill invocation path remains available
- current composer autocomplete can consume registry-backed suggestions

## Risks

- metadata may drift if skill names or usage evolve without a stable contract
- over-modeling the registry too early may slow delivery

## Handoff Criteria

- supported skills can be described by one canonical registry
- registry data is sufficient to drive autocomplete and insertion
- the initial curated skill set is explicit and testable
