# ClawLine

ClawLine is the start of a Flutter-based OpenClaw mobile product, initially focused on Android.

## Project goal

Build a session-first operator console plus node companion for OpenClaw that is materially better for daily mobile use than Telegram.

The product should let Bart:
- work across multiple OpenClaw sessions from mobile,
- monitor live runs, approvals, failures, and tool activity,
- manage key gateway, node, channel, and skill state,
- and use voice, attachments, and device capabilities in a way that fits real mobile workflows.

## Source architecture

The current source architecture for this repo lives here:
- [`docs/architecture_outline.md`](docs/architecture_outline.md)

That document is the planning baseline for the first Delano project in this repository.

## Delivery approach

This repo uses Delano as its delivery system.

High-level flow:
1. align on the architecture and product intent,
2. fill the Delano context pack in `.project/context/`,
3. create the first Delano project from the architecture,
4. break work into workstreams and atomic tasks,
5. implement in small verified slices.

## Key repo areas

- `docs/architecture_outline.md`: current architecture baseline
- `.project/context/`: repo and product context files for Delano
- `.project/projects/`: delivery projects created from approved plans
- `.agents/`: shared Delano runtime, rules, hooks, and skills
- `HANDBOOK.md`: Delano operating handbook

## First milestone

Translate the architecture outline into the first executable Delano project for the ClawLine alpha, likely covering:
- app shell and navigation,
- gateway connection model,
- session-first chat foundation,
- operator activity surfaces,
- and initial Flutter app structure.
