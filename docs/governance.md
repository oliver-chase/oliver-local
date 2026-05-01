# Workspace Governance

This policy prevents documentation and structure drift across project repositories.

## Required Gates

Run before commit (workspace-wide):

```bash
~/oliver-local/scripts/run-governance-gates.sh
```

Run for one repo only:

```bash
~/oliver-local/scripts/run-governance-gates.sh ~/projects/<repo>
```

## Nightly Task

Nightly cleanup + governance run:

```bash
~/oliver-local/scripts/run-nightly-governance.sh
```

Status report output:
- `~/oliver-local/docs/runtime-verification/governance-status.md`

launchd task file:
- `~/Library/LaunchAgents/com.oliver.governance-nightly.plist`

## What Is Enforced

- Canonical required files exist per repo.
- Repo structure contracts exist and align with `contracts/PROJECT_STRUCTURE_STANDARD.md`.
- Forbidden retired snapshot documents are absent in repos where inactive.
- Forbidden runtime-coupled references are absent from active docs:
  - `~/.codex/skills`
  - `~/.claude/skills`
  - `~/oliver-local/skills`
  - `story-lifecycle-gate`
- Project backlog file placement stays inside approved roots.
- Cross-repo structure/doc integrity checks remain green.
- Active orchestration docs stay within concise length limits (see `docs/document-length-policy.md`).
- Runtime settings remain runtime-local and must not be tracked in `oliver-local`.
- `.claude/settings.json` must not enable bypass-permission defaults.

## Skills Baseline

- Shared workflow routing source: `shared/workflow-standards.md` + `shared/workflows/README.md`
- Canonical skills inventory: `docs/skills.md`
- Shared workflows must not hardcode runtime-specific skill file paths; use workflow trigger names instead.
- Shared SOP/workflow docs must not be copied into project repos; projects reference canonical shared workflow docs.
- Runtime adapters may point to `~/oliver-local/skills`, but project repos must not.

## Pre-commit Hook Installation

Install governance hooks in all project repos:

```bash
~/oliver-local/scripts/install-governance-hook.sh
```

Each repo hook executes repo-scoped governance gates before commit.

- Oliver-local repo operations: `~/oliver-local/docs/oliver-local-repo-operations.md`
