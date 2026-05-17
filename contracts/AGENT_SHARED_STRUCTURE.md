# Agent Shared Structure

Shared contract for agent runtimes on this machine.

## Canonical Paths

- Product repos: `<vault-root>/Oliver/_Project Repos/*`
- Shared system root: `<vault-root>/Oliver/_Project Repos/oliver-local`
- Claude runtime/orchestration: `~/.claude`
- Codex runtime: `~/.codex`
- Agents runtime: `~/.agents`
- Shared skills root: `<vault-root>/Oliver/_Project Repos/oliver-local/skills`
- Shared orchestration core: `<vault-root>/Oliver/_Project Repos/oliver-local/contracts/SHARED_ORCHESTRATION.md`
- Shared manifest: `<vault-root>/Oliver/_Project Repos/oliver-local/contracts/AGENT_SYSTEM_MANIFEST.json`
- Shared hygiene standard: `<vault-root>/Oliver/_Project Repos/oliver-local/contracts/PROJECT_HYGIENE_STANDARD.md`

## Ownership

- Product-specific implementation docs/workflows belong in each project repo.
- Cross-project orchestration standards belong in `<vault-root>/Oliver/_Project Repos/oliver-local/shared/*`.
- Shared skills/tools belong in `<vault-root>/Oliver/_Project Repos/oliver-local/skills/*`.
- Project hygiene and security rules belong in `<vault-root>/Oliver/_Project Repos/oliver-local/contracts/PROJECT_HYGIENE_STANDARD.md`.
- Runtime state in `.claude`, `.codex`, and `.agents` is operational data, not product source code.
- Shared workflow orchestration is runtime-neutral: Claude, Codex, and other agent runtimes reference the same shared workflow sources in `<vault-root>/Oliver/_Project Repos/oliver-local/shared/*`.

## Sync Contract

When workspace structure or cross-project standards change:
1. Update `<vault-root>/Oliver/_Project Repos/oliver-local/contracts/AGENT_SHARED_STRUCTURE.md`.
2. Update `<vault-root>/Oliver/_Project Repos/oliver-local/contracts/SHARED_ORCHESTRATION.md`.
3. Keep runtime entries (`~/.claude/ORCHESTRATION.md`, `~/.codex/ORCHESTRATION.md`, `~/.agents/ORCHESTRATION.md`) aligned to `<vault-root>/Oliver/_Project Repos/oliver-local`.
4. Update `<vault-root>/Oliver/_Project Repos/oliver-local/contracts/AGENT_SYSTEM_MANIFEST.json` if paths or roots changed.
