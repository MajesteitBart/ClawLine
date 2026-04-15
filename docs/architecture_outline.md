# OpenClaw Android App Architecture Outline

## Executive summary
OpenClaw Android should be treated as a **native operator console plus Android node companion**, not as a prettier Telegram client and not as a ChatGPT clone.

The existing research already supports that position:
- OpenClaw already has a real gateway-centered system model.
- WebChat and Control UI already prove the core chat and admin surfaces.
- The current Android app already proves gateway pairing, chat, voice, screen/device capability surfaces, and node-style permissions.
- The main gap is now **product architecture and interface quality**, not backend possibility.

The recommended product direction is:
1. Build on the **existing gateway WebSocket and admin surfaces** rather than inventing a new backend.
2. Make **sessions** the first-class unit of work.
3. Separate **clean chat UX** from **debug/operator UX**, but keep them one tap apart.
4. Borrow **conversation polish, voice ergonomics, and information density discipline** from ChatGPT Android.
5. Borrow **Flutter execution quality, theming, motion, and multimodal rendering patterns** from Kelivo, but not its provider-centric app model.
6. Keep OpenClaw’s differentiation intact: **gateway ownership, explicit agent/session routing, tool visibility, node/device integration, and admin control**.

The right alpha is not “everything Control UI does on a phone.”
It is a coherent mobile operator experience for Bart that makes daily use materially better than Telegram.

## Product thesis and positioning
### Thesis
OpenClaw Android should become the fastest way for Bart to:
- talk to his main agent across multiple concurrent sessions,
- see what the system is doing,
- intervene when something needs approval or debugging,
- and manage the most important gateway, node, and skill state from his phone.

### Positioning
OpenClaw Android is:
- **more operational than ChatGPT**,
- **more native and organized than Telegram**,
- and **more personal/system-owned than hosted AI clients**.

It should feel like:
- a serious mobile workspace for OpenClaw,
- a trustworthy remote control for Bart’s own AI system,
- and a lightweight field console for monitoring and intervention.

### Product promise
“If Bart is away from his desk, he should still be able to understand, steer, and trust what OpenClaw is doing.”

## Design principles
1. **Operator first**
   - Optimize for someone who runs and understands the system, not a generic consumer chat app user.
2. **Sessions before messages**
   - The real unit of work is the session, not the single transcript bubble.
3. **Clean by default, deep on demand**
   - Normal chat should stay readable.
   - Tool calls, logs, args, and raw detail should be one tap away, not always on-screen.
4. **Explicit control beats hidden magic**
   - Routing, agent choice, session context, and approval state should be visible.
5. **Gateway is the source of truth**
   - The app is a client over gateway state, not a parallel control plane.
6. **Mobile reliability over desktop feature parity**
   - If a feature is hard to make trustworthy on mobile, postpone it.
7. **Native Android where it matters**
   - Use Flutter for product velocity, but use native Android services for the parts that require durable OS integration.
8. **One product, clearly separated modes**
   - Operator console and Android-node/device features can live in one app, but they should not blur together.

## User and persona assumptions, centered on Bart
### Primary user
Bart is the primary operator and power user.
He is:
- technical enough to understand sessions, agents, tools, logs, and gateway connectivity,
- impatient with friction,
- more interested in truth and control than decorative UI,
- and likely to use the app while moving, between meetings, or away from the desktop.

### Bart’s core jobs to be done
1. Continue multiple active conversations with the main agent without Telegram hacks.
2. See whether a run is progressing, stuck, failed, or waiting on approval.
3. Inspect tool activity and enough logs to understand what happened.
4. Change the route or behavior of a session quickly.
5. Check gateway, node, channel, and skill health from the phone.
6. Use voice and attachments when mobile context makes typing slower.

### Secondary users, later
- trusted collaborators with narrower permissions,
- Bart in “device mode” using the phone as a node sensor/input surface,
- future power users who are less technical than Bart but still operator-like.

### What Bart does not need
- consumer-grade AI entertainment surfaces,
- fake simplicity that hides system state,
- a desktop admin UI squeezed onto a phone unchanged.

## Canonical system model
The Android app should model OpenClaw in the same terms the system already uses.

