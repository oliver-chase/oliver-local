# Codex Runtime Adapter

`~/.codex` is Codex runtime adapter/state for this machine.

Canonical shared orchestration files live in `~/oliver-local`. Do not treat `~/.codex` as the shared-system source of truth.

## Orchestration Entry

- Entry file: `~/.codex/ORCHESTRATION.md`
- Shared root: `~/oliver-local`
- Contracts: `~/oliver-local/contracts/*`
- Shared workflows: `~/oliver-local/shared/workflows/*`
- Shared skills: `~/oliver-local/skills/*`
- Governance gates: `~/oliver-local/scripts/run-governance-gates.sh`

## Runtime Adapter

- Codex-specific config, auth, logs, sessions, cache, and memory may live under `~/.codex`.
- Shared skills belong in `~/oliver-local/skills`; runtime-local skill links may point there.
- `~/.codex/skills/story-lifecycle-gate` points to `~/oliver-local/skills/story-lifecycle-gate`.

## Operating Rule

When changing shared instructions, edit `~/oliver-local`, then run the gates from `~/oliver-local`.
