---
name: WS-A Output Taxonomy and Renderers
owner: bart
status: planned
created: 2026-04-16T20:54:06Z
updated: 2026-04-16T20:54:06Z
---

# Workstream: WS-A Output Taxonomy and Renderers

## Objective

Decide which tool outputs deserve rich treatment first and implement the first reusable mobile renderers.

## Owned Files/Areas

- tool output classification logic
- selected rich renderers for high-value output types
- raw fallback framing inside the session UI

## Dependencies

- current tool output surfaces remain stable enough to extend
- target output types are identified from real ClawLine/OpenClaw usage

## Risks

- renderer sprawl if too many output types are tackled at once
- rich views may accidentally hide important debugging detail

## Handoff Criteria

- a small first set of tool outputs renders more clearly than plain blobs
- raw output remains available when needed
- renderer boundaries are reusable rather than one-off
