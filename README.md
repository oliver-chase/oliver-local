# OliverRepo

`OliverRepo` is the tracked orchestration repo for the Oliver local workspace.

This repo currently lives at `~/.claude`, because Claude is the agent with the mature local orchestration layer today. That does not mean Codex lives inside Claude. The runtime split is:

- `~/.claude` for Claude runtime and tracked Claude-side orchestration
- `~/.codex` for Codex runtime
- `~/projects/*` for actual application repositories

The goal is one accurate control plane story with no duplicate project repos and no fake second copies of orchestration files.

## Current Model

```text
/Users/oliver
|- .claude      OliverRepo git checkout + Claude runtime
|- .codex       Codex runtime
`- projects     application repos
```

## Target Model

```text
/Users/oliver
|- .claude      Claude runtime and Claude-specific orchestration
|- .codex       Codex runtime and Codex-specific orchestration
|- projects     application repos
`- shared       neutral cross-agent definitions, tracked in OliverRepo
```

In practice, the neutral cross-agent definitions are tracked here for now under [`shared/`](/Users/oliver/.claude/shared), because `OliverRepo` is already the active orchestration repo.

## What Belongs Here

- Claude operating rules, personas, hooks, and custom skills
- The vendored `gstack` toolkit at `~/.claude/skills/gstack`, with top-level skill aliases pointing to it
- Codex-derived system skills that are useful in Claude (`imagegen`, `openai-docs`, `plugin-creator`, `skill-creator`, `skill-installer`)
- Cross-agent repo map and workflow standards
- Documentation of the live local architecture

## What Does Not Belong Here

- Duplicated copies of app repos
- Duplicate clones of `OliverRepo`
- Codex runtime databases, logs, or session state
- Claude runtime caches, telemetry, and session artifacts

## Key Docs

- [Current State](docs/current-state.md)
- [Architecture](docs/architecture.md)
- [Repo Map](shared/repo-map.json)
- [Workflow Standards](shared/workflow-standards.md)
