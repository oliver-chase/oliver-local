#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MAP="$ROOT/shared/repo-map.json"
FAIL=0
TMP="/tmp/active-doc-hygiene-hits.txt"

pass() { echo "PASS $1"; }
fail() { echo "FAIL $1"; FAIL=1; }

scan_root() {
  local root="$1"
  rg -n --hidden -S "(legacy|historical|previously|formerly|old way|what changed)" "$root" \
    --glob "*.md" \
    --glob "!**/.git/**" \
    --glob "!**/node_modules/**" \
    --glob "!**/docs/archive/**" \
    --glob "!**/src/tech-debt/archive/**" \
    --glob "!**/docs/runtime-verification/**" \
    --glob "!**/docs/document-length-policy.md" \
    --glob "!**/docs/governance.md" \
    --glob "!**/.github/user-stories/**" \
    --glob "!**/src/tech-debt/**" \
    --glob "!**/docs/v2/EXECUTION_BACKLOG.md" \
    --glob "!**/docs/SDR_EXECUTION_BACKLOG.md" \
    --glob "!**/docs/product/03-backlog-user-stories.md" \
    --glob "!**/docs/product/07-execution-status.md" \
    > "$TMP" || true
  if [[ -s "$TMP" ]]; then
    fail "$root active-doc hygiene violations"
    sed -n '1,80p' "$TMP"
  else
    pass "$root active-doc hygiene clean"
  fi
}

scan_root "$ROOT/docs"
while IFS= read -r repo_path; do
  if [[ "$repo_path" == "~"* ]]; then
    repo_path="${repo_path/#\~/$HOME}"
  fi
  [[ -f "$repo_path/README.md" ]] && scan_root "$repo_path/README.md"
  [[ -f "$repo_path/CLAUDE.md" ]] && scan_root "$repo_path/CLAUDE.md"
done < <(jq -r '.repos[].path' "$MAP")

if [[ "$FAIL" -ne 0 ]]; then
  echo "Active doc hygiene: FAIL"
  exit 1
fi

echo "Active doc hygiene: PASS"
