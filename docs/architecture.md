# Architecture

## 1. Product Layer

Location: `~/projects/*`

Contains application code, app-specific docs, migrations, tests, and deploy logic.

## 2. Orchestration Layer

Location: `~/.claude` (alias `~/oliver-local`)

Contains shared agent operating rules, workspace maps, persona/skill metadata, and workflow standards.

## 3. Runtime Layer

Locations:
- `~/.claude` runtime state
- `~/.codex` runtime state

Runtime state is intentionally separate from product repositories.

## 4. Tooling Layer

Locations:
- `~/.agents` for local shared skill packs
- `~/references` for upstream templates/reference repos
- `~/dotfiles` for machine configuration

## Operating Contract

- Do not duplicate project source trees into orchestration folders.
- Keep cross-project standards in `~/.claude/shared/*` once, then reference them.
- Keep project-specific instructions inside each project repo.
