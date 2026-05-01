# Agent Shared Structure

Shared contract for agent runtimes on this machine.

## Canonical Paths

- Product repos: `~/projects/*`
- Claude runtime/orchestration: `~/.claude` (alias `~/oliver-local`)
- Codex runtime: `~/.codex`
- Shared local skill packs: `~/.agents`
- Shared orchestration core: `/Users/oliver/SHARED_ORCHESTRATION.md`
- Shared manifest: `/Users/oliver/AGENT_SYSTEM_MANIFEST.json`

## Ownership

- Product-specific implementation docs/workflows belong in each project repo.
- Cross-project orchestration standards belong in `~/.claude/shared/*`.
- Runtime state in `.claude` and `.codex` is operational data, not product source code.
- Shared workflow orchestration is runtime-neutral: both Claude and Codex reference the same shared workflow sources in `~/.claude/shared/*`.

## Sync Contract

When workspace structure or cross-project standards change:
1. Update `/Users/oliver/AGENT_SHARED_STRUCTURE.md`.
2. Update `/Users/oliver/SHARED_ORCHESTRATION.md`.
3. Keep `~/.claude/ORCHESTRATION.md` and `~/.codex/ORCHESTRATION.md` aligned.
4. Update `/Users/oliver/AGENT_SYSTEM_MANIFEST.json` if paths or roots changed.
