# Codex Runtime Adapter

`~/.codex` is Codex runtime adapter/state for this machine.

Canonical shared orchestration files live in `<vault-root>/Oliver/_Project Repos/oliver-local`. Do not treat `~/.codex` as the shared-system source of truth.

## Orchestration Entry

- Entry file: `~/.codex/ORCHESTRATION.md`
- Shared root: `<vault-root>/Oliver/_Project Repos/oliver-local`
- Contracts: `<vault-root>/Oliver/_Project Repos/oliver-local/contracts/*`
- Shared workflows: `<vault-root>/Oliver/_Project Repos/oliver-local/shared/workflows/*`
- Shared skills: `<vault-root>/Oliver/_Project Repos/oliver-local/skills/*`
- Governance gates: `<vault-root>/Oliver/_Project Repos/oliver-local/scripts/run-governance-gates.sh`

## Runtime Adapter

- Codex-specific config, auth, logs, sessions, cache, and memory may live under `~/.codex`.
- Shared skills belong in `<vault-root>/Oliver/_Project Repos/oliver-local/skills`; runtime-local skill links may point there.
- `~/.codex/skills/story-lifecycle-gate` points to `<vault-root>/Oliver/_Project Repos/oliver-local/skills/story-lifecycle-gate`.

## Operating Rule

When changing shared instructions, edit `<vault-root>/Oliver/_Project Repos/oliver-local`, then run the gates from `<vault-root>/Oliver/_Project Repos/oliver-local`.
