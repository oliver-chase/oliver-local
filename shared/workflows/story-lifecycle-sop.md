# Story Lifecycle SOP

Canonical backlog discipline for this workspace.

Use this before and after implementation work unless the user explicitly asks for execution-only work.

## Intake gate (before execution)

- Convert every actionable request into a user story before coding unless explicitly out-of-band (pure documentation lookup, read-only research, or planning discussion).
- Check existing backlog first and place the new story in the active project backlog when missing.
- Add/update clear:
  - `Status` (`In Progress` before work, `Done` after verification)
  - `Epic` / parent story reference
  - acceptance criteria (at least one verifiable test/behavior criterion)
  - scope boundaries (what is in and out)
  - estimated priority if not provided (default: normal)
- Perform prioritization pass against adjacent backlog items before execution.
- If priority is changed, note why in the story and keep ordering rationale in the backlog item.

## Execution and completion gate

- Implement against the story and keep story text as the source of truth for scope.
- Do not mark done until evidence is added.
- On completion update:
  - acceptance criteria status (checked off with evidence references)
  - `QA/Evidence` with evidence links, commands, or artifact ids
  - `Status: Done` only when acceptance is satisfied
- Remove the finished item from planning buckets (or move to completed archive) and place details in the canonical user story/epic record.
- If the story already has an epic and acceptance in git, do not leave duplicates in planning docs.
- If blocked, set status explicitly blocked and record the blocking reason and next action.

## Pre-push readiness

- Verify: story complete, evidence attached, backlog cleanup done.
- Verify: no active or duplicate scope remains in planning docs.
- Verify: cross-project consistency maintained (project-specific docs and `/projects/*` policy docs are aligned).

## Canonical references

- Primary backlog workflow: `shared/workflows/backlog-workflow.md`
- Global canonical policy: `~/.codex/skills/story-lifecycle-gate/SKILL.md`
