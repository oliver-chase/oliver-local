---
name: doc-audit
description: Audit all documentation — remove dead links, stale info, broken references. Ensure local matches git. Works in any project.
---

# /doc-audit

Full documentation audit for the current project. Run this any time docs may have drifted from code.

## Steps

1. **Read project docs** — find all `.md` files at root and in `docs/`:
   ```bash
   ls *.md docs/*.md 2>/dev/null
   ```

2. **Check git is clean** — local should match origin/main:
   ```bash
   git status
   git diff origin/main --name-only
   ```
   Any file that exists locally but not in git (or vice versa) must be reconciled.

3. **Audit each doc for staleness**:
   - File paths referenced — do they still exist? (`ls <path>`)
   - Repo names — any old names? (grep for stale repo refs)
   - URLs — any hard-coded URLs that may have changed?
   - Line counts listed — do they match `wc -l`?
   - CI/deploy steps described — do they match `.github/workflows/*.yml`?
   - Feature lists — anything listed as "coming soon" that shipped, or vice versa?

4. **Remove dead content**:
   - Commented-out sections with no purpose
   - Duplicate information across docs (keep in the canonical doc, remove from others)
   - Outdated "next steps" or "TODO" items that are done or cancelled

5. **Fix broken references**:
   - Update any file path that moved or was renamed
   - Update any feature description that no longer matches implementation
   - Correct any wrong repo/branch/URL

6. **Verify local = git**:
   ```bash
   git diff --stat
   ```
   Commit all doc fixes together in a single commit. Docs never commit separately from their related code changes — but a doc-only cleanup commit is fine.

7. **Report**: list each doc, status (clean / fixed / N issues), and any items that need human decision (ambiguous stale content).

## Scope

- Root-level `.md` files: README, ARCHITECTURE, CONTRIBUTING, CLAUDE, MEMORY, AUDIT
- `docs/` subdirectory
- `.github/workflows/` — verify what CI actually does matches what docs say
- Ignore: node_modules, .git, generated files

## Do not

- Rewrite docs that are accurate — trim only, never restructure without cause
- Delete a section without confirming its content is either wrong or fully superseded
- Combine docs that serve different audiences (CLAUDE.md vs CONTRIBUTING.md vs ARCHITECTURE.md serve different readers)
