# Oliver-Local Sync Workflow

Use this workflow when the user asks to sync, reconcile, or refresh `oliver-local` metadata and docs.

## Scope

`oliver-local` is the shared orchestration repo at `~/oliver-local`, not an app repo.

This workflow keeps these files aligned with the live machine state:

- `shared/repo-map.json`
- `contracts/*`
- `docs/project-repos.md`
- `docs/projects/*.md`
- `docs/workspace-tree.md`
- `docs/architecture.md`
- `README.md`
- `CLAUDE.md`
- `shared/workflow-standards.md`

## Procedure

1. Confirm repo health.

```bash
git -C ~/oliver-local status --short --branch
test -d ~/oliver-local
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
- update `contracts/*` if machine-level aliases or shared roots changed
- align `docs/projects/*.md` and `docs/project-repos.md`
- align `docs/workspace-tree.md` and `docs/architecture.md`
- align `README.md` and `CLAUDE.md` references

5. Run impact + structure checks.

```bash
bash ~/oliver-local/scripts/check-doc-config-impact.sh
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

7. Push `main` immediately.

```bash
git -C ~/oliver-local push origin main
```
