# ClawLine Happy Multimodal Fork Assessment

Date: 2026-04-16
Upstream inspected: `slopus/happy` @ `ea41c4c`

## Bottom line

Happy is a strong pivot base for ClawLine.

It already solves several things that we would otherwise have to build from scratch again:
- a production-grade Expo / React Native app structure,
- mobile + web shared UI,
- session-centric chat patterns,
- remote sync primitives,
- real voice-session plumbing,
- QR-based linking flows,
- and a mature-feeling operator-oriented mobile shell.

But it is **not yet a full multimodal OpenClaw client out of the box**.

The codebase is best treated as:
- **excellent mobile product and interaction infrastructure**,
- **partial multimodal foundation**,
- and **the wrong backend model to keep unchanged** for OpenClaw.

## What Happy is made of

Happy is a pnpm monorepo with these main parts:

- `packages/happy-app`: Expo / React Native app for mobile + web
- `packages/happy-cli`: CLI wrapper around coding-agent flows
- `packages/happy-agent`: remote agent control helper
- `packages/happy-server`: Fastify + Socket.IO backend
- `packages/happy-wire`: protocol types and envelope work

Backend architecture in `docs/backend-architecture.md` shows a fairly standard stack:
- Fastify HTTP API
- Socket.IO realtime channel
- Postgres via Prisma
- Redis
- S3 / MinIO for uploaded assets

That stack is real and coherent, but for ClawLine it overlaps with infrastructure OpenClaw Gateway already owns.

## What is already strong and reusable

### 1. Mobile app shell

Happy already has a much stronger mobile base than the removed Flutter shell:
- established navigation structure,
- real session/chat UI,
- production app configuration,
- mobile permission handling,
- QR onboarding,
- web compatibility,
- and broader device support.

### 2. Voice architecture

This is one of the strongest reusable pieces.

`docs/voice-architecture.md` shows a real voice flow with:
- mic-driven session start/stop,
- active-session routing,
- queued voice prompts while speaking,
- contextual injection into the current session,
- and tool hooks that can act on the current session.

That is very close to the kind of operator-mobile behavior we want for OpenClaw.

### 3. Message / activity mental model

Happy already thinks in ongoing sessions, turns, tool activity, and remote intervention. That maps much better to ClawLine than a generic chat app base.

### 4. Multiplatform implementation quality

The app package already includes serious mobile-native capabilities and libraries:
- camera
- audio
- document picker
- image picker
- notifications
- location
- sensors
- webview
- live voice / WebRTC related dependencies

So the dependency surface for multimodal work is already broad.

## What is only partial or still planned

### 1. Attachments are not finished end to end

This is the most important reality check.

Happy clearly wants attachment support, but it is not fully landed as the normal chat experience yet.

Signals:
- `docs/roadmap.md` still lists `Attachments in composer / in agent output` as hard work.
- `packages/happy-app/sources/sync/sync.ts` currently exposes `sendMessage(sessionId, text, ...)` as a text send path.
- `docs/plans/session-protocol-v2.md` contains a fuller design for `photo`, `video`, and `file`, but that document is still draft.
- `packages/happy-wire/src/sessionProtocol.ts` includes file/image event types, but the file itself explicitly says that protocol is under review and not the production path.

So the multimodal story is promising, but incomplete.

### 2. Camera exists mostly for QR / capability plumbing today

The app already has camera permission flows and camera dependencies, but today that seems more mature for connection flows than for a full multimodal user-composer experience.

### 3. Voice is real, but provider-shaped

Voice is implemented, but it is centered around ElevenLabs-specific flows and Happy's own server-side gating. For ClawLine that should be adapted, not copied wholesale.

## What conflicts with OpenClaw's architecture

### 1. Happy is machine / CLI / provider centered

Happy's model is roughly:
- machine daemon
- Happy CLI
- Happy server
- remote control of Claude Code / Codex sessions

ClawLine wants:
- OpenClaw Gateway as the system authority,
- OpenClaw sessions as the first-class unit,
- OpenClaw tools, approvals, channels, nodes, logs, and cron as core operator surfaces,
- phone-as-node possibilities later.

That means the mobile UX direction is useful, but the backend assumptions need replacing.

### 2. Happy's server duplicates responsibilities OpenClaw already has

