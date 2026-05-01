# Oliver-Local System Scope Map

Status: Active

`oliver-local` means the full local orchestration system at `/Users/oliver`, not only `.claude`.

## Scope Layers

- System root: `/Users/oliver`
- Control-plane repo checkout: `/Users/oliver/oliver-local`
- Codex runtime: `/Users/oliver/.codex`
- Agents runtime adapter: `/Users/oliver/.agents`
- Product repos: `/Users/oliver/projects/*`

## Source-of-Truth Rules

- Shared orchestration contracts:
  - `~/oliver-local/contracts/AGENT_SHARED_STRUCTURE.md`
  - `~/oliver-local/contracts/SHARED_ORCHESTRATION.md`
  - `~/oliver-local/contracts/AGENT_SYSTEM_MANIFEST.json`
- Persona definitions are canonical in one place (`/Users/oliver/oliver-local/personas/*`).
- Shared skills are canonical in one place (`/Users/oliver/oliver-local/skills/*`).
- Runtime skill adapters, when needed, point into `~/oliver-local/skills`.
- Any persona references outside canonical location are pointers only.
- `~/.claude` shared-facing directories are pointers into `~/oliver-local`; active duplicate copies are not allowed.

## Operational Rule

Agents treat `~/oliver-local` as the shared orchestration root and must keep `.claude`/`.codex`/`.agents` alignment documented through shared contracts.
