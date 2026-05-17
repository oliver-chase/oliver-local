# Agents Runtime Adapter

`~/.agents` is agent-runtime adapter/state for this machine.

Canonical shared orchestration files live in `<vault-root>/_Management/Agent Orchestration/repos/oliver-local`. Do not treat `~/.agents` as the shared-system source of truth.

## Orchestration Entry

- Entry file: `~/.agents/ORCHESTRATION.md`
- Shared root: `<vault-root>/_Management/Agent Orchestration/repos/oliver-local`
- Contracts: `<vault-root>/_Management/Agent Orchestration/repos/oliver-local/contracts/*`
- Shared workflows: `<vault-root>/_Management/Agent Orchestration/repos/oliver-local/shared/workflows/*`
- Shared skills: `<vault-root>/_Management/Agent Orchestration/repos/oliver-local/skills/*`
- Governance gates: `<vault-root>/_Management/Agent Orchestration/repos/oliver-local/scripts/run-governance-gates.sh`

## Runtime Adapter

- Agent-specific lockfiles, locally installed runtime skills, cache, and state may live under `~/.agents`.
- Shared cross-runtime instructions belong in `<vault-root>/_Management/Agent Orchestration/repos/oliver-local`.
- Runtime-specific external skills may remain in `~/.agents/skills` when they are not part of the shared orchestration contract.

## Operating Rule

When changing shared instructions, edit `<vault-root>/_Management/Agent Orchestration/repos/oliver-local`, then run the gates from `<vault-root>/_Management/Agent Orchestration/repos/oliver-local`.
