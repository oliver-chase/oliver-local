# Workspace Governance

This policy prevents documentation and structure drift across project repositories.

## Required Gates

Run before commit (workspace-wide):

```bash
/Users/oliver/.claude/scripts/run-governance-gates.sh
```

Run for one repo only:

```bash
/Users/oliver/.claude/scripts/run-governance-gates.sh /Users/oliver/projects/<repo>
```

## Nightly Task

Nightly cleanup + governance run:

```bash
/Users/oliver/.claude/scripts/run-nightly-governance.sh
```

Status report output:
- `/Users/oliver/.claude/docs/runtime-verification/governance-status.md`

launchd task file:
- `/Users/oliver/Library/LaunchAgents/com.oliver.governance-nightly.plist`

## What Is Enforced

- Canonical required files exist per repo.
- Forbidden legacy snapshot documents are absent in repos where retired.
- Forbidden runtime-coupled references are absent from active docs:
  - `/Users/oliver/.codex/skills`
  - `/Users/oliver/.claude/skills`
  - `story-lifecycle-gate`
- Project backlog file placement stays inside approved roots.
- Cross-repo structure/doc integrity checks remain green.
- Active orchestration docs stay within concise length limits (see `docs/document-length-policy.md`).
- Runtime hook baseline remains configured in `settings.json`:
  - `UserPromptSubmit` -> `node ~/.claude/hooks/json-to-toon.mjs`
  - `PostToolUse` -> `code-review-graph update --skip-flows`
  - `SessionStart` -> `code-review-graph status`

## Skills Baseline

- Shared workflow routing source: `shared/workflow-standards.md` + `shared/workflows/README.md`
- Canonical skills inventory: `docs/skills.md`
- Shared workflows must not hardcode runtime-specific skill file paths; use workflow trigger names instead.
- Shared SOP/workflow docs must not be copied into project repos; projects reference canonical shared workflow docs.

## Pre-commit Hook Installation

Install governance hooks in all project repos:

```bash
/Users/oliver/.claude/scripts/install-governance-hook.sh
```

Each repo hook executes repo-scoped governance gates before commit.
