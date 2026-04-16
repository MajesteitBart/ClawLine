---
name: WS-B Transcript and Preview UX
owner: bart
status: planned
created: 2026-04-16T20:54:06Z
updated: 2026-04-16T20:54:06Z
---

# Workstream: WS-B Transcript and Preview UX

## Objective

Render shared and returned media cleanly inside sessions with mobile-friendly preview, open, and share actions.

## Owned Files/Areas

- session transcript renderers
- media preview and open/share actions
- outgoing and incoming attachment state presentation

## Dependencies

- WS-A composer and transport metadata is available
- artifact and media display primitives in the current UI can be reused

## Risks

- media cards may add clutter if not constrained carefully
- preview behavior can vary across platforms and file types

## Handoff Criteria

- shared and returned media are understandable in the transcript
- preview and open actions work for the first supported media classes
- failure and loading states remain clear on mobile
