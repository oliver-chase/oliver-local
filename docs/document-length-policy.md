# Documentation Length Policy

Purpose: keep active docs concise, scannable, and non-duplicative.

## Canonical Limits (Active Docs)

- Workspace root docs (`README.md`, `CLAUDE.md`, `ORCHESTRATION.md`): target <= 140 lines each.
- Workspace architecture/pointer docs in `docs/`: target <= 220 lines each.
- Shared workflow standards/index docs in `shared/`: target <= 240 lines each.
- Workflow SOP files in `shared/workflows/`: target <= 260 lines each.

## Out of Scope

- `docs/archive/**` archive snapshots
- Generated verification reports (`docs/runtime-verification/**`)
- Skill bodies under `skills/**`

## Enforcement

- Gate script: `/Users/oliver/oliver-local/scripts/validate-doc-lengths.sh`
- Included in: `/Users/oliver/oliver-local/scripts/run-governance-gates.sh`
