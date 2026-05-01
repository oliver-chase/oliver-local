#!/usr/bin/env bash
set -euo pipefail

ROOT="/Users/oliver"
REPOS=(
  "$ROOT/projects/oliver-app"
  "$ROOT/projects/tesknota"
  "$ROOT/projects/v-two-sdr"
  "$ROOT/projects/fallow"
)

FORBIDDEN_PATTERNS=(
  '/Users/oliver/.codex/skills'
  '/Users/oliver/.claude/skills'
  '/Users/oliver/oliver-local/skills'
  'story-lifecycle-gate'
  'oliver-local-reconciliation-2026-04-24.md'
  'STATE-AUDIT-2026-04-22.md'
  'REDESIGN-2026-04-22.md'
  'SDR_FULL_PASS_BACKLOG_2026-04-24.md'
  'SDR_USER_STORIES_ACCEPTANCE_TESTS.md'
  'LEGACY_DOC_AUDIT.md'
  'PRODUCT_ROADMAP.md'
  'docs/ROADMAP.md'
  'docs/DESIGN.md'
  'docs/UX.md'
  'docs/DATA_SCHEMA.md'
)

echo "Doc integrity scan"
echo "Root: $ROOT"
echo

fail=0
for repo in "${REPOS[@]}"; do
  echo "=== $repo"
  if [[ ! -d "$repo" ]]; then
    echo "missing repo path"
    fail=1
    continue
  fi

  for pat in "${FORBIDDEN_PATTERNS[@]}"; do
    if rg -n --hidden -S "$pat" "$repo" \
      --glob '*.md' \
      --glob '!**/.git/**' \
      --glob '!**/node_modules/**' \
      --glob '!**/.github/user-stories/**' \
      --glob '!**/src/tech-debt/archive/**' \
      --glob '!**/docs/archive/**' \
      >/tmp/docscan_match.txt 2>/dev/null; then
      echo "forbidden reference: $pat"
      sed -n '1,20p' /tmp/docscan_match.txt
      fail=1
    fi
  done
  echo
 done

if [[ $fail -ne 0 ]]; then
  echo "Result: FAIL"
  exit 1
fi

echo "Result: PASS"
