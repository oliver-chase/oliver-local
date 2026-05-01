# Workflow Standards

Cross-agent workflow routing and standards.

## Authoritative References

- Shared orchestration core: `/Users/oliver/SHARED_ORCHESTRATION.md`
- Shared manifest: `/Users/oliver/AGENT_SYSTEM_MANIFEST.json`

## Trigger Routing

Use these trigger terms as workflow selectors:

- `backlog` -> `shared/workflows/backlog-workflow.md`
- `story lifecycle` -> `shared/workflows/story-lifecycle-sop.md`
- `testing` -> `shared/workflows/testing-rules.md`
- `qa` -> `shared/workflows/qa-process.md`
- `full qa` -> `shared/workflows/full-qa-audit.md`
- `oliver-local sync` -> `shared/workflows/oliver-local-sync.md`

If a trigger term conflicts with active repo docs, surface the conflict before continuing.

## Repo Location

All product repos live under `~/projects/`.

## Orchestration Rules

- Keep `.claude` and `.codex` runtime state separate.
- Keep shared standards in one place (`~/.claude/shared/*`).
- Do not duplicate product workflow docs into runtime folders.
- Do not duplicate shared SOP/workflow files into project repos; reference canonical shared workflows instead.
- Treat live machine layout as source of truth over stale cached paths.

## Testing Baseline

Testing applies to all code work. Follow `shared/workflows/testing-rules.md`.
