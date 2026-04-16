---
name: ClawLine Skill Slash Commands
slug: clawline-skill-slash-commands
owner: bart
status: approved
created: 2026-04-16T20:54:06Z
updated: 2026-04-16T20:54:06Z
outcome: Bart can discover and invoke OpenClaw skills from the ClawLine composer through custom slash commands with autocomplete, guidance, and safe parameter handoff.
uncertainty: low
probe_required: false
probe_status: skipped
---

# Spec: ClawLine Skill Slash Commands

## Executive Summary

ClawLine already has command and autocomplete patterns in the Happy-derived UI. This project turns skills into a first-class mobile interaction surface by adding custom slash commands for skill invocation, discovery, and parameter guidance directly inside the composer.

## Problem and Users

Bart wants fast skill access from mobile without remembering raw invocation details or falling back to desktop/operator workarounds. The current client has enough command/autocomplete infrastructure to support this, but skills are not yet surfaced as a clean, explicit slash-command layer.

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
- skill slash command registration model
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
- A registry-driven skill metadata layer will scale better than hard-coding commands directly in the input component.
- Some skills may need richer parameter prompting than simple slash-command insertion.

## Touchpoints to Exercise

- `packages/happy-app` composer and autocomplete surfaces
- skill metadata and discovery path exposed through OpenClaw-compatible flows
- session send path for command-backed prompts

## Probe Findings

- Probe not required. This is a bounded product extension over already-present command and autocomplete behavior.

## Footguns Discovered

- Hard-coding slash commands into UI components will make future skill growth painful.
- Overloading the composer with too much inline form behavior could slow down the simple send flow.

## Remaining Unknowns

- Which skills should be supported in the first command set versus later.
- Whether complex skills need modal parameter collection instead of inline slash arguments.
- How much skill metadata should live locally versus come from OpenClaw.

## Dependencies

- existing command/autocomplete surfaces in `packages/happy-app`
- OpenClaw skill execution patterns already available through the working client path
- a small canonical metadata contract for skill labels, descriptions, and argument hints

## Approval Notes

- Created after Bart explicitly confirmed skill slash commands should be one of the next three delivery projects.
