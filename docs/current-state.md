# Current State

Last verified: `2026-04-14`

## Live Paths

- `~/.claude` is the real local checkout of `oliver-chase/OliverRepo`
- `~/.codex` is a separate runtime, not a nested Claude component
- `~/projects/tesknota` is an active product repo
- `~/projects/ops-dashboard` is an active product repo
- `~/projects/v-two-sdr` is an active product repo
- `~/projects/fallow` is an active product repo

## Reality Check

An older path, `~/OliverRepo/workspaces/work/projects/...`, still appears in some cached Claude metadata. It is not the current live workspace root. The active repos now live under `~/projects/`.

## Current Local Layout

```text
/Users/oliver
|- .claude
|- .codex
|- .gstack
|- .ssh
|- claude-push
|- dotfiles
|- projects
`- tesknota-audit
```

## Claude Runtime Highlights

```text
~/.claude
|- CLAUDE.md
|- commands/
|- hooks/
|- identity/
|- personas/
|- skills/
|- plugins/                runtime/plugin-installed content
|- sessions/               runtime
|- tasks/                  runtime
|- cache/                  runtime
|- telemetry/              runtime
`- shared/                 neutral cross-agent metadata tracked in git
```

## Codex Runtime Highlights

```text
~/.codex
|- skills/.system/
|- memories/
|- sessions/
|- cache/
|- log/
`- state_*.sqlite
```

## Important Constraint

Do not duplicate project repos or maintain parallel fake checkouts just to describe the workspace. The source of truth is the live machine layout plus the tracked orchestration repo already checked out at `~/.claude`.
