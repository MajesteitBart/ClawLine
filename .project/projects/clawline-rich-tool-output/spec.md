---
name: ClawLine Rich Tool Output
slug: clawline-rich-tool-output
owner: bart
status: approved
created: 2026-04-16T20:54:06Z
updated: 2026-04-16T20:54:06Z
outcome: Bart can understand tool results, generated artifacts, and actionable outputs on mobile through richer rendering, previews, and session-safe actions inside ClawLine.
uncertainty: medium
probe_required: false
probe_status: skipped
---

# Spec: ClawLine Rich Tool Output

## Executive Summary

ClawLine already exposes tool activity and artifact-oriented surfaces from Happy, but the next product step is to make tool results genuinely useful on mobile. This project improves how structured tool output, generated media, and session artifacts appear and behave so Bart can read, inspect, open, copy, and act on them from his phone.

## Problem and Users

Raw tool output is often too dense, too plain, or too awkward on mobile. Bart needs a cleaner way to understand what happened, what was generated, and what he can do next without losing the underlying truth of the output.

Primary user:
- Bart as a mobile OpenClaw operator who needs trustworthy tool visibility.

Secondary users later:
- power users who need clearer artifact and tool-result ergonomics without desktop views.

## Outcome and Success Metrics

- Important tool outputs render with clearer structure than generic text blobs.
- Generated artifacts and returned files can be previewed or opened from the session in a mobile-friendly way.
- Action-heavy outputs support useful affordances such as open, copy, retry, or share where appropriate.
- Bart can inspect common tool results from mobile without immediately needing desktop or raw logs.

## Scope
### In Scope
- richer rendering for structured tool output already visible in sessions
- artifact and generated-output cards or previews where they materially improve readability
- lightweight action affordances such as open, copy, share, or retry when safe
- mobile-friendly handling of mixed transcript plus tool result sessions

### Out of Scope
- a full desktop-class debug console in mobile form
- total redesign of every tool view at once
- deep config or admin mutation from tool cards
- replacing raw output access where raw truth is still needed

## Functional Requirements

1. The UI must distinguish important tool outputs from ordinary transcript text.
2. The app must present generated artifacts and files with clearer previews or cards where possible.
3. Users must be able to take common follow-up actions directly from rich outputs when safe.
4. Raw output detail must remain reachable for debugging and trust.
5. The experience must work for existing OpenClaw tool activity without requiring a new control plane.

## Non-Functional Requirements

- Rich output must improve clarity without hiding truth.
- The session view must remain performant on mobile, even with mixed tools and artifacts.
- The design should prefer reusable renderer patterns over many bespoke one-off components.
- Information density should stay high enough for operator use while avoiding clutter.

## Hypotheses and Unknowns

- Existing Happy tool and artifact surfaces provide enough foundation for a strong first pass.
- A small set of high-value renderers will outperform a blanket attempt to prettify everything.
- Some outputs should stay mostly raw with only light framing instead of full card treatment.

## Touchpoints to Exercise

- tool activity rendering in `packages/happy-app`
- artifact screens and session transcript surfaces
- OpenClaw-backed result payloads and action affordances

## Probe Findings

- Probe not required. The project is a bounded UX enhancement on top of working tool and artifact concepts already present in the codebase.

## Footguns Discovered

- Over-polishing tool output can hide key debugging evidence.
- Too many custom renderers can become expensive to maintain and inconsistent across tool types.

## Remaining Unknowns

- Which tool output types deserve custom renderers first.
- How much overlap to keep or merge with multimedia sharing.
- Which mobile actions are safe enough to expose directly from output cards.

## Dependencies

- existing tool activity and artifact surfaces in `packages/happy-app`
- current OpenClaw-compatible session and tool result flow
- session-safe action patterns for open, copy, share, and retry behaviors

## Approval Notes

- Created after Bart explicitly confirmed rich tool output should be one of the next three delivery projects.