### Authority and flow
- **Gateway**: central authority for connection, sessions, agents, tools, logs, cron, channels, skills, nodes, config, and admin RPCs.
- **Android app**: mobile client over gateway surfaces, plus local Android capability layer when acting as a node companion.
- **Channels**: Telegram, Discord, WhatsApp, Slack, Signal, BlueBubbles, etc. remain external message transports, not the primary mobile UX.

### Core entities
#### Gateway
- Single source of state.
- Hosts WebSocket chat and admin/control surfaces.
- Owns durable session state and runtime status.

#### Sessions
- First-class conversational workspaces.
- Include `main` plus additional isolated sessions.
- Are the right abstraction for Bart’s multi-threaded agent work.
- Can carry per-session overrides such as model/thinking/fast/verbose/trace/reasoning where supported.

#### Agents
- Named working identities like `main`, `coding`, `writer`, etc.
- Sessions route to agents explicitly.
- Agent selection belongs in the session header, not buried in settings.

#### Nodes
- Connected devices/services, including Android.
- Expose capability/state surfaces.
- Matter for phone-as-node, device status, and quick actions.

#### Channels
- External surfaces where OpenClaw operates.
- Useful for health/login/pairing/status and context awareness.
- Not the ideal primary interface for power-user mobile workflows.

#### Tools
- The executable action layer.
- Produce structured activity, progress, stdout/stderr-like output, approvals, and artifacts.
- Need both clean summaries and raw detail views.

#### Logs
- System-level evidence surface.
- Distinct from transcript messages and tool timeline events.
- Should support tailing, filtering, and severity awareness.

#### Cron
- Scheduled automations.
- Important for trust, monitoring, and quick intervention.

#### Skills
- Major capability surface with install/update/enable-disable/config implications.
- Worth a first-class management screen.

### Canonical mental model
`Gateway -> Sessions -> Messages + Tool Activity`
`Gateway -> Nodes / Channels / Skills / Cron / Logs`

The app should never force Bart to think in transport-specific terms first.
He should think in sessions and system state.

## Information architecture / main app sections
The app should move away from the current rough tab mix and toward a clearer mobile IA.

### 1. Chats
Purpose:
- daily conversation work,
- session switching,
- composing text/voice/attachments,
- reading assistant output.

Primary subviews:
- session list
- active chat
- session details sheet
- composer tools

### 2. Activity
Purpose:
- understand what the system is doing right now.

Primary subviews:
- live tool timeline for active session
- approvals queue
- recent failures/warnings
- active runs
- optional per-session activity feed

### 3. Console
Purpose:
- gateway-level operator management.

Primary subviews:
- gateway health/status
- nodes
- channels and login state
- logs tail
- cron jobs
- skills

### 4. Device
Purpose:
- Android-node and phone capability management.

Primary subviews:
- connect/pair
- permissions and capability toggles
- local device state
- screen/camera/canvas related controls where supported

### 5. Settings
Purpose:
- connection preferences,
- appearance,
- notification rules,
- debug toggles,
- local cache/account behavior.

### Bottom navigation recommendation
For MVP, use 4 bottom-level destinations:
- **Chats**
- **Activity**
- **Console**
- **Settings**

Put **Device** as a section inside Console or Settings initially unless Android-node workflows are central enough to justify a top-level tab.

This keeps the app focused on Bart’s operator use rather than over-indexing on device-permission novelty.

## Key user flows
### 1. Connect to gateway
- Open app
- Scan QR or paste endpoint
- Choose secure remote endpoint or local/Tailscale route
- Authenticate with setup code / token / password as already supported
- Land in a connection health confirmation screen

Success condition:
- Bart understands whether he is connected, to which gateway, over which endpoint, and with what trust level.

### 2. Resume work in an existing session
- Open Chats
- See recent sessions with agent and status context
- Tap a session
- Read clean transcript
- Expand tool activity only if needed
- Continue the session

### 3. Start a new parallel thread of work
- Tap new session
- choose or confirm agent
- optionally inherit settings from current session
- start from blank state

Important note:
- conversation branching should be treated as a later UI layer over session creation, not assumed as a native backend concept.

### 4. Understand why a run looks stuck
- In chat, see “running / waiting / failed / approval needed” state
- Tap Activity
- Inspect current tool call, recent output, and any error snippet
- Jump to logs only if tool-level view is insufficient

### 5. Approve or intervene
- Receive notification that approval is needed or a run failed
- Open approval or failure detail
- inspect enough context to act safely
- approve/deny/retry/open session

