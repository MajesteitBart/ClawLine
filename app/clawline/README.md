# ClawLine app

This is the Android-first Flutter client for ClawLine.

## Current alpha slice

The current checkpoint includes:
- a session-first app shell
- bottom navigation for Chats, Activity, Console, and Settings
- typed gateway and domain models
- fake gateway-backed connection and session services
- baseline widget and service tests

## Local commands

From the repository root:

```bash
cd app/clawline && ../../.tooling/bin/flutterw pub get
cd app/clawline && ../../.tooling/bin/flutterw analyze --no-pub
cd app/clawline && ../../.tooling/bin/flutterw test
```

## Notes

- The live gateway adapter is not wired yet.
- The current shell is intentionally dependency-light so the transport contract can stay reversible while the alpha model settles.
