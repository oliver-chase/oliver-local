# Oliver-Local Sync Workflow

Use this workflow when the user asks to sync, reconcile, or refresh `oliver-local` metadata and docs.

## Scope

`oliver-local` is the orchestration repo at `~/.claude` (alias `~/oliver-local`), not an app repo.

This workflow keeps these files aligned with the live machine state:

- `shared/repo-map.json`
- `docs/project-repos.md`
- `docs/projects/*.md`
- `docs/workspace-tree.md`
- `docs/architecture.md`
- `README.md`
- `CLAUDE.md`
- `shared/workflow-standards.md`

## Procedure

1. Confirm repo + alias health.

```bash
git -C ~/oliver-local status --short --branch
readlink ~/oliver-local
```

2. Run structure drift checks.

```bash
bash ~/oliver-local/scripts/test-structure.sh
```

3. Reconcile local repo inventory against disk.

```bash
ls -1 ~/projects
jq -r '.repos[].name + " -> " + .path' ~/oliver-local/shared/repo-map.json
```

4. If inventory drift exists:
- update `shared/repo-map.json`
- align `docs/projects/*.md` and `docs/project-repos.md`
- align `docs/workspace-tree.md` and `docs/architecture.md`
- align `README.md` and `CLAUDE.md` references

5. Re-run checks.

```bash
bash ~/oliver-local/scripts/test-structure.sh
```

6. Commit only sync-scope files.
- Do not stage unrelated runtime churn.
- Use a docs/process commit message.

Example:

```bash
git -C ~/oliver-local add shared/repo-map.json docs README.md CLAUDE.md shared/workflow-standards.md
git -C ~/oliver-local commit -m "docs: sync oliver-local repo map and workflow metadata"
```

7. Push `main` when requested.

```bash
git -C ~/oliver-local push origin main
```
