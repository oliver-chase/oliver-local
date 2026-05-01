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

## Tracked Runtime Pointer Copies

Git-tracked copies live in:

- `runtime-pointers/.claude/README.md`
- `runtime-pointers/.claude/ORCHESTRATION.md`
- `runtime-pointers/.codex/README.md`
- `runtime-pointers/.codex/ORCHESTRATION.md`
- `runtime-pointers/.agents/README.md`
- `runtime-pointers/.agents/ORCHESTRATION.md`

The tracked copies document the intended runtime adapter context for Git review. The live runtime files should stay byte-for-byte aligned with these copies unless a runtime-specific reason is documented here.

## Ownership

- Shared orchestration source of truth: `~/oliver-local`.
- Claude runtime state: `~/.claude`.
- Codex runtime state: `~/.codex`.
- Agent runtime state: `~/.agents`.

Runtime-local config, auth, logs, sessions, cache, and memory stay in runtime folders. Shared instructions and shared skills stay in `~/oliver-local`.

## Guardrail

`scripts/test-structure.sh` fails if a runtime README or ORCHESTRATION file is missing, stops pointing to `~/oliver-local`, or drifts from the tracked copy in `runtime-pointers/*`.
