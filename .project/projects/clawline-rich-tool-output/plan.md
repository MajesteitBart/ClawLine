---
name: ClawLine Rich Tool Output
status: planned
lead: bart
created: 2026-04-16T20:54:06Z
updated: 2026-04-16T20:54:06Z
linear_project_id:
risk_level: medium
spec_status_at_plan_time: approved
---

# Delivery Plan: ClawLine Rich Tool Output

## What Changed After Probe

- No dedicated probe loop was needed.
- Scope is framed around higher-value renderers and actions first, not a whole-system visual rewrite.

## Architecture Decisions

- Prefer a small set of reusable rich renderers for high-value outputs.
- Keep raw output access available alongside richer presentation.
- Reuse current artifact and tool surfaces before inventing a parallel activity model.

## Probe-Driven Architecture Changes

- None.

## Workstream Design

1. Output taxonomy
   - decide which tool outputs stay raw and which deserve rich treatment first

2. Renderer upgrades
   - implement richer cards, previews, and structured sections for selected outputs

3. Action affordances
   - add open, copy, retry, share, or similar safe follow-up actions

4. Artifact coherence
   - align transcript rendering and artifact views so outputs feel like one system

## Milestone Strategy

- Milestone 1: selected high-value tool outputs render more clearly in sessions
- Milestone 2: artifact and generated-output previews support useful follow-up actions
- Milestone 3: raw-versus-rich balance is polished for real operator use on mobile

## Rollout Strategy

- Start with a narrow output set that Bart hits often.
- Keep raw fallback views until richer rendering is proven trustworthy.
- Expand renderer coverage incrementally based on actual session use.

## Test Strategy

- session rendering tests for mixed text, tools, and artifacts
- mobile interaction tests for card actions and preview flows
- regression checks to ensure raw output remains available when rich views are used

## Rollback Strategy

- keep renderer selection layered so specific rich views can fall back to plain output
- avoid schema lock-in that would make raw transcript rendering impossible

## Remaining Delivery Risks

- renderer sprawl and maintenance overhead
- hiding debugging detail behind overly polished cards
- blurred scope boundary between this project and multimedia sharing
