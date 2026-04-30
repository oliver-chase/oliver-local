#!/usr/bin/env bash
set -euo pipefail

# Workspace-level governance gate runner.
# Optional arg: repo path to run repo-scoped audit only for one repo.

REPO_PATH="${1:-}"

if [[ -n "$REPO_PATH" ]]; then
  /Users/oliver/.claude/scripts/governance-audit.sh "$REPO_PATH"
  /Users/oliver/.claude/scripts/check-project-structure.sh
  exit 0
fi

/Users/oliver/.claude/scripts/test-structure.sh
/Users/oliver/.claude/scripts/check-doc-config-impact.sh
/Users/oliver/.claude/scripts/validate-skill-references.sh
/Users/oliver/.claude/scripts/validate-doc-lengths.sh
/Users/oliver/.claude/scripts/validate-active-doc-hygiene.sh
/Users/oliver/.claude/scripts/validate-doc-integrity.sh
/Users/oliver/.claude/scripts/governance-audit.sh
/Users/oliver/.claude/scripts/check-project-structure.sh
