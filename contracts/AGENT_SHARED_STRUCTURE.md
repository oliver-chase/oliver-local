# Agent Shared Structure

Shared contract for agent runtimes on this machine.

## Canonical Paths

- Product repos: `~/projects/*`
- Shared system root: `~/oliver-local`
- Claude runtime/orchestration: `~/.claude`
- Codex runtime: `~/.codex`
- Agents runtime: `~/.agents`
- Shared skills root: `~/oliver-local/skills`
- Shared orchestration core: `~/oliver-local/contracts/SHARED_ORCHESTRATION.md`
- Shared manifest: `~/oliver-local/contracts/AGENT_SYSTEM_MANIFEST.json`
- Shared hygiene standard: `~/oliver-local/contracts/PROJECT_HYGIENE_STANDARD.md`

## Ownership

- Product-specific implementation docs/workflows belong in each project repo.
- Cross-project orchestration standards belong in `~/oliver-local/shared/*`.
- Shared skills/tools belong in `~/oliver-local/skills/*`.
- Project hygiene and security rules belong in `~/oliver-local/contracts/PROJECT_HYGIENE_STANDARD.md`.
- Runtime state in `.claude`, `.codex`, and `.agents` is operational data, not product source code.
- Shared workflow orchestration is runtime-neutral: Claude, Codex, and other agent runtimes reference the same shared workflow sources in `~/oliver-local/shared/*`.

## Sync Contract

When workspace structure or cross-project standards change:
1. Update `~/oliver-local/contracts/AGENT_SHARED_STRUCTURE.md`.
2. Update `~/oliver-local/contracts/SHARED_ORCHESTRATION.md`.
3. Keep runtime entries (`~/.claude/ORCHESTRATION.md`, `~/.codex/ORCHESTRATION.md`, `~/.agents/ORCHESTRATION.md`) aligned to `~/oliver-local`.
4. Update `~/oliver-local/contracts/AGENT_SYSTEM_MANIFEST.json` if paths or roots changed.