If we keep `happy-server` as-is, we would be building a parallel control plane.
That would fight the architecture in `docs/architecture_outline.md`.

### 3. Provider-specific semantics leak upward

Happy carries explicit assumptions about Claude/Codex-style sessions, machine paths, and desktop-agent takeover behavior. Some of that is still valuable, but much of it is the wrong abstraction level for OpenClaw.

## Best fork strategy

## Recommendation: UI-first fork, Gateway-backed

This is the best path.

### Keep and adapt

- `packages/happy-app` as the main mobile/web shell
- visual language, navigation, session list, chat rendering, activity patterns
- voice-session UX patterns
- QR/device onboarding patterns where they map cleanly
- selected protocol ideas from `happy-wire`

### Replace or phase out

- `happy-server` as the long-term backend authority
- Happy-specific auth and account model
- provider-centric session model
- Happy CLI / daemon assumptions where OpenClaw Gateway already provides equivalents
- ElevenLabs billing / gating specifics

### Preserve from current ClawLine repo

- `.agents/`
- `.project/`
- `.delano/`
- `docs/architecture_outline.md`
- custom skills and Delano planning assets

## Concrete multimodal opportunities for ClawLine

## Phase 1, fast wins

### A. Voice to active OpenClaw session

Reuse Happy's voice orchestration pattern, but route into OpenClaw sessions instead of Happy's coding-agent layer.

Target outcome:
- tap mic in a session,
- speak to the active OpenClaw session,
- get spoken/text results back,
- surface approvals or tool-state changes naturally.

### B. Image attachment from phone

Add image input first.

Why first:
- highest value multimodal flow,
- most obvious mobile use case,
- aligns with OpenClaw tool ecosystem and model support,
- smaller scope than general file/video.

Target flows:
- camera capture
- photo library pick
- send image into current session
- render image preview in transcript

### C. File attachment primitives

After image input, add generic file uploads for PDFs, screenshots, logs, and documents.

## Phase 2, OpenClaw-native multimodal depth

### D. OpenClaw node/device bridging

Happy does not natively give us the OpenClaw node model. This is where ClawLine can become more special.

Potential surfaces:
- camera snap / clip routing to the node layer
- local screen or canvas handoff
- quick device-status panels
- notifications as operator actions

### E. Audio-first mobile operator workflows

Examples:
- voice note into a session,
- spoken approval/rejection flows,
- short live operator mode for hands-busy use.

### F. Rich artifacts and tool media output

Examples:
- rendered images
- generated audio
- videos
- PDFs
- canvas snapshots

These should appear as first-class artifacts in the session stream, not awkward generic files.

## Main technical gaps to solve

### 1. Session transport adapter

Need a ClawLine adapter layer that maps:
- OpenClaw session history
- tool activity
- approvals
- attachments
- run state
- artifacts

into Happy-style app state and views.

This is likely the first major implementation wedge.

### 2. Attachment transport contract

Need a clear OpenClaw-native attachment contract for:
- upload from mobile,
- session message composition with media,
- transcript rendering,
- downstream tool/model compatibility,
- artifact retrieval.

### 3. Voice abstraction

Need to separate the good voice UX orchestration from the current ElevenLabs-specific assumptions.

### 4. Console and operator surfaces

ClawLine still needs the OpenClaw-specific operator advantage:
- sessions
- tools
- approvals
- logs
- cron
- nodes
- channels
- skills

Happy gives us a stronger shell, but not those product semantics.

## Recommended next build order

1. **Stabilize repo pivot**
   - keep Happy import as the new base
   - preserve Delano context and architecture docs
   - document upstream commit and sync strategy

2. **Create an OpenClaw app mode inside `packages/happy-app`**
   - treat it as ClawLine mode, not generic Happy mode
   - start with auth + session list + session transcript read path

3. **Implement text-only OpenClaw adapter first**
   - prove app can browse and continue OpenClaw sessions

4. **Add image input and image rendering**
   - this is the first real multimodal milestone

5. **Port voice routing to OpenClaw session actions**
   - keep only the useful interaction model

6. **Add operator surfaces**
   - activity
   - approvals
   - failures
   - core gateway health

## Recommendation in one sentence

Fork Happy for its mobile product architecture and multimodal foundations, but make OpenClaw Gateway the authority quickly, and treat image input plus voice-session routing as the first serious multimodal milestones.
