# Oliver-Local System Scope Map

Status: Active

`oliver-local` means the full local orchestration system at `/Users/oliver`, not only `.claude`.

## Scope Layers

- System root: `/Users/oliver`
- Control-plane repo checkout: `/Users/oliver/.claude`
- Codex runtime: `/Users/oliver/.codex`
- Shared skill/runtime packs: `/Users/oliver/.agents`
- Product repos: `/Users/oliver/projects/*`

## Source-of-Truth Rules

- Shared orchestration contracts:
  - `/Users/oliver/AGENT_SHARED_STRUCTURE.md`
  - `/Users/oliver/SHARED_ORCHESTRATION.md`
  - `/Users/oliver/AGENT_SYSTEM_MANIFEST.json`
- Persona definitions are canonical in one place (`/Users/oliver/.claude/personas/*`).
- Any persona references outside canonical location are pointers only.

## Operational Rule

Agents treat `.claude` as control-plane storage for orchestrating the full `/Users/oliver` system and must keep `.codex`/`.agents` alignment documented through shared contracts.
