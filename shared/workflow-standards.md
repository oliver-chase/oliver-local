# Workflow Standards

These are the cross-agent rules both Claude and Codex should follow when working in the Oliver workspace.

## Trigger Routing

Use these trigger terms as workflow selectors:

- `backlog` -> `shared/workflows/backlog-workflow.md`
- `story lifecycle` -> `shared/workflows/story-lifecycle-sop.md`
- `testing` -> `shared/workflows/testing-rules.md`
- `qa` -> `shared/workflows/qa-process.md`
- `full qa` -> `shared/workflows/full-qa-audit.md`
- `oliver-local sync` -> `shared/workflows/oliver-local-sync.md`

If any trigger term conflicts with active repo docs, pause and surface the exact conflict before continuing.

## Repo Location

All product repos live under `~/projects/`.

## Product Repos

- `tesknota`
- `v-two-sdr`
- `fallow`
- `oliver-app`

## Orchestration Upkeep

When workspace layout or active local repos change:

- run `shared/workflows/oliver-local-sync.md`
- reconcile `shared/repo-map.json` and `docs/projects/*.md`
- run `scripts/check-doc-config-impact.sh`
- re-run `scripts/test-structure.sh` before commit
- for `oliver-local` sync work, commit and push immediately after checks pass

## Stack Reality

The current workspace is primarily:

- JavaScript
- HTML
- CSS

Workflow-adjacent systems also matter:

- Google Sheets
- Outlook
- frontend design review
- mobile optimization

## Orchestration Rules

- Do not duplicate project repos just to expose them to another agent runtime
- Do not create a second fake checkout of `oliver-local`
- Keep Claude and Codex runtime state separate
- Put shared metadata and standards in tracked files once
- Treat the live machine layout as the source of truth over stale cached paths

## Design Standards

- Preserve the existing visual language of each product unless a redesign is requested
- Prioritize mobile responsiveness and touch usability
- Treat frontend polish, spacing, hierarchy, and accessibility as first-class concerns

## Operational Standards

- Prefer SSH Git remotes for `oliver-chase/*`
- Do not hard-code primary vs. secondary repo assumptions into long-lived docs
- Keep deployment and repo-path knowledge in tracked metadata instead of agent memory alone

## Testing Baseline

Testing applies to all code work. Follow `shared/workflows/testing-rules.md` as a required gate.
