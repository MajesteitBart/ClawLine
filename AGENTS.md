# AGENTS.md

This repository follows Delano.

## Start here

Before doing substantive work:
1. Read `README.md`
2. Read `docs/architecture_outline.md`
3. Read `HANDBOOK.md`
4. Read the current Delano context pack in `.project/context/`
5. Check `.agents/rules/` for any relevant execution constraints

## Project intent

ClawLine is an OpenClaw mobile product repo.
The current planning baseline is the architecture in `docs/architecture_outline.md`.

Treat that file as the source planning brief until more specific Delano project artifacts exist.

## Delano ways of working

Use Delano in this order whenever possible:

1. **discovery-skill**
   - Use when clarifying user needs, open questions, assumptions, risks, or product scope.
   - Expected output: clearer problem framing, constraints, and unresolved questions.

2. **planning-skill**
   - Use after discovery and architecture alignment.
   - Convert the architecture into a concrete delivery plan and first Delano project structure.

3. **breakdown-skill**
   - Use once a plan is accepted.
   - Split the plan into workstreams and atomic implementation tasks.

4. **sync-skill**
   - Use whenever local Delano artifacts need to stay aligned with external trackers like Linear or GitHub.
   - Do not let local plan state drift from tracked execution state.

5. **execution-skill**
   - Use for implementation once a task is atomic and clear enough to build.
   - Prefer small, testable slices.

6. **quality-skill**
   - Use before review, handoff, or merge.
   - Verify behavior, tests, and contract alignment.

7. **closeout-skill**
   - Use when a task, workstream, or milestone is complete.
   - Record completion cleanly and close the loop in Delano artifacts.

8. **learning-skill**
   - Use after major decisions, releases, bugs, or workflow lessons worth preserving.
   - Capture durable learnings so the repo gets easier to work in over time.

## Execution guidance

- Keep the architecture and the Delano project artifacts aligned.
- Prefer atomic tasks over broad implementation sweeps.
- Do not jump straight into coding if the `.project/context/` files are still generic and missing essential repo truth.
- Update context first, then create the first project, then implement.
- Keep commits small and legible.
- If architecture and implementation drift, update the Delano artifacts or call out the mismatch explicitly.

## Initial focus for this repo

The first project should translate `docs/architecture_outline.md` into an executable alpha plan for a Flutter Android app.
That likely means defining:
- the app shell,
- core navigation,
- session model,
- gateway connectivity assumptions,
- activity/operator surfaces,
- and the first delivery slices for implementation.
