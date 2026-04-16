---
name: WS-A Composer and Transport
owner: bart
status: planned
created: 2026-04-16T20:54:06Z
updated: 2026-04-16T20:54:06Z
---

# Workstream: WS-A Composer and Transport

## Objective

Add mobile attachment entry points and the underlying OpenClaw-compatible send handling for image and generic file sharing.

## Owned Files/Areas

- `packages/happy-app` session composer surfaces
- attachment picker integration
- OpenClaw-backed attachment send path and metadata normalization

## Dependencies

- existing OpenClaw session path remains stable
- supported picker and file APIs already present in the app stack

## Risks

- send-path edge cases differ between image and generic file flows
- transport assumptions may break on larger files or slower mobile connections

## Handoff Criteria

- image and generic file attachment can be initiated from the composer
- send state is visible and recoverable
- payloads carry enough metadata for transcript rendering
