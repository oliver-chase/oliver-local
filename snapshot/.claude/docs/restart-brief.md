# Restart Brief

Use this file first after compaction or a fresh restart.

Last updated: `2026-04-14`

## Current Authority

- `~/.claude` is the real local checkout of the current orchestration repo
- `~/.codex` is the separate Codex runtime
- `~/projects/*` contains the application repos

## Current Repo Remotes

These local git remotes were updated to `oliver-chase`:

- `~/.claude` -> `git@github.com:oliver-chase/OliverRepo.git`
- `~/projects/tesknota` -> `git@github.com:oliver-chase/tesknota.git`
- `~/projects/ops-dashboard` -> `git@github.com:oliver-chase/ops-dashboard.git`
- `~/projects/v-two-sdr` -> `git@github.com:oliver-chase/v-two-sdr.git`
- `~/projects/fallow` -> `git@github.com:oliver-chase/fallow.git`

SSH auth resolves correctly to `oliver-chase`.

## Important Local Facts

- The duplicate local clone at `~/projects/OliverRepo` was removed
- The old path `~/OliverRepo/workspaces/work/projects/...` is stale and should not be used
- The live repo roots are under `~/projects/`
- No authored/local-config references to `Saturday Things` or `saturdaythings` should remain

## Files Added For Orientation

- `~/.claude/README.md`
- `~/.claude/docs/current-state.md`
- `~/.claude/docs/architecture.md`
- `~/.claude/shared/repo-map.json`
- `~/.claude/shared/workflow-standards.md`
- `~/.codex/memories/oliver-chase-repos.md`

## What Changed Already

- Local git remotes updated from `saturdaythings` to `oliver-chase`
- Project docs/config references updated in:
  - `tesknota`
  - `ops-dashboard`
  - `v-two-sdr`
- Claude local metadata in `~/.claude.json` was updated to use current repo paths under `~/projects` and `oliver-chase/*`
- `.claude/.gitignore` was tightened to ignore more runtime-only noise

## Known Remaining Issue

`gh auth status` is still broken because the shell exports an invalid `GH_TOKEN`.

This does not block normal `git fetch/pull/push` over SSH, but it does block GitHub CLI operations until fixed.

## Current Direction

The likely next architecture step is:

1. Stop treating `OliverRepo` as the long-term clean source of truth
2. Keep `~/.claude` and `~/.codex` as runtimes
3. Create a new sanitized tracked repo, likely `oliver-local`
4. Move only stable, non-secret, non-runtime orchestration files into that new repo

## What Not To Re-Audit First

Do not start by re-scanning the entire home directory unless the filesystem has materially changed.

Instead read:

1. `~/.claude/docs/restart-brief.md`
2. `~/.claude/docs/current-state.md`
3. `~/.claude/docs/architecture.md`
4. `~/.claude/shared/repo-map.json`
5. `~/.claude/shared/workflow-standards.md`
6. `~/.codex/memories/oliver-chase-repos.md`

## Open Decisions

- Whether to fully replace `OliverRepo` with a new repo named `oliver-local`
- What exact files should be migrated into that new repo
- Whether `OliverRepo` should be archived, overwritten, or deleted remotely after migration
- How to fix `gh` auth cleanly without leaking tokens into tracked files