### 6. Quick mobile voice interaction
- Open session
- tap voice input
- speak
- review transcript briefly if needed
- send into the same session
- optionally use “Read aloud” on a response

### 7. Check system health while away from desk
- Open Console
- see gateway status, connected nodes, channel issues, cron warnings, and skill anomalies
- drill into only the section that needs intervention

## MVP scope
The MVP should solve the problem Bart actually has today: better-than-Telegram mobile operation.

### Must-have
1. **Gateway connection and trustable session restoration**
   - QR/manual connect
   - clear connected/disconnected state
   - persisted last-known endpoint and safe reconnect

2. **Session-first chat**
   - recent sessions list
   - create/switch between sessions
   - active session header with agent + session identity
   - streaming chat over existing gateway surfaces

3. **Per-session controls**
   - exposed settings for model/thinking/fast/verbose/trace/reasoning where already supported
   - stop/refresh actions

4. **Tool activity visibility**
   - live tool timeline inside or adjacent to chat
   - status, start/end, short output preview, failure state

5. **Basic operator console**
   - gateway status
   - nodes summary
   - channels summary/login state if surfaced today
   - lightweight logs tail view

6. **Mobile-appropriate notifications**
   - approval needed
   - run failed
   - session mentioned/attention needed
   - reconnect issues

7. **Voice and attachments baseline**
   - tap-to-talk capture
   - image/file attach where current surfaces already support it
   - response-level read aloud action

### Explicitly out of MVP
- full config editing/apply
- full cron editor
- deep skill configuration forms
- full canvas/browser control surface parity
- desktop-class log explorer
- advanced collaborative sharing/workspace permissions

## Phase 2 scope
Phase 2 should turn the MVP from “usable” into “daily-driver power tool.”

### Additions
1. **Conversation organization upgrade**
   - search across sessions
   - pinning
   - local tags/workspaces
   - better recent/favorite grouping

2. **Composer intelligence**
   - slash-command autocomplete
   - structured quick actions
   - Telegram-style multi-option buttons where tool/channel outputs already support them

3. **Richer activity and debugging**
   - clean transcript vs debug transcript toggle
   - per-tool detail views
   - better error surfacing and retry affordances

4. **Approvals and intervention**
   - dedicated approval inbox
   - retry/open-in-session/action history

5. **Skills management**
   - installed/available/enabled views
   - install/update/enable-disable where already supported
   - guarded config hooks only where safe and documented

6. **Cron and task visibility**
   - list schedules
   - see failures/last run
   - basic pause/resume if existing backend supports it

7. **Better voice UX**
   - cleaner voice mode entry
   - transcript preview
   - audio playback quality polish
   - stronger per-response read-aloud ergonomics

8. **Node/device layer cleanup**
   - explicit device dashboard
   - clearer permission states
   - health/capability summaries

## Later / advanced scope
These are real opportunities, but not alpha-critical.

### Advanced directions
- branching or derived-session workflows
- projects/workspaces layered over sessions
- full config editing/apply with safeguards and auditability
- richer exec approval workflow
- mobile canvas/browser/live previews where genuinely useful
- advanced channel management and pairing flows
- artifact browser for images/files/generated media
- offline read cache and delayed send behavior
- role-based access or collaborator mode
- explicit “operator mode” vs “node mode” if product expands beyond Bart

## Architecture layers
### 1. UI layer
Responsibilities:
- chat transcript
- tool timeline/cards
- activity inbox
- console dashboards
- settings and permission screens

Recommendation:
- Flutter Material 3 base
- dynamic color on Android
- compact, information-dense components
- small design-token layer for spacing/radius/shadows/semantic colors
- message renderer that supports markdown, code, citations, and media previews

### 2. App state layer
Responsibilities:
- session list and active session state
- connection lifecycle
- activity/approvals state
- console entity state
- settings/preferences state

Recommendation:
- use a modern unidirectional state model rather than copying Kelivo’s large Provider tree
- prefer **Riverpod** with feature-scoped providers and async state primitives
- keep connection/session state separate from UI-only presentation state

### 3. Transport layer
Responsibilities:
- gateway WebSocket connection
- admin RPC/request flows
- reconnect/backoff
- auth token/setup code/session restoration

Recommendation:
- one explicit gateway client service
- one WebSocket stream coordinator
- one request/command client for non-streaming calls
- transport should expose typed domain events, not raw JSON to widgets

