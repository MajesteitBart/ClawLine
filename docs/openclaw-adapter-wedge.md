# OpenClaw Adapter Wedge

Date: 2026-04-16

## Goal

Land the **first text-only OpenClaw integration slice** inside `packages/happy-app` without refactoring the whole Happy runtime.

This wedge should prove:
- OpenClaw session list can appear in the existing mobile shell
- one OpenClaw session transcript can render in the existing session UI
- text messages can be sent into an OpenClaw session from the existing composer

Not in scope for the first wedge:
- attachments
- voice routing
- approvals execution
- full console parity
- replacing all Happy-specific screens and account flows immediately

## Why this is the right first wedge

The strongest reusable part of Happy is the mobile UI shell:
- `MainView`
- session list surfaces
- `SessionView`
- message rendering
- composer ergonomics

The biggest mismatch is the backend/runtime model in `sources/sync/*`.

So the safest first move is:
- keep the current UI and local storage mental model
- add an OpenClaw adapter layer below it
- feed the UI mapped session and message data

## Current insertion points

### UI surfaces we want to preserve first
- `sources/components/MainView.tsx`
- `sources/-session/SessionView.tsx`
- `sources/components/SessionsList*`
- `sources/sync/storage.ts`

### Runtime surface that is too Happy-specific
- `sources/sync/sync.ts`
- `sources/sync/apiTypes.ts`
- `sources/sync/apiSocket.ts`
- `sources/sync/encryption/*`
- account/auth/server assumptions around the Happy backend

## Recommended boundary

Add a new thin OpenClaw adapter namespace under:

- `packages/happy-app/sources/openclaw/`

Recommended initial files:

- `client.ts`
  - low-level OpenClaw Gateway transport
  - HTTP/WebSocket helpers only
- `types.ts`
  - normalized adapter-level types for OpenClaw sessions, transcript items, and send payloads
- `mappers.ts`
  - map OpenClaw Gateway/session data into existing Happy app storage shapes
- `sessionAdapter.ts`
  - the first wedge interface used by app code

## First adapter interface

The first useful interface is intentionally small:

```ts
export interface OpenClawSessionAdapter {
  listSessions(): Promise<OpenClawSessionSummary[]>;
  getSession(sessionId: string): Promise<OpenClawSessionSummary | null>;
  getMessages(sessionId: string): Promise<OpenClawMessage[]>;
  sendTextMessage(sessionId: string, text: string): Promise<void>;
  subscribe(onEvent: (event: OpenClawAdapterEvent) => void): () => void;
}
```

That is enough to power:
- session list
- transcript hydration
- message send
- basic live updates

## Mapping strategy

Do **not** try to force OpenClaw into Happy's whole backend model.
Instead map only what the UI needs first.

### Sessions

Map OpenClaw session state into the existing `Session` shape in `sources/sync/storageTypes.ts`.

Fields to populate first:
- `id`
- `createdAt`
- `updatedAt`
- `active`
- `activeAt`
- `presence`
- `thinking`
- `metadata.name`
- `metadata.summary`
- `metadata.flavor`
- optional path/host/version when OpenClaw provides them

Fields that can stay null or empty in wedge 1:
- Happy machine ownership specifics
- RevenueCat or social fields
- git-status-specific assumptions
- daemon-only metadata

### Messages

Map OpenClaw transcript items into the app's existing message pipeline with the smallest possible common shape.

For wedge 1, support only:
- user text
- assistant text
- simple service/status text if needed

Defer for later wedges:
- artifact media
- tool calls with full structured rendering
- approvals as interactive objects
- rich attachments

### Send path

Do not reuse Happy's encrypted server send flow for OpenClaw.
Instead create a separate text-send path that targets OpenClaw Gateway directly.

The app UI can still call something semantically equivalent to `sendMessage`, but the implementation should branch into the OpenClaw adapter for OpenClaw-backed sessions.

## Smallest implementation sequence

### Phase 1
- add `sources/openclaw/types.ts`
- add `sources/openclaw/sessionAdapter.ts`
- add `sources/openclaw/mappers.ts`
- keep them isolated and unused by default at first

### Phase 2
- introduce a feature flag or app mode for OpenClaw-backed sessions
- load OpenClaw sessions into storage using the mapper
- render them in the existing list and session views

### Phase 3
- route composer text send through `sendTextMessage()` for OpenClaw sessions

## Explicit non-goals for the wedge

Do not do these in the first adapter slice:
- replace all of `sync.ts`
- rewrite storage architecture
- solve full multimodal transport
- solve full admin/console data model
- merge Happy and OpenClaw auth models completely

## Recommendation

The first real code wedge should be a **parallel adapter path**, not a big replacement.

Keep the current UI stable.
Add a new `sources/openclaw/` seam.
Map just enough OpenClaw session and text-message data into the existing storage/UI flow to prove the shell can become ClawLine.
