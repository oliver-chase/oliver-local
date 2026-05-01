# Agents Runtime Adapter

`~/.agents` is agent-runtime adapter/state for this machine.

Canonical shared orchestration files live in `~/oliver-local`. Do not treat `~/.agents` as the shared-system source of truth.

## Orchestration Entry

- Entry file: `~/.agents/ORCHESTRATION.md`
- Shared root: `~/oliver-local`
- Contracts: `~/oliver-local/contracts/*`
- Shared workflows: `~/oliver-local/shared/workflows/*`
- Shared skills: `~/oliver-local/skills/*`
- Governance gates: `~/oliver-local/scripts/run-governance-gates.sh`

## Runtime Adapter

- Agent-specific lockfiles, locally installed runtime skills, cache, and state may live under `~/.agents`.
- Shared cross-runtime instructions belong in `~/oliver-local`.
- Runtime-specific external skills may remain in `~/.agents/skills` when they are not part of the shared orchestration contract.

## Operating Rule

When changing shared instructions, edit `~/oliver-local`, then run the gates from `~/oliver-local`.
