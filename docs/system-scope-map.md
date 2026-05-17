# Oliver-Local System Scope Map

Status: Active

`oliver-local` means the full local orchestration system at `~`, not only `.claude`.

## Scope Layers

- System root: `~`
- Control-plane repo checkout: `<vault-root>/_Management/Agent Orchestration/workspace/repos/orchestration/oliver-local`
- Codex runtime: `~/.codex`
- Agents runtime adapter: `~/.agents`
- Product repos: `<vault-root>/Oliver/_Project Repos/*`

## Source-of-Truth Rules

- Shared orchestration contracts:
  - `<vault-root>/_Management/Agent Orchestration/workspace/repos/orchestration/oliver-local/contracts/AGENT_SHARED_STRUCTURE.md`
  - `<vault-root>/_Management/Agent Orchestration/workspace/repos/orchestration/oliver-local/contracts/SHARED_ORCHESTRATION.md`
  - `<vault-root>/_Management/Agent Orchestration/workspace/repos/orchestration/oliver-local/contracts/AGENT_SYSTEM_MANIFEST.json`
- Persona definitions are canonical in one place (`<vault-root>/_Management/Agent Orchestration/workspace/repos/orchestration/oliver-local/personas/*`).
- Shared skills are canonical in one place (`<vault-root>/_Management/Agent Orchestration/workspace/repos/orchestration/oliver-local/skills/*`).
- Runtime skill adapters, when needed, point into `<vault-root>/_Management/Agent Orchestration/workspace/repos/orchestration/oliver-local/skills`.
- Any persona references outside canonical location are pointers only.
- `~/.claude` shared-facing directories are pointers into `<vault-root>/_Management/Agent Orchestration/workspace/repos/orchestration/oliver-local`; active duplicate copies are not allowed.

## Operational Rule

Agents treat `<vault-root>/_Management/Agent Orchestration/workspace/repos/orchestration/oliver-local` as the shared orchestration root and must keep `.claude`/`.codex`/`.agents` alignment documented through shared contracts.
