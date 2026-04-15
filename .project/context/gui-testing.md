# GUI Testing Policy

## Enforcement Mode
- `advisory` until the Flutter app shell exists and can be exercised on Android.

## Smoke Routes
- App launch and shell render.
- Gateway connection flow.
- Session list and session switch.
- Active chat view and composer shell.
- Activity feed and approvals visibility.
- Console overview for gateway and node state.

## Console Filtering
- Treat crashes, blank screens, navigation dead ends, and gateway-state desync as blocking.
- Treat harmless debug noise as non-blocking unless it hides a real UX issue.

## Evidence Requirements
- Capture at least one screenshot or short note per critical route when UI work lands.
- Record obvious usability issues, loading-state problems, or visual regressions in project updates or task evidence logs.

## Design Validation Threshold
- The app should feel intentionally mobile, not like a squeezed desktop admin panel.
- Clean chat readability and operator trust matter more than decorative polish in the alpha.