### 4. Domain/services layer
Responsibilities:
- session orchestration
- message send/history/abort/inject flows
- tool activity normalization
- logs tailing
- skills/channels/nodes/cron feature services

Recommendation:
- model each major surface as a service module:
  - `ChatService`
  - `SessionService`
  - `ActivityService`
  - `GatewayStatusService`
  - `NodeService`
  - `ChannelService`
  - `SkillService`
  - `CronService`
  - `LogService`

### 5. Caching and storage layer
Responsibilities:
- recent sessions cache
- recent messages cache
- activity snapshots
- local preferences
- draft persistence

Recommendation:
- structured local cache in SQLite via **Drift**
- lightweight prefs via `shared_preferences`
- avoid assuming the local cache is authoritative
- cache should improve speed and resilience, not create sync ambiguity

### 6. Notifications and background layer
Responsibilities:
- approval/failure notifications
- reconnect state
- optional long-lived mobile companion behavior
- Android permission-driven device features

Recommendation:
- keep core app logic in Flutter
- use a **thin native Android integration layer** for foreground service, notification listener/assistant hooks, camera/screen/device-capability bridges, and any OS-sensitive background behavior
- do not over-promise background always-on behavior until reliability is validated on real devices

### 7. Observability layer
Responsibilities:
- client telemetry
- crash reporting
- connection diagnostics
- debug export for app-side issues

Recommendation:
- structured client logs
- connection event journal
- optional debug bundle export for alpha testers
- lightweight crash/error reporting with privacy discipline

## Recommended Flutter package and system choices
Use Kelivo as inspiration for quality and selected packages, not as the blueprint for the whole architecture.

| Concern | Recommended choice | Why | Kelivo relevance |
|---|---|---|---|
| App framework | Flutter + Material 3 | fastest route to a polished Android app with strong custom UI control | aligned |
| Theming | `dynamic_color`, custom theme/token layer | Android-native feel, coherent polish | copy pattern |
| State | `flutter_riverpod` | clearer scaling than large Provider trees | do not copy Kelivo here |
| Routing | `go_router` or a small shell router | cleaner tab/screen organization and deep links | Kelivo is not the model here |
| Networking | `dio` for request flows + `web_socket_channel` or custom WS wrapper | matches gateway + admin surface needs | partially aligned |
| Models | `freezed` + `json_serializable` | safer typed events and cached entities | upgrade beyond Kelivo |
| Local cache | `drift` + SQLite | structured data fits sessions/messages/activity/log refs better than ad hoc boxes | do not copy Hive unless speed demands it |
| Preferences | `shared_preferences` | fine for small local settings | aligned |
| Markdown/rendering | `gpt_markdown` plus custom renderer extensions | strong AI-chat rendering baseline | copy selectively |
| Code highlighting | `flutter_highlight` / `highlight` | code/tool output readability | aligned |
| Math | `flutter_math_fork` only if needed | useful but not core to MVP | optional |
| Motion | `animations`, `flutter_animate` | lightweight polish without excess | copy pattern |
| Icons | `lucide_icons_flutter` | cleaner modern operator UI | aligned |
| QR flows | `mobile_scanner`, `pretty_qr_code` | pairing and share flows are important | aligned |
| Files/media | `image_picker`, `file_picker`, preview helpers | multimodal input baseline | aligned |
| Audio playback | `just_audio` or `audioplayers` | response read-aloud and voice playback | Kelivo is a useful reference |
| Permissions | `permission_handler` | practical Android permissions surface | aligned |
| Notifications | `flutter_local_notifications` | mobile operator alerts | aligned |

### Specific package guidance
- **Copy from Kelivo:** dynamic color, motion helpers, QR packages, markdown/code rendering approach, compact interaction patterns.
- **Do not copy from Kelivo:** its provider-centric product model, sprawling MultiProvider shell, desktop-heavy dependencies, or provider/config-first information architecture.

## Backend and API assumptions based on current OpenClaw surfaces
This plan assumes the app is primarily a client over already existing OpenClaw surfaces.

### Existing surfaces to rely on
1. **Gateway WebSocket chat surface**
   - `chat.history`
   - `chat.send`
   - `chat.abort`
   - `chat.inject`
   - session patching / override flows already used in WebChat and Control UI

