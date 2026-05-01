# Workflow Standards

Cross-agent workflow routing and standards.

## Authoritative References

- Shared orchestration core: `contracts/SHARED_ORCHESTRATION.md`
- Shared manifest: `contracts/AGENT_SYSTEM_MANIFEST.json`
- Project hygiene baseline: `contracts/PROJECT_HYGIENE_STANDARD.md`
- Project structure baseline: `contracts/PROJECT_STRUCTURE_STANDARD.md`

## Trigger Routing

Use these trigger terms as workflow selectors:

- `backlog` -> `shared/workflows/backlog-workflow.md`
- `story lifecycle` -> `shared/workflows/story-lifecycle-sop.md`
- `testing` -> `shared/workflows/testing-rules.md`
- `qa` -> `shared/workflows/qa-process.md`
- `full qa` -> `shared/workflows/full-qa-audit.md`
- `oliver-local sync` -> `shared/workflows/oliver-local-sync.md`
- `project standardization` -> `shared/workflows/project-standardization-lifecycle.md`

If a trigger term conflicts with active repo docs, surface the conflict before continuing.

## Repo Location

All product repos live under `~/projects/`.

## Orchestration Rules

- Keep `.claude`, `.codex`, and `.agents` runtime state separate.
- Keep shared standards in one place (`~/oliver-local/shared/*`).
- Keep shared skills in one place (`~/oliver-local/skills/*`).
- Do not duplicate product workflow docs into runtime folders.
- Do not duplicate shared SOP/workflow files into project repos; reference canonical shared workflows instead.
- Treat live machine layout as source of truth over stale cached paths.

## Testing Baseline

Testing applies to all code work. Follow `shared/workflows/testing-rules.md`.

## Branch Lifecycle Standard (All Projects)

- `development`: unstarted and in-progress story housing.
- `staging`: completed work that is ready for QA validation.
- `main`: production-ready promotions only.
- This lifecycle is mandatory across all project repos under `~/projects/`.
- Change-one/change-all rule: if any repo lifecycle wording changes, update this file and the managed template files in the same governance cycle.

## Cross-Repo Quality Baseline

- Canonical managed quality files live in `shared/templates/project`.
- Sync all mapped repos: `bash ~/oliver-local/scripts/sync-project-hygiene.sh`.
- Audit strict-file drift: `bash ~/oliver-local/scripts/audit-project-hygiene.sh`.
- Policy: a managed-file change in one repo is invalid unless the canonical template is updated and re-synced to all repos.
