# Claude Runtime Adapter

`~/.claude` is Claude runtime adapter/state for this machine.

Canonical shared orchestration files live in `<vault-root>/Oliver/_Project Repos/oliver-local`. Do not treat `~/.claude` as the shared-system source of truth.

## Orchestration Entry

- Entry file: `~/.claude/ORCHESTRATION.md`

- Shared root: `<vault-root>/Oliver/_Project Repos/oliver-local`
- Contracts: `<vault-root>/Oliver/_Project Repos/oliver-local/contracts/*`
- Shared workflows: `<vault-root>/Oliver/_Project Repos/oliver-local/shared/workflows/*`
- Shared skills: `<vault-root>/Oliver/_Project Repos/oliver-local/skills/*`
- Governance gates: `<vault-root>/Oliver/_Project Repos/oliver-local/scripts/run-governance-gates.sh`

## Runtime Adapter

- Entry file: `~/.claude/ORCHESTRATION.md`
- Claude-specific hooks/settings/runtime state may live under `~/.claude`.
- `~/.claude/skills` points to `<vault-root>/Oliver/_Project Repos/oliver-local/skills`.

## Operating Rule

When changing shared instructions, edit `<vault-root>/Oliver/_Project Repos/oliver-local`, then run the gates from `<vault-root>/Oliver/_Project Repos/oliver-local`.
