---
name: mem-sync
description: Clean and sync all memory and startup files. Remove stale entries, compress verbose sections, ensure a fresh session can orient without reading old info. Run after any major feature or project change.
---

# /mem-sync

Cleans and syncs all memory and startup structures so a fresh session can orient instantly. Run after major changes or whenever memory feels stale.

## Files to audit

| File | Purpose | Max length |
|------|---------|-----------|
| `~/.claude/CLAUDE.md` | Global session rules + project table | ~160 lines |
| `~/.claude/projects/-Users-oliver/memory/MEMORY.md` | Index of all memory files | ~130 lines |
| `~/.claude/projects/-Users-oliver/memory/*.md` | Individual memory files | ~30 lines each |
| `<project>/MEMORY.md` | In-repo session memory snapshot | ~90 lines |
| `<project>/CLAUDE.md` | Project session protocol | As-is (protocol docs) |

## Steps

### 1. Global CLAUDE.md
- Project table: every row must have the correct repo (verify with `git remote -v` in each project dir). Remove any project that no longer has a git remote.
- Live URL column: verify URLs match actual deployment. Cross-check against CF Pages / Vercel / etc.
- No orphaned instructions referencing deleted files or retired patterns.

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
# Verify repo names in CLAUDE.md match actual remotes
git -C ~/projects/ops-dashboard remote get-url origin
git -C ~/projects/tesknota remote get-url origin
# etc.
```

### 6. Update "Last Updated" timestamp in MEMORY.md index

### 7. Commit
If in a project repo: `git add` only doc files, commit as `docs: sync memory and startup files`.
If in ~/.claude: `git add -A && git commit -m "docs: mem-sync — clean stale entries"` then push to oliver-local.

## Signs memory needs syncing

- A startup sequence references a file that doesn't exist
- MEMORY.md lists a feature as "next" that already shipped
- CLAUDE.md project table has a repo that 404s on `gh run list`
- Any memory file has a "last updated" date more than 2 sessions old
- Memory index exceeds 130 lines
