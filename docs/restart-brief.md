# Restart Brief

Use this file first after compaction or a fresh restart.

Last updated: `2026-04-14`

## Current Authority

- `~/.claude` — local checkout of `oliver-chase/oliver-local`
- `~/.codex` — separate Codex runtime
- `~/projects/*` — application repos

## Repo Remotes

- `~/.claude` → `git@github.com:oliver-chase/oliver-local.git`
- `~/projects/tesknota` → `git@github.com:oliver-chase/tesknota.git`
- `~/projects/ops-dashboard` → `git@github.com:oliver-chase/ops-dashboard.git`
- `~/projects/v-two-sdr` → `git@github.com:oliver-chase/v-two-sdr.git`
- `~/projects/fallow` → `git@github.com:oliver-chase/fallow.git`

## Current Local Layout

```text
/Users/oliver
|- .claude      oliver-local checkout + Claude runtime
|- .codex       Codex runtime
|- .gstack
|- .ssh
|- projects     application repos
```

## Do Not Re-Audit

Do not scan the full home directory. Read these files instead:

1. `~/.claude/docs/restart-brief.md` (this file)
2. `~/.claude/docs/current-state.md`
3. `~/.claude/shared/repo-map.json`

## Known Facts

- No `saturdaythings` or `OliverRepo` references should remain in tracked files
- Old path `~/OliverRepo/workspaces/...` is dead — do not use
- Personas live at `~/.claude/personas/<name>/persona_soul.md`
- Skills index is in CLAUDE.md — read on demand, not at load
