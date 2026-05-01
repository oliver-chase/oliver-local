---
name: "story-lifecycle-gate"
aliases: "Story Lifecycle SOP, Story Lifecycle SOP (Backlog + AC + Push Readiness)"
description: "Apply story completion lifecycle checks: mark docs done only when AC + evidence are captured, then remove completed stories from planning docs and keep backlog files as source of truth."
---

# Story Lifecycle Gate (Universal, All Projects)

Use this protocol whenever a project asks to "go through docs" for backlog/story completion.

## Rules

## Intake gate (before execution)

1. **Every explicit request becomes a story before implementation begins**
   - If the user request is substantial, ambiguous, or likely spans multiple edits, create or locate a story file before code changes.
   - Required minimum fields in backlog/story artifact:
     - `Epic` (or provisional `epic-unassigned`)
     - `Status` (default `In Progress` after creation)
     - `Acceptance Criteria` (checkbox checklist)
     - `QA / Evidence` section with planned verification approach
     - file-level scope and owners (module/files touched, tests to run)
   - If no explicit priority is provided, add the story to the active backlog queue with neutral/standard priority and do not start execution until it is queued.

2. **Prioritization pass before execution**
   - On every request, run a quick prioritization pass:
     - Check related active backlog entries in the project’s planning docs.
     - Avoid duplicate tickets if the same behavior already exists.
     - Assign relative position:
       - critical blocker / user-facing regression / security
       - required dependency
       - normal
       - optional/cleanup
   - If a priority is not provided by the user, keep default queue position and proceed with the request as “queued unless execution is already in progress in the current thread.”

3. **No silent execution**
   - Do not execute implementation steps without either:
     - a created/updated story that captures scope and AC, or
     - confirmation that the task is explicitly non-story execution (e.g., read-only review, command-only checks).

1. **Never trust status labels alone**
   - `Status: In Progress` requires evidence-driven upgrade before completion.
   - `Status: Done` requires acceptance criteria evidence being verifiable in repo commits.

2. **Completion checks before state change**
   - Accept criteria are complete when all checklist items are checked in the story file (`- [x]`).
   - If AC has a dependency on evidence, verify explicit evidence links in the story (`Evidence:` section, ticket links, test artifacts, log files, screenshots).
   - If evidence is not present, keep status `In Progress` and mark remaining action items.

3. **Mandatory lifecycle transition**
   - `In Progress` + all AC complete + evidence present -> set `Status: Done`.
   - Set `Verified: true` only when AC+evidence are complete in git-tracked files.

4. **Planning doc hygiene (unskippable)**
   - Remove the completed story from active planning lists immediately after state transition.
   - Update any aggregate counts in the planning file to reflect remaining active stories.
   - Never leave completed stories in planning lists unless blocked by missing external evidence.

5. **Backlog-first source of truth**
   - Use planning files as the working queue.
   - Keep story files as immutable execution/evidence records.
   - Do not add completed items to planning as active work again.

6. **Cross-project behavior**
   - Apply the same rule set in every project backlog folder, even if status vocabulary differs (`Backlog`, `Code Present`, etc.).
   - If statuses differ, map to lifecycle equivalent:
     - active -> `In Progress`/`Backlog`/`Not Started`
     - complete -> `Done`/`Complete`
     - code-ready -> `Code Present` only if evidence section is fully linked.

9. **New stories are part of this gate**
   - New request-derived stories start in the active planning file and must be kept there until evidence and validation pass.
   - Remove only when status transitions are complete and verified.

8. **Pre-push / pre-commit readiness**
   - Before any commit or staging push, verify:
     - story/epic linkage is present (or `epic-unassigned` with explicit follow-up)
     - `Acceptance Criteria` are complete and evidence is linked where required
     - QA gates have status recorded (`typecheck`, `lint`, `build`, and relevant tests)
     - backlog state was updated (done stories removed from active planning, counts adjusted)
     - the change scope can be explained as complete per Epic/Story set
   - If evidence or checks are missing, block the push and create/update an explicit “incomplete/pending” action item in the active backlog.

10. **Commit and push output**
   - For execution tasks, return:
     - completed stories moved to `Done` and `Verified`
     - backlog removals and updated planning counts
     - any blocked stories requiring external/manual evidence before push

11. **Output expectation when asked**
   - Return a list of:
     - stories marked done (new)
     - stories removed from planning
     - stories blocked by missing external/manual evidence

## Test-writing discipline (required for execution stories)

1. **Test plan belongs in the story**
   - Every execution story must include a test section before coding starts.
   - Include explicit test mapping for each AC item:
     - manual step (if UI behavior is primarily manual),
     - automated test file path(s),
     - test case IDs (or test titles),
     - expected result.

2. **Test coverage minimum**
   - Before transition to `Done`, the story must include at least:
     - one positive-path automated or contract check for each behavior-critical AC,
     - one negative-path check for at least one core guardrail/error path,
     - one regression check for a touched adjacent behavior if changed behavior is shared.
   - If required coverage is missing, keep `Status` as `In Progress` and add explicit pending tests in planning.

3. **Evidence format**
   - The `QA / Evidence` section must link:
     - test commands run (for example, `npm run test:e2e`, `npm run test:contracts`, etc.),
     - exact command output location or log file path if outputs are persisted,
     - and a short summary of pass/fail by test area.

4. **Pre-commit/push verification**
   - Do not mark a story `Done` until required automated tests for changed modules have been executed and recorded.
   - `Blocked` status may be used when environment-dependent tests cannot run in-thread, with a concrete unblock plan.

## Documentation and source-of-truth rules (Cross-project)

1. **PRD-to-backlog transition**
   - If a PRD includes long-form user stories, normalize it into a module-specific backlog file with executable story mapping and AC tracking.
   - Keep only a concise source pointer in the PRD (path to source story file + intended module backlog folder/readme).
   - The backlog file is the canonical execution artifact for that work stream.

2. **No duplicate story archives**
   - Do not create duplicate copies of the same story body in multiple active planning/backlog files.
   - Keep one active planning file per workstream/module and cross-link rather than copy-paste when possible.

3. **Module-specific backlog separation**
   - Keep backlog files in module-specific subfolders under a shared backlog root.
   - Each active module backlog requires a dedicated README that inventories its tickets and source references.
   - Do not mix unrelated module stories in one module README (for example, slides stories in campaign backlog and vice versa).

4. **Cross-module stories**
   - If a request spans modules, keep it in a cross-module planning artifact or create linked entries in each affected module backlog with clear primary module ownership.

5. **Backlog structure**
   - Each module/workstream keeps one primary active planning file in:
     - `.github/user-stories/oliver-app/backlog/<module-folder>/README.md`
   - Ticket files in that module folder are the execution backlog; cross-module impacts must be linked from the primary module file.
   - Do not place unrelated module stories in the same active backlog list; if a ticket touches two modules, either:
     - create a dedicated cross-module bundle, or
     - list it in each affected module with explicit primary ownership and shared dependency note.
