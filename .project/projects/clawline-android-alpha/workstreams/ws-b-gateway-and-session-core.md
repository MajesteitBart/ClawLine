---
name: WS-B Gateway and Session Core
owner: bart
status: in-progress
created: 2026-04-15T21:14:00Z
updated: 2026-04-15T22:38:34Z
---

# Workstream: WS-B Gateway and Session Core

## Objective
Define and implement the connection and session foundation so ClawLine can reliably talk to an OpenClaw gateway and present session-first mobile workflows.

## Owned Files/Areas
- Gateway client contract and environment configuration.
- Connection lifecycle and reconnect states.
- Session list, session metadata, and active-session state.
- Chat transcript and composer shell wiring.

## Dependencies
- Depends on WS-A for app shell and shared UX scaffolding.

## Risks
- Realtime contract uncertainty.
- Auth, pairing, or reconnect edge cases.
- Blurring transport-specific concerns into the session model.

## Handoff Criteria
- App can connect to a target gateway.
- Session list renders from real or mocked gateway data.
- Active chat shell works with clear loading and error states.

## Progress Notes
- A typed gateway repository contract now defines the alpha read model for connection, sessions, activity, and console health.
- Connection and session services are wired against a fake repository so the shell can run before the live gateway adapter lands.
