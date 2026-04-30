# Cleanup Candidates

This file lists likely cleanup targets discovered in `/Users/oliver`.

## Low Risk (safe to prune/regenerate)

- `~/.claude/session-env/` (ephemeral session environment snapshots)
- `~/.claude/cache/` (runtime cache)
- `~/.codex/cache/` (runtime cache)
- `~/.codex/tmp/` and `~/.codex/.tmp/` (runtime temp)
- `~/.codex/shell_snapshots/` (shell session snapshots)

## Medium Risk (keep unless you want shorter history)

- `~/.claude/history.jsonl`
- `~/.codex/history.jsonl`
- `~/.codex/logs_2.sqlite*`
- `~/.codex/state_5.sqlite*`

## Process/Docs Duplication Risks

- Root `/Users/oliver/CLAUDE.md` duplicated guidance with `~/.claude/CLAUDE.md`.
  - resolved by converting root file into a pointer-only entry file.
- `oliver-local` vs `~/.claude` confusion.
  - resolved: explicit symlink model in README + workspace-tree + orchestration docs.

## Now Canonical

- Claude orchestration: `~/.claude/ORCHESTRATION.md`
- Codex orchestration: `~/.codex/ORCHESTRATION.md`
- Shared structure: `/Users/oliver/AGENT_SHARED_STRUCTURE.md`

## Recommended Next Cleanup Pass

1. Remove ephemeral runtime folders (`session-env`, caches, temp snapshots).
2. Keep SQLite/history unless you intentionally want to reset agent memory/history.
3. Continue repo-by-repo doc normalization inside `~/projects/*` using the same current-state-only rule.
