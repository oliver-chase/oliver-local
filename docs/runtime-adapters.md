# Runtime Adapters

Runtime folders are local adapter/state folders. They are visible on disk but are not tracked as folders inside this repo.

## Local Runtime Files

Each runtime folder must contain a README and an ORCHESTRATION entry:

- `~/.claude/README.md`
- `~/.claude/ORCHESTRATION.md`
- `~/.codex/README.md`
- `~/.codex/ORCHESTRATION.md`
- `~/.agents/README.md`
- `~/.agents/ORCHESTRATION.md`

These files must point agents back to `~/oliver-local` for shared contracts, workflows, scripts, personas, identity, and skills.

## Ownership

- Shared orchestration source of truth: `~/oliver-local`.
- Claude runtime state: `~/.claude`.
- Codex runtime state: `~/.codex`.
- Agent runtime state: `~/.agents`.

Runtime-local config, auth, logs, sessions, cache, and memory stay in runtime folders. Shared instructions and shared skills stay in `~/oliver-local`.

## Guardrail

`scripts/test-structure.sh` fails if a runtime README or ORCHESTRATION file is missing or stops pointing to `~/oliver-local`.
