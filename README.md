# oliver-local

Canonical workspace-orchestration repo for `/Users/oliver`.

`oliver-local` is a symlink to `~/.claude`:
- repo path: `~/.claude`
- command alias: `~/oliver-local`

## Shared System

- Oliver-local repo operations: `/Users/oliver/.claude/docs/oliver-local-repo-operations.md`

- Shared structure: `/Users/oliver/AGENT_SHARED_STRUCTURE.md`
- Shared orchestration core: `/Users/oliver/SHARED_ORCHESTRATION.md`
- Shared manifest: `/Users/oliver/AGENT_SYSTEM_MANIFEST.json`

## Runtime Entries

- Claude: `~/.claude/ORCHESTRATION.md`
- Codex: `~/.codex/ORCHESTRATION.md`

## Governance Gates

- Policy: `docs/governance.md`
- Full gate runner: `scripts/run-governance-gates.sh`
- Repo hook installer: `scripts/install-governance-hook.sh`

## Workspace Model

```text
/Users/oliver
|- .claude
|- oliver-local -> .claude
|- .codex
|- .agents
|- projects/
|- references/
|- dotfiles/
`- claude-push/
```

## Ownership Rules

- Product code/docs live in `~/projects/*`.
- Cross-project orchestration standards live in `~/.claude/shared/*`.
- Runtime folders (`.claude`, `.codex`) are not product source-of-truth.

## Key Docs

- [Architecture](docs/architecture.md)
- [Project Repos](docs/project-repos.md)
- [Workspace Tree](docs/workspace-tree.md)
- [Governance](docs/governance.md)
- [Oliver-Local Repo Operations](docs/oliver-local-repo-operations.md)
- [Workflow Standards](shared/workflow-standards.md)
- [Workflow Procedures](shared/workflows/)

## Upkeep Checks

For `oliver-local` sync/reconciliation changes, run:

```bash
bash ~/oliver-local/scripts/check-doc-config-impact.sh
bash ~/oliver-local/scripts/test-structure.sh
```
