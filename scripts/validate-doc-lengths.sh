#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FAIL=0

pass() { echo "PASS $1"; }
fail() { echo "FAIL $1"; FAIL=1; }

check_max_lines() {
  local file="$1"
  local max="$2"
  local label="$3"
  if [[ ! -f "$file" ]]; then
    fail "$label missing: $file"
    return
  fi
  local lines
  lines="$(wc -l < "$file" | tr -d ' ')"
  if (( lines <= max )); then
    pass "$label within limit ($lines <= $max): $file"
  else
    fail "$label over limit ($lines > $max): $file"
  fi
}

# Root runtime docs
check_max_lines "$ROOT/README.md" 140 "root doc"
check_max_lines "$ROOT/CLAUDE.md" 140 "root doc"
check_max_lines "$ROOT/ORCHESTRATION.md" 140 "root doc"

# Core workspace pointer docs
check_max_lines "$ROOT/docs/architecture.md" 220 "workspace pointer doc"
check_max_lines "$ROOT/docs/workspace-tree.md" 220 "workspace pointer doc"
check_max_lines "$ROOT/docs/project-repos.md" 220 "workspace pointer doc"
check_max_lines "$ROOT/docs/tooling-inventory.md" 220 "workspace pointer doc"
check_max_lines "$ROOT/docs/governance.md" 220 "workspace pointer doc"
check_max_lines "$ROOT/docs/document-length-policy.md" 220 "workspace pointer doc"

# Shared standards
check_max_lines "$ROOT/shared/workflow-standards.md" 240 "shared standard"
check_max_lines "$ROOT/shared/workflows/README.md" 240 "shared workflow index"
check_max_lines "$ROOT/shared/workflows/story-lifecycle-sop.md" 260 "workflow sop"

if [[ "$FAIL" -ne 0 ]]; then
  echo "Doc length check: FAIL"
  exit 1
fi

echo "Doc length check: PASS"
