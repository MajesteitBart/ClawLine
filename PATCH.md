# PATCH.md

## 2026-04-16

### Smallest local fix for workspace type resolution

Applied a repo-local TypeScript path override in `packages/happy-app/tsconfig.json`:

- mapped `@slopus/happy-wire` to `../happy-wire/src/index.ts`

### Why

The imported Happy workspace is symlinked correctly under pnpm, but `packages/happy-wire/package.json` only exposes built `dist/*` entrypoints and type declarations. In this pivoted local workspace, `dist/` is not present yet, so `happy-app` could not resolve `@slopus/happy-wire` during local typechecking.

This patch keeps the fix intentionally narrow:
- local workspace only
- no package publish behavior changes
- no runtime import behavior changes
- no broader refactor of upstream package exports

### Intended effect

- let `packages/happy-app` typecheck against the local `happy-wire` source during development
- keep the ClawLine fork moving without inventing a broader upstream export strategy yet

### Remaining caveat

This does **not** promise a fully clean `happy-app` typecheck. It only removes the missing local workspace source-resolution failure so the remaining diagnostics reflect actual app-source issues rather than missing package build artifacts.
