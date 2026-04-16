# GUI Testing Policy

## Enforcement Mode
- `advisory` while the Happy-based ClawLine adaptation is being re-established.

## Smoke Routes
- App launch and auth or linking entry flow.
- Session list render.
- Active session transcript render.
- Message composer send path.
- Activity or operator-status surface once adapted.
- At least one multimodal route when implemented, starting with image input.

## Console Filtering
- Treat crashes, blank screens, navigation dead ends, sync desync, and broken session rendering as blocking.
- Treat upstream debug noise as non-blocking unless it hides a real UX issue.

## Evidence Requirements
- Capture at least one screenshot or short note per critical route when UI work lands.
- Record obvious usability issues, loading-state problems, or visual regressions in project updates or task evidence logs.
- For multimodal work, include proof of the attachment or voice path actually working, not just static UI.

## Design Validation Threshold
- The app should feel intentionally mobile, not like a squeezed desktop admin panel.
- Clean chat readability and operator trust matter more than decorative polish.
- OpenClaw-specific operator value should become clearer over time, not blur into a generic coding-agent shell.