2. **Existing admin/control surfaces already exposed in Control UI**
   - session list and overrides
   - node list/status
   - channel status/login flows
   - logs tail
   - cron jobs
   - skills status/install/enable-disable
   - exec approvals
   - config editing/apply
   - debug snapshots

3. **Existing Android connectivity model**
   - direct gateway WebSocket connection
   - LAN/manual host/port
   - secure remote endpoints
   - Tailscale Serve / proper `wss://` pairing guidance

### Assumptions not to make
- do not assume a brand new mobile-specific backend is required
- do not assume server-side projects/folders/branching exist today
- do not assume unrestricted offline-first behavior
- do not assume all Control UI admin actions are already safe or ergonomic on mobile
- do not assume voice mode can or should expose every tool flow in alpha

### Product implication
The mobile app should wrap existing surfaces with:
- better IA,
- typed client models,
- mobile-first interaction design,
- and selective local organization metadata.

## Security, auth, and connectivity model
### Connection model
Support three operator-grade connection paths:
1. **Local/LAN** for same-network use
2. **Tailscale/private network** for trusted remote use
3. **Public secure endpoint (`wss://`)** for remote use with proper TLS

### Recommended default posture
- Prefer **Tailscale Serve or another proper `wss://` endpoint** for remote pairing and daily remote use.
- Treat raw tailnet `ws://` as expert/manual-only.
- Make endpoint security state visible in the UI.

### Authentication
Use the existing setup flows already present in the app/docs:
- setup code
- token
- password, where supported
- explicit onboarding/connect states

### Local secret handling
- store tokens securely using Android secure storage/keystore-backed mechanisms
- never write secrets into logs or export bundles
- allow easy revoke/disconnect

### Device trust model
The app should make clear whether the phone is acting as:
- a remote operator client,
- a paired Android node,
- or both.

### Safety requirements
- destructive or high-risk actions should require confirmation
- config changes should have stronger friction than chat actions
- approval actions should show enough context to avoid blind confirmation

## Session and thread model, conversation organization strategy
### Core strategy
Make **session** the top-level object in the mobile IA.

Each session card should show:
- title or derived name
- assigned agent
- last activity time
- status badge (idle/running/waiting/failed/approval)
- optionally pinned/tagged indicators

### Active conversation header should expose
- agent
- session id or friendly title
- current route/context hints where relevant
- session settings shortcut

### Organization approach
#### MVP
- recent sessions
- create new session
- switch sessions quickly
- persist drafts per session

#### Phase 2
- local search across sessions
- pinning
- local tags/workspaces
- filters by agent/status

#### Later
- derived sessions / branch-like flows
- lightweight projects if backend or product maturity justifies it

### Important constraint
Do not model the app around generic “chat history folders” first.
OpenClaw’s real strength is explicit working sessions with routing and runtime context.

## Voice, multimodal, and tool-log UX strategy
### Voice
For alpha, voice should be useful and calm, not theatrical.

Recommended approach:
- keep tap-to-talk
- support auto-send on pause if it is already working well
- show transcript preview before send when confidence is uncertain
- support response-level **Read aloud**
- keep voice tied to the current session, not a separate product universe

Do **not** try to copy full ChatGPT blue-orb voice theater in alpha.
Copy the ergonomics, not the spectacle.

### Multimodal
- support camera/gallery/file attach where already supported
- render images and file chips clearly in the transcript
- handle generated media/tool artifacts as first-class message attachments
- keep advanced document/OCR/media pipelines for later unless already available and reliable

### Tool-log UX
This is one of the biggest differentiators versus Telegram.

Recommended transcript model:
1. **Clean transcript layer**
   - user and assistant messages
   - concise tool-result summaries when useful
2. **Tool activity layer**
   - collapsible per-message or per-run timeline
   - status, duration, args preview, result summary, error snippet
3. **Debug/log layer**
   - raw output, log tail, and deeper diagnostics in Console/Activity

This three-layer model keeps daily chat readable while preserving operator trust.

## Risks, open questions, and validation plan
### Main risks
1. **Backend surface mismatch**
   - Some Control UI functionality may not be exposed in a mobile-friendly way yet.
2. **Mobile complexity creep**
   - Trying to ship chat, node features, admin tools, and deep debug all at once will bloat the app.
3. **Background reliability**
   - Android background behavior is fragile across devices and OEMs.
4. **UI overload**
   - OpenClaw has many concepts; without strong IA the app will feel intimidating.
