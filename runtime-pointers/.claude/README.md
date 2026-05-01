# Claude Runtime Adapter

`~/.claude` is Claude runtime adapter/state for this machine.

Canonical shared orchestration files live in `~/oliver-local`. Do not treat `~/.claude` as the shared-system source of truth.

## Orchestration Entry

- Entry file: `~/.claude/ORCHESTRATION.md`

- Shared root: `~/oliver-local`
- Contracts: `~/oliver-local/contracts/*`
- Shared workflows: `~/oliver-local/shared/workflows/*`
- Shared skills: `~/oliver-local/skills/*`
- Governance gates: `~/oliver-local/scripts/run-governance-gates.sh`

## Runtime Adapter

- Entry file: `~/.claude/ORCHESTRATION.md`
- Claude-specific hooks/settings/runtime state may live under `~/.claude`.
- `~/.claude/skills` points to `~/oliver-local/skills`.

## Operating Rule

When changing shared instructions, edit `~/oliver-local`, then run the gates from `~/oliver-local`.
