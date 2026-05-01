# oliver-local

Canonical orchestration system for `/Users/oliver` (oliver-local).

`oliver-local` represents the full local orchestration system rooted at `/Users/oliver`.
`~/oliver-local` is the shared orchestration system root for this machine.

## Shared System

- Oliver-local repo operations: `/Users/oliver/oliver-local/docs/oliver-local-repo-operations.md`
- Canonical contracts: `contracts/*`, including `contracts/PROJECT_HYGIENE_STANDARD.md`
- Machine-level aliases:
  - `/Users/oliver/AGENT_SHARED_STRUCTURE.md`
  - `/Users/oliver/SHARED_ORCHESTRATION.md`
  - `/Users/oliver/AGENT_SYSTEM_MANIFEST.json`

## Runtime Entries

- Claude: `~/.claude/ORCHESTRATION.md`
- Codex: `~/.codex/ORCHESTRATION.md`
- Agents: `~/.agents/ORCHESTRATION.md`

Runtime folders are visible on disk but are not tracked as folders inside this repo. This repo tracks the contracts, docs, scripts, shared workflows, personas, identity files, and shared skills those runtime adapters consume.

Runtime settings and machine state are local-only. Do not commit live files such as `settings.json`, `settings.local.json`, `auth.json`, `credentials.json`, SQLite logs/state, shell history, or `.env.local`.

Git-tracked copies of the local runtime README and ORCHESTRATION files live in `runtime-pointers/*`:

- `runtime-pointers/.claude/README.md`
- `runtime-pointers/.claude/ORCHESTRATION.md`
- `runtime-pointers/.codex/README.md`
- `runtime-pointers/.codex/ORCHESTRATION.md`
- `runtime-pointers/.agents/README.md`
- `runtime-pointers/.agents/ORCHESTRATION.md`

Those files explain what each local runtime folder is, what state may live there, and why shared instructions point back to `~/oliver-local`. `scripts/test-structure.sh` checks that the live runtime files match these tracked copies.

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
|- references/                 external templates/reference repos
|- dotfiles/                   machine shell/config repo
`- claude-push/                Claude permission push-notification helper
```

## Ownership Rules

- Product code/docs live in `~/projects/*`.
- Cross-project orchestration standards live in `~/oliver-local/shared/*`.
- Shared skills live in `~/oliver-local/skills/*`.
- Runtime folders (`.claude`, `.codex`, `.agents`) are adapters and runtime state, not shared-system source-of-truth.
- `references`, `dotfiles`, and `claude-push` are support workspaces; they are not shared orchestration roots.
- Concrete service URLs, tokens, personal profile details, device identifiers, and runtime-only settings stay in local env/runtime files, not Git.

## Key Docs

- [Architecture](docs/architecture.md)
- [Project Repos](docs/project-repos.md)
- [Runtime Adapters](docs/runtime-adapters.md)
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
