# Codex Runtime Adapter

`~/.codex` is Codex runtime adapter/state for this machine.

Canonical shared orchestration files live in `<vault-root>/_Management/Agent Orchestration/repos/oliver-local`. Do not treat `~/.codex` as the shared-system source of truth.

## Orchestration Entry

- Entry file: `~/.codex/ORCHESTRATION.md`
- Shared root: `<vault-root>/_Management/Agent Orchestration/repos/oliver-local`
- Contracts: `<vault-root>/_Management/Agent Orchestration/repos/oliver-local/contracts/*`
- Shared workflows: `<vault-root>/_Management/Agent Orchestration/repos/oliver-local/shared/workflows/*`
- Shared skills: `<vault-root>/_Management/Agent Orchestration/repos/oliver-local/skills/*`
- Governance gates: `<vault-root>/_Management/Agent Orchestration/repos/oliver-local/scripts/run-governance-gates.sh`

## Runtime Adapter

- Codex-specific config, auth, logs, sessions, cache, and memory may live under `~/.codex`.
- Shared skills belong in `<vault-root>/_Management/Agent Orchestration/repos/oliver-local/skills`; runtime-local skill links may point there.
- `~/.codex/skills/story-lifecycle-gate` points to `<vault-root>/_Management/Agent Orchestration/repos/oliver-local/skills/story-lifecycle-gate`.

## Operating Rule

When changing shared instructions, edit `<vault-root>/_Management/Agent Orchestration/repos/oliver-local`, then run the gates from `<vault-root>/_Management/Agent Orchestration/repos/oliver-local`.
