# Claude Runtime Adapter

`~/.claude` is Claude runtime adapter/state for this machine.

Canonical shared orchestration files live in `<vault-root>/_Management/Agent Orchestration/workspace/repos/orchestration/oliver-local`. Do not treat `~/.claude` as the shared-system source of truth.

## Orchestration Entry

- Entry file: `~/.claude/ORCHESTRATION.md`

- Shared root: `<vault-root>/_Management/Agent Orchestration/workspace/repos/orchestration/oliver-local`
- Contracts: `<vault-root>/_Management/Agent Orchestration/workspace/repos/orchestration/oliver-local/contracts/*`
- Shared workflows: `<vault-root>/_Management/Agent Orchestration/workspace/repos/orchestration/oliver-local/shared/workflows/*`
- Shared skills: `<vault-root>/_Management/Agent Orchestration/workspace/repos/orchestration/oliver-local/skills/*`
- Governance gates: `<vault-root>/_Management/Agent Orchestration/workspace/repos/orchestration/oliver-local/scripts/run-governance-gates.sh`

## Runtime Adapter

- Entry file: `~/.claude/ORCHESTRATION.md`
- Claude-specific hooks/settings/runtime state may live under `~/.claude`.
- `~/.claude/skills` points to `<vault-root>/_Management/Agent Orchestration/workspace/repos/orchestration/oliver-local/skills`.

## Operating Rule

When changing shared instructions, edit `<vault-root>/_Management/Agent Orchestration/workspace/repos/orchestration/oliver-local`, then run the gates from `<vault-root>/_Management/Agent Orchestration/workspace/repos/orchestration/oliver-local`.
