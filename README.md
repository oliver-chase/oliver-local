# oliver-local

Canonical orchestration system for `/Users/oliver` (oliver-local).

`oliver-local` represents the full local orchestration system rooted at `/Users/oliver`.
`~/oliver-local` is the shared orchestration system root for this machine.

## Shared System

- Oliver-local repo operations: `/Users/oliver/oliver-local/docs/oliver-local-repo-operations.md`
- Canonical contracts: `contracts/*`
- Machine-level aliases:
  - `/Users/oliver/AGENT_SHARED_STRUCTURE.md`
  - `/Users/oliver/SHARED_ORCHESTRATION.md`
  - `/Users/oliver/AGENT_SYSTEM_MANIFEST.json`

## Runtime Entries

- Claude: `~/.claude/ORCHESTRATION.md`
- Codex: `~/.codex/ORCHESTRATION.md`
- Agents: `~/.agents/ORCHESTRATION.md`

## Governance Gates

- Policy: `docs/governance.md`
- Full gate runner: `scripts/run-governance-gates.sh`
- Repo hook installer: `scripts/install-governance-hook.sh`

## Workspace Model

```text
/Users/oliver
|- .claude
|- .codex
|- .agents
|- oliver-local/
|- projects/
|- references/
|- dotfiles/
`- claude-push/
```

## Ownership Rules

- Product code/docs live in `~/projects/*`.
- Cross-project orchestration standards live in `~/oliver-local/shared/*`.
- Shared skills live in `~/oliver-local/skills/*`.
- Runtime folders (`.claude`, `.codex`, `.agents`) are adapters and runtime state, not shared-system source-of-truth.

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