5. **Trust/publisher presentation**
   - Distribution trust still matters for adoption and confidence.

### Open questions
- Which admin actions are genuinely safe to perform from mobile in alpha?
- Which Control UI surfaces already have stable enough schemas/contracts for typed mobile clients?
- How much of the current Android node capability layer should stay in the same app shell versus be visually isolated?
- What notification model exists today when the app is not foregrounded?
- Which logs and tool outputs are small enough for phone consumption without drowning the user?

### Validation plan
#### Product validation
- dogfood with Bart as primary operator
- compare daily use against Telegram for one week of real workflows
- track whether Bart reaches for the app first for multi-session work and debugging

#### Technical validation
- verify reconnect behavior on local, Tailscale, and `wss://` remote paths
- verify session continuity after app restart
- verify tool timeline correctness against actual gateway events
- verify notification usefulness and false-positive rate
- verify safe handling of credentials and disconnect/re-pair flows

#### UX validation
- test whether Bart can answer three questions quickly:
  1. what is running?
  2. what needs me?
  3. what happened?

## Suggested implementation sequence by milestones
### Milestone 0: contract and product shaping
- confirm which gateway/admin surfaces are already stable enough to consume
- define typed event/data contracts for chat, session list, tool activity, gateway status, nodes, skills, cron, and logs summaries
- lock the mobile IA and alpha scope

### Milestone 1: foundation shell
- Flutter app shell
- connection manager
- auth storage
- bottom-nav layout
- typed transport client
- theme/token system

### Milestone 2: session-first chat MVP
- session list
- active chat
- streaming send/abort/history
- per-session routing/settings header
- draft persistence

### Milestone 3: activity layer
- tool timeline
- approval-needed state
- failure/retry surfaces
- session status badges

### Milestone 4: basic console
- gateway health
- nodes summary
- channels summary
- minimal logs tail

### Milestone 5: voice and attachment polish
- tap-to-talk refinement
- read aloud action
- image/file attach improvements
- message rendering polish

### Milestone 6: phase 2 power-user upgrades
- search/pinning/tags
- slash-command autocomplete
- quick action buttons
- skills screen
- cron visibility
- better notifications and reconnect resilience

## Success criteria for alpha
The alpha is successful if Bart can reliably do the following from Android:
1. Connect securely to his gateway without friction.
2. Run and manage multiple parallel sessions more easily than in Telegram.
3. Understand tool activity and failures without needing desktop every time.
4. See key system health state in under 10 seconds.
5. Use voice and attachments in a way that feels genuinely helpful on mobile.
6. Trust the app enough to make it part of daily OpenClaw use.

### Alpha non-goals
The alpha does not need to:
- replace all desktop administration,
- match ChatGPT’s voice theatrics,
- or expose every existing OpenClaw control surface on day one.

## What to copy from ChatGPT Android, and what not to copy
### Copy
- calm, fast conversation UX
- excellent session/history legibility
- strong voice ergonomics
- polished attachment and read-aloud affordances
- clear long-press / secondary actions
- disciplined visual hierarchy that keeps chat readable

### Do not copy
- generic hosted-assistant product framing
- hiding system routing and runtime state behind simplicity theater
- over-centralizing around a single chat stream without explicit session identity
- treating voice as a separate magic world disconnected from operator workflows

## What to copy from Kelivo, and what not to copy
### Copy
- Material 3 + dynamic color polish
- small design-token system
- lightweight animation primitives used everywhere consistently
- rich markdown/code rendering patterns
- compact but capable composer interactions
- QR/config onboarding quality
- selective frosted/glass overlays where they improve clarity

### Do not copy
- provider-centric information architecture
- sprawling Provider tree as the app’s long-term state model
- desktop-focused dependency baggage
- settings/provider complexity ahead of core session UX
- product framing around model/provider shopping rather than operator workflows

## Final recommendation
Build OpenClaw Android as a **session-first operator client over the existing gateway**, with a clean chat layer, a strong activity/debug layer, and a focused mobile console.

If the team stays disciplined, the app can become meaningfully better than Telegram quickly without waiting for a new backend.

The winning move is not “copy ChatGPT” or “copy Kelivo.”
It is:
- copy ChatGPT’s polish where it improves usability,
- copy Kelivo’s Flutter execution quality where it improves craft,
- and keep OpenClaw unmistakably OpenClaw.
