# Architecture

## 1. Product Layer

Location: `<vault-root>/Oliver/_Project Repos/*`

Contains application code, app-specific docs, migrations, tests, and deploy logic.

## 2. Orchestration Layer

Location: `<vault-root>/Oliver/_Project Repos/oliver-local` (shared system root)

Contains shared agent operating rules, workspace maps, persona/skill metadata, and workflow standards.

## 3. Runtime Layer

Locations:
- Runtime state in `~/.claude`, `~/.codex`, and `~/.agents`

Runtime state is intentionally separate from product repositories.

## 4. Tooling Layer

Locations:
- `~/.agents` for runtime-local adapter state and external runtime skills
- `<vault-root>/Oliver/_Project Repos/oliver-local/skills` for canonical shared skills
- `~/references` for upstream templates/reference repos
- `~/dotfiles` for machine configuration

## Operating Contract

- Do not duplicate project source trees into orchestration folders.
- Keep cross-project standards in `<vault-root>/Oliver/_Project Repos/oliver-local/shared/*` once, then reference them.
- Keep shared skills in `<vault-root>/Oliver/_Project Repos/oliver-local/skills/*` once, then reference them from runtime adapters.
- Keep project-specific instructions inside each project repo.
