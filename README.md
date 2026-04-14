# oliver-local

`oliver-local` is the tracked orchestration repo for the Oliver local workspace.

Checked out at `~/.claude`. Runtime split:

- `~/.claude` — Claude runtime + tracked orchestration
- `~/.codex` — Codex runtime
- `~/projects/*` — application repositories

## Layout

```text
/Users/oliver
|- .claude      oliver-local git checkout + Claude runtime
|- .codex       Codex runtime
`- projects     application repos
```

## What Belongs Here

- Claude operating rules, personas, hooks, and custom skills
- The vendored `gstack` toolkit at `~/.claude/skills/gstack`, with top-level skill aliases pointing to it
- Codex-derived system skills that are useful in Claude (`imagegen`, `openai-docs`, `plugin-creator`, `skill-creator`, `skill-installer`)
- Cross-agent repo map and workflow standards
- Documentation of the live local architecture

## What Does Not Belong Here

- Duplicated copies of app repos
- Codex runtime databases, logs, or session state
- Claude runtime caches, telemetry, and session artifacts

## Key Docs

- [Current State](docs/current-state.md)
- [Architecture](docs/architecture.md)
- [Repo Map](shared/repo-map.json)
- [Workflow Standards](shared/workflow-standards.md)
