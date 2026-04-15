# Decisions

## 2026-04-15

### D-001: Use the architecture outline as the project baseline
- Context: the repo started empty and needed a concrete planning source.
- Decision: treat `docs/architecture_outline.md` as the canonical baseline for the first Delano project.
- Why: it already captures the product thesis, IA, architecture layers, and alpha scope direction.

### D-002: Keep the first project Android-first and Flutter-first
- Context: the product may eventually expand, but the initial goal is a real mobile alpha.
- Decision: optimize the first project for Flutter on Android, not cross-platform parity.
- Why: this keeps scope tight and maps directly to Bart’s immediate usage.

### D-003: Keep the gateway as the source of truth
- Context: OpenClaw already has gateway-owned session and admin state.
- Decision: ClawLine should be a mobile client over existing gateway surfaces, not a new backend.
- Why: this preserves architectural clarity and reduces unnecessary system drift.

### D-004: Prioritize session-first operator value before deep admin breadth
- Context: it is tempting to mirror every console surface immediately.
- Decision: the alpha focuses first on sessions, chat, activity, and read-first console health.
- Why: those flows create the biggest day-to-day value and differentiate the app from Telegram.

### D-005: Treat imported skill content as local runtime, not untouchable vendor truth
- Context: the added Flutter skill pack introduced a Delano validation issue.
- Decision: patch imported runtime docs locally when they violate repo rules.
- Why: repo quality and validator cleanliness take priority over preserving an upstream example verbatim.

## 2026-04-15

### D-006: Keep the first alpha slice dependency-light
- Context: the repo needed a real app shell immediately, but the current execution environment is restrictive and the live gateway client is not wired yet.
- Decision: implement the first slice with Flutter SDK primitives, a local fake gateway repository, and `ChangeNotifier`-based services instead of introducing a state-management or networking package up front.
- Why: this lands session-first structure now while keeping package choices reversible once the real gateway adapter is ready.

### D-007: Define the gateway contract as a read-model boundary before transport work
- Context: the architecture calls for a gateway-first client, but the exact mobile auth and transport details are still open.
- Decision: define a `GatewayRepository` contract for connection, sessions, transcript messages, activity, and console health, and keep the open handshake/pagination questions explicit in that boundary.
- Why: it separates product-state modeling from transport implementation and avoids burying unresolved backend assumptions in widgets.

### D-008: Keep Device out of the top-level alpha navigation
- Context: the architecture leaves room for Android-node workflows, but the first alpha needs tighter operator focus.
- Decision: keep the top-level shell to Chats, Activity, Console, and Settings, with device-specific concerns deferred behind console/settings work until the operator core is solid.
- Why: the product promise is session-first mobile operation, not a permission-heavy device surface in the first milestone.
