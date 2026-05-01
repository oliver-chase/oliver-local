---
name: mem-sync
description: Clean and sync all memory and startup files. Remove stale entries, compress verbose sections, ensure a fresh session can orient without reading old info. Run after any major feature or project change.
---

# /mem-sync

Cleans and syncs all memory and startup structures so a fresh session can orient instantly. Run after major changes or whenever memory feels stale.

## Files to audit

| File | Purpose | Max length |
|------|---------|-----------|
| `~/oliver-local/CLAUDE.md` | Shared operating rules | ~160 lines |
| `~/.claude/CLAUDE.md` | Claude runtime adapter pointer rules | ~80 lines |
| `~/.claude/projects/-Users-oliver/memory/MEMORY.md` | Claude runtime memory index | ~130 lines |
| `~/.claude/projects/-Users-oliver/memory/*.md` | Claude runtime memory files | ~30 lines each |
| `<project>/MEMORY.md` | In-repo session memory snapshot | ~90 lines |
| `<project>/CLAUDE.md` | Project session protocol | As-is (protocol docs) |

## Steps

### 1. Shared and runtime startup docs
- `~/oliver-local/CLAUDE.md` must describe shared operating rules only.
- `~/.claude/CLAUDE.md` must describe Claude runtime adapter behavior only and point back to `~/oliver-local`.
- Project tables or repo inventories belong in `~/oliver-local/docs/project-repos.md` and `~/oliver-local/shared/repo-map.json`.
- No startup doc may describe `~/.claude` as the shared-system source of truth.

### 2. Global MEMORY.md index
- Every line must point to a file that exists: `ls ~/.claude/projects/-Users-oliver/memory/<file>`
- Remove pointer if file is gone. Remove file if pointer is gone.
- One-line hook must still be accurate — if the memory file changed substantially, update the hook.
- If index exceeds 130 lines, consolidate: merge related memory files, compress verbose ones.

### 3. Individual memory files
- Check each file: is the content still true? Verify against current code/config if uncertain.
- Remove entries that describe completed one-time migrations or resolved incidents.
- Compress: no bullets longer than 2 lines. No "as of [old date]" notes unless date is still relevant.
- Merge files covering the same topic if both are under 10 lines.

### 4. Project MEMORY.md (in-repo)
- "What is built and working" — remove anything that was removed from code. Add anything built since last update.
- "What to do next" — remove completed items. Keep only the highest-priority 1-2 items.
- Line counts — re-run `wc -l` on all listed modules. Update every count.
- Deployed URL — verify against CI/deployment config.
- CI status — verify against `.github/workflows/*.yml`.

### 5. Cross-check
```bash
# Verify repo names in shared repo map match actual remotes
jq -r '.repos[].path' ~/oliver-local/shared/repo-map.json
git -C ~/projects/tesknota remote get-url origin
```

### 6. Update "Last Updated" timestamp in MEMORY.md index

### 7. Commit
If in a project repo: `git add` only doc files, commit as `docs: sync memory and startup files`.
If shared orchestration files changed: commit from `~/oliver-local`.
Do not commit from `~/.claude`; it is runtime adapter/state.

## Signs memory needs syncing

- A startup sequence references a file that doesn't exist
- MEMORY.md lists a feature as "next" that already shipped
- CLAUDE.md project table has a repo that 404s on `gh run list`
- Any memory file has a "last updated" date more than 2 sessions old
- Memory index exceeds 130 lines
