---
name: ClawLine Skill Slash Commands
status: planned
lead: bart
created: 2026-04-16T20:54:06Z
updated: 2026-04-16T20:54:06Z
linear_project_id:
risk_level: low
spec_status_at_plan_time: approved
---

# Delivery Plan: ClawLine Skill Slash Commands

## What Changed After Probe

- No probe loop was needed.
- Scope is kept product-focused: discovery, invocation, and argument guidance, not full skill administration.

## Architecture Decisions

- Reuse existing slash-command and autocomplete primitives in the Happy-derived composer.
- Introduce a skill command registry instead of scattering skill knowledge across input components.
- Keep first-run invocation simple, then layer richer argument helpers only where they clearly reduce friction.

## Probe-Driven Architecture Changes

- None.

## Workstream Design

1. Skill metadata and registry
   - define command name, label, description, and argument hints

2. Composer autocomplete integration
   - plug registry-backed suggestions into current slash-command flows

3. Invocation UX
   - insert commands predictably and support lightweight argument help

4. Validation and safety
   - handle unsupported skills, malformed input, and stale metadata cleanly

## Milestone Strategy

- Milestone 1: registry-backed skill suggestions appear in the composer
- Milestone 2: selected skills can be inserted and invoked reliably
- Milestone 3: argument guidance and help text reduce friction for common skills

## Rollout Strategy

- Start with a narrow curated set of high-value skills.
- Validate usability in real mobile conversations before expanding the registry.
- Keep plain text sending untouched for users who do not use slash commands.

## Test Strategy

- composer autocomplete tests for filtering, ranking, insertion, and cursor behavior
- mobile typing tests around slash prefixes and argument editing
- real-session validation that command-backed prompts execute correctly through OpenClaw

## Rollback Strategy

- isolate registry wiring so slash suggestions can be disabled without harming standard composer behavior
- keep command invocation expressed as normal session sends where possible

## Remaining Delivery Risks

- poor argument UX could make commands feel heavier instead of faster
- metadata drift if skill definitions change without a stable contract
- too many commands too early could reduce suggestion quality
