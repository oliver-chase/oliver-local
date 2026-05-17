# Oliver-Local System Scope Map

Status: Active

`oliver-local` means the full local orchestration system at `~`, not only `.claude`.

## Scope Layers

- System root: `~`
- Control-plane repo checkout: `<vault-root>/Oliver/_Project Repos/oliver-local`
- Codex runtime: `~/.codex`
- Agents runtime adapter: `~/.agents`
- Product repos: `<vault-root>/Oliver/_Project Repos/*`

## Source-of-Truth Rules

- Shared orchestration contracts:
  - `<vault-root>/Oliver/_Project Repos/oliver-local/contracts/AGENT_SHARED_STRUCTURE.md`
  - `<vault-root>/Oliver/_Project Repos/oliver-local/contracts/SHARED_ORCHESTRATION.md`
  - `<vault-root>/Oliver/_Project Repos/oliver-local/contracts/AGENT_SYSTEM_MANIFEST.json`
- Persona definitions are canonical in one place (`<vault-root>/Oliver/_Project Repos/oliver-local/personas/*`).
- Shared skills are canonical in one place (`<vault-root>/Oliver/_Project Repos/oliver-local/skills/*`).
- Runtime skill adapters, when needed, point into `<vault-root>/Oliver/_Project Repos/oliver-local/skills`.
- Any persona references outside canonical location are pointers only.
- `~/.claude` shared-facing directories are pointers into `<vault-root>/Oliver/_Project Repos/oliver-local`; active duplicate copies are not allowed.

## Operational Rule

Agents treat `<vault-root>/Oliver/_Project Repos/oliver-local` as the shared orchestration root and must keep `.claude`/`.codex`/`.agents` alignment documented through shared contracts.
