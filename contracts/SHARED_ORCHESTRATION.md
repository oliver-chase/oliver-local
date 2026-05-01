# Shared Orchestration Core

Single source of truth for cross-agent orchestration on this machine.

## Scope

Applies to:
- Shared system root (`~/oliver-local`)
- Claude runtime (`~/.claude`)
- Codex runtime (`~/.codex`)
- Agents runtime (`~/.agents`)

## Canonical Structure

- Product repos: `~/projects/*`
- Shared structure contract: `~/oliver-local/contracts/AGENT_SHARED_STRUCTURE.md`
- Shared orchestration core: `~/oliver-local/contracts/SHARED_ORCHESTRATION.md`
- Shared machine-readable manifest: `~/oliver-local/contracts/AGENT_SYSTEM_MANIFEST.json`

## Shared Rules

- Product behavior/process docs live in each product repo.
- Cross-project orchestration standards live in `~/oliver-local/shared/*`.
- Runtime state in `.claude`, `.codex`, and `.agents` is not product source-of-truth.
- Do not duplicate product workflow docs into runtime folders.
- Claude, Codex, and other agent runtimes must execute from the same canonical workflow set:
  - `~/oliver-local/shared/workflow-standards.md`
  - `~/oliver-local/shared/workflows/*`
- Project repos must reference shared workflows; they must not create duplicate copies of shared SOP/workflow docs.

## Governance Gates

- Policy: `/Users/oliver/oliver-local/docs/governance.md`
- Runner: `/Users/oliver/oliver-local/scripts/run-governance-gates.sh`
- Hook installer: `/Users/oliver/oliver-local/scripts/install-governance-hook.sh`

## Workflow Index

Canonical workflow standards and procedures:
- `~/oliver-local/shared/workflow-standards.md`
- `~/oliver-local/shared/workflows/README.md`

## Runtime-Specific Entry Files

- Claude entry: `~/.claude/ORCHESTRATION.md`
- Codex entry: `~/.codex/ORCHESTRATION.md`
- Agents entry: `~/.agents/ORCHESTRATION.md`
