---
name: ClawLine Skill Slash Commands
slug: clawline-skill-slash-commands
owner: bart
status: approved
created: 2026-04-16T20:54:06Z
updated: 2026-04-16T21:20:22Z
outcome: Bart can discover and invoke OpenClaw skills from the ClawLine composer through custom slash commands with autocomplete, guidance, and safe parameter handoff.
uncertainty: low
probe_required: false
probe_status: skipped
---

# Spec: ClawLine Skill Slash Commands

## Executive Summary

ClawLine already has command and autocomplete patterns in the Happy-derived UI, and the current code already reads slash command availability from `session.metadata.slashCommands`. This project makes that path explicit and maintainable by defining a canonical registry overlay for curated command metadata, then using it to improve discovery and invocation inside the composer.

## Problem and Users

Bart wants fast skill access from mobile without remembering raw invocation details or falling back to desktop/operator workarounds. The current client already surfaces generic slash commands from session metadata, but that path is too thin: command metadata is scattered, descriptions are sparse, and there is no canonical contract for curated OpenClaw-relevant commands.

Primary user:
- Bart as a heavy OpenClaw skill user on mobile.

Secondary users later:
- other advanced users who need fast guided access to skills without raw tool literacy.

## Outcome and Success Metrics

- The composer suggests supported skill slash commands as Bart types.
- Bart can select a skill command, fill or confirm arguments, and send it into the current session without manual syntax hunting.
- Skill commands include lightweight help text or examples where needed.
- Misfires and malformed invocations become materially less common than raw text-only skill triggering.

## Scope
### In Scope
- registry overlay for metadata-backed slash commands
- autocomplete and ranking for skill commands in the composer
- inline argument scaffolding or prompting for common skill inputs
- help text, examples, and labels for discoverability
- routing selected skill commands into the existing OpenClaw session flow

### Out of Scope
- a full desktop-style command palette redesign
- complete skills management UI
- arbitrary custom scripting language inside the composer
- solving every complex skill configuration edge case in v1

## Functional Requirements

1. The composer must surface slash command suggestions for supported skills.
2. The suggestion UI must provide a human-readable label and brief description.
3. Selecting a slash command must insert or scaffold the invocation in a predictable way.
4. The flow must support common argument entry without forcing users to memorize exact syntax.
5. The sent result must route through the existing OpenClaw-backed session path.

## Non-Functional Requirements

- The interaction must stay fast enough for mobile typing.
- Commands must feel explicit and safe, not magical or ambiguous.
- The feature should reuse existing autocomplete and command surfaces where possible.
- The design should support adding more skills later without turning into a brittle hard-coded list.

## Hypotheses and Unknowns

- Existing autocomplete primitives in Happy are sufficient for a strong first version.
- `session.metadata.slashCommands` is the right availability source for now, with a local registry overlay adding labels, descriptions, and argument hints.
- Some skills may need richer parameter prompting than simple slash-command insertion.

## Touchpoints to Exercise

- `packages/happy-app` composer and autocomplete surfaces
- `packages/happy-app/sources/sync/suggestionCommands.ts`
- `packages/happy-app/sources/sync/storageTypes.ts`
- session send path for command-backed prompts

## Probe Findings

- Probe not required. This is a bounded product extension over already-present command and autocomplete behavior.

## Footguns Discovered

- Hard-coding slash commands into UI components will make future skill growth painful.
- Overloading the composer with too much inline form behavior could slow down the simple send flow.

## Remaining Unknowns

- Which curated commands should get richer labels and argument hints first.
- Whether complex skills need modal parameter collection instead of inline slash arguments.
- How much richer command metadata should live locally versus come from OpenClaw later.

## Dependencies

- existing command/autocomplete surfaces in `packages/happy-app`
- `session.metadata.slashCommands` already populated by the working OpenClaw-compatible session path
- a small canonical metadata contract for labels, descriptions, and argument hints

## Approval Notes

- Created after Bart explicitly confirmed skill slash commands should be one of the next three delivery projects.
