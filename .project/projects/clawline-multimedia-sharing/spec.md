---
name: ClawLine Multimedia Sharing
slug: clawline-multimedia-sharing
owner: bart
status: approved
created: 2026-04-16T20:54:06Z
updated: 2026-04-16T20:54:06Z
outcome: Bart can send, receive, preview, and manage multimedia attachments in OpenClaw sessions from ClawLine mobile without dropping to other clients.
uncertainty: medium
probe_required: false
probe_status: skipped
---

# Spec: ClawLine Multimedia Sharing

## Executive Summary

ClawLine already works as an OpenClaw-capable Happy client. This project extends the shipped session experience with mobile-first multimedia sharing so Bart can use images, files, audio, and other session media directly in ClawLine instead of falling back to Telegram or desktop tooling.

## Problem and Users

The current product direction is mobile operator-first, but mobile operator work is still text-heavy. Bart needs to share screenshots, photos, PDFs, logs, and other media from his phone into OpenClaw sessions, and he needs generated or returned media to feel native in the transcript rather than like awkward raw files.

Primary user:
- Bart as the primary OpenClaw operator on mobile.

Secondary users later:
- other trusted power users working in OpenClaw sessions from mobile.

## Outcome and Success Metrics

- Bart can attach at least images and generic files from the session composer on mobile.
- Incoming media renders in-session with preview affordances that are trustworthy on a phone.
- Upload and download failures are visible, recoverable, and do not silently drop user intent.
- Bart can complete common mobile sharing workflows, such as sending a screenshot or opening a generated image, fully inside ClawLine.

## Scope
### In Scope
- composer attachment entry points for image and file sharing
- upload state, failure state, retry, and cancel affordances
- transcript rendering for shared and returned media
- preview, open-in, save, and share-out actions where platform-safe
- mobile-friendly attachment metadata and progress feedback
- OpenClaw-aware handling of media messages already supported by the working client path

### Out of Scope
- full video editing or capture workflows
- ambitious offline sync semantics
- deep artifact organization beyond what the session stream needs
- replacing all existing media internals across the whole Happy stack in one pass

## Functional Requirements

1. The session composer must support attaching images from camera roll or file picker.
2. The product should support generic file sharing for common operator documents such as PDFs, screenshots, and logs.
3. The transcript must render media in a readable mobile format with clear loading, success, and failure states.
4. Users must be able to open or export received media with standard platform actions where available.
5. The app must preserve enough attachment metadata to keep session history understandable.

## Non-Functional Requirements

- Attachment flows should feel fast and honest on mobile, with no silent failure.
- Large media should degrade gracefully with visible progress and timeout handling.
- Transcript rendering should stay readable and not turn sessions into cluttered file dumps.
- The implementation should build on existing working OpenClaw support instead of reintroducing a parallel backend model.

## Hypotheses and Unknowns

- Existing Happy media and picker primitives can be extended without destabilizing the working OpenClaw session path.
- Image and generic file support are the highest-value first slice, audio and richer media can follow.
- Some returned OpenClaw artifact types may need a small normalization layer before the mobile UI can render them cleanly.

## Touchpoints to Exercise

- `packages/happy-app` session composer and transcript rendering
- attachment picker and preview flows on Android
- OpenClaw-backed session send and receive paths
- artifact and media display surfaces already present in Happy-derived UI

## Probe Findings

- Probe not required. The feature request is grounded in an already-working OpenClaw client and existing Happy mobile capability surfaces.

## Footguns Discovered

- Attachment transport details can sprawl if image, file, audio, and artifact handling are all mixed together at once.
- Mobile UX can become noisy if upload state, media cards, and generated outputs are not visually constrained.

## Remaining Unknowns

- Which exact media types already round-trip cleanly through the current OpenClaw-backed path.
- Whether audio, video, and generated-media flows should be folded into this project or kept for a follow-up.
- How much artifact retrieval logic can be reused as-is versus normalized for ClawLine.

## Dependencies

- existing OpenClaw support in the Happy-derived codebase
- current session composer and transcript UI in `packages/happy-app`
- platform picker, file, and preview libraries already present in the app stack

## Approval Notes

- Created after Bart explicitly confirmed this should be one of the next three delivery projects.
