# Shared Orchestration Core

Single source of truth for cross-agent orchestration on this machine.

## Scope

Applies to both:
- Claude runtime (`~/.claude`)
- Codex runtime (`~/.codex`)

## Canonical Structure

- Product repos: `~/projects/*`
- Shared structure contract: `/Users/oliver/AGENT_SHARED_STRUCTURE.md`
- Shared orchestration core: `/Users/oliver/SHARED_ORCHESTRATION.md`
- Shared machine-readable manifest: `/Users/oliver/AGENT_SYSTEM_MANIFEST.json`

## Shared Rules

- Product behavior/process docs live in each product repo.
- Cross-project orchestration standards live in `~/.claude/shared/*`.
- Runtime state in `.claude` and `.codex` is not product source-of-truth.
- Do not duplicate product workflow docs into runtime folders.
- Claude and Codex must execute from the same canonical workflow set:
  - `~/.claude/shared/workflow-standards.md`
  - `~/.claude/shared/workflows/*`
- Project repos must reference shared workflows; they must not create duplicate copies of shared SOP/workflow docs.

## Governance Gates

- Policy: `/Users/oliver/.claude/docs/governance.md`
- Runner: `/Users/oliver/.claude/scripts/run-governance-gates.sh`
- Hook installer: `/Users/oliver/.claude/scripts/install-governance-hook.sh`

## Workflow Index

Canonical workflow standards and procedures:
- `~/.claude/shared/workflow-standards.md`
- `~/.claude/shared/workflows/README.md`

## Runtime-Specific Entry Files

- Claude entry: `~/.claude/ORCHESTRATION.md`
- Codex entry: `~/.codex/ORCHESTRATION.md`
