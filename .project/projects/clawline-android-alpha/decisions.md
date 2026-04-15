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
