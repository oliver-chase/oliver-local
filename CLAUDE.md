# Operating Rules

## Runtime Boundary

- `~/oliver-local` is `~/.claude` (same directory via symlink).
- `~/.codex` is separate runtime state; do not treat it as a project repo.
- Product implementation always happens in `~/projects/*` repos.

## Execution Rules

- Read the target project's local instructions first (`CLAUDE.md`, `AGENTS.md`, `README.md` as applicable).
- Keep scope to the active task and active repository.
- When a workflow or process doc changes, update pointers that reference it in the same change.

## Commit Rules

- Do not auto-commit every change.
- Commit when explicitly requested or when a scoped milestone is complete.
- Stage only owned files for the active scope.

## Workspace Sync Rules (`oliver-local`)

When changing workspace structure or standards in `~/.claude`:

1. Update these canonical docs when relevant:
- `README.md`
- `docs/workspace-tree.md`
- `docs/project-repos.md`
- `docs/architecture.md`
- `docs/tooling-inventory.md`
- `shared/workflow-standards.md`

2. Run checks:
```bash
bash ~/.claude/scripts/check-doc-config-impact.sh
bash ~/.claude/scripts/test-structure.sh
```

3. Commit only sync-scope files.
