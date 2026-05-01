#!/usr/bin/env bash
set -euo pipefail

TARGET_REPO="${1:-}"

if [[ -n "$TARGET_REPO" ]]; then
  REPOS=("$TARGET_REPO")
else
  REPOS=(
    "/Users/oliver/projects/oliver-app"
    "/Users/oliver/projects/tesknota"
    "/Users/oliver/projects/v-two-sdr"
    "/Users/oliver/projects/fallow"
  )
fi

FAIL=0

pass() { echo "PASS $1"; }
fail() { echo "FAIL $1"; FAIL=1; }

check_file() {
  local repo="$1"
  local rel="$2"
  if [[ -f "$repo/$rel" ]]; then
    pass "$repo :: $rel"
  else
    fail "$repo :: missing $rel"
  fi
}

check_absent() {
  local repo="$1"
  local rel="$2"
  if [[ -e "$repo/$rel" ]]; then
    fail "$repo :: forbidden file present $rel"
  else
    pass "$repo :: forbidden file absent $rel"
  fi
}

scan_forbidden_refs() {
  local repo="$1"
  local pattern="$2"
  if rg -n --hidden -S "$pattern" "$repo" \
    --glob '*.md' \
    --glob '!**/.git/**' \
    --glob '!**/node_modules/**' \
    --glob '!**/.github/user-stories/**' \
    --glob '!**/src/tech-debt/archive/**' \
    --glob '!**/docs/archive/**' \
    >/tmp/governance_ref_hits.txt 2>/dev/null; then
    fail "$repo :: forbidden reference '$pattern'"
    sed -n '1,20p' /tmp/governance_ref_hits.txt
  else
    pass "$repo :: forbidden reference '$pattern' absent"
  fi
}

audit_repo() {
  local repo="$1"
  local name
  name="$(basename "$repo")"

  if [[ ! -d "$repo" ]]; then
    fail "$repo :: repo path missing"
    return
  fi

  echo "=== auditing $repo"

  case "$name" in
    oliver-app)
      check_file "$repo" "README.md"
      check_file "$repo" "CLAUDE.md"
      check_file "$repo" "AGENTS.md"
      check_file "$repo" "docs/MODULE_CONTEXT.md"
      check_file "$repo" "docs/MODULE_INSTRUCTIONS.md"
      ;;
    tesknota)
      check_file "$repo" "README.md"
      check_file "$repo" "CLAUDE.md"
      check_file "$repo" "AGENTS.md"
      check_file "$repo" "docs/product/03-backlog-user-stories.md"
      check_file "$repo" "docs/product/07-execution-status.md"
      ;;
    v-two-sdr)
      check_file "$repo" "README.md"
      check_file "$repo" "CLAUDE.md"
      check_file "$repo" "docs/README.md"
      check_file "$repo" "docs/SDR_EXECUTION_BACKLOG.md"
      check_absent "$repo" "docs/STATE-AUDIT-2026-04-22.md"
      check_absent "$repo" "docs/REDESIGN-2026-04-22.md"
      check_absent "$repo" "docs/SDR_FULL_PASS_BACKLOG_2026-04-24.md"
      check_absent "$repo" "docs/SDR_USER_STORIES_ACCEPTANCE_TESTS.md"
      ;;
    fallow)
      check_file "$repo" "README.md"
      check_file "$repo" "CLAUDE.md"
      check_file "$repo" "docs/v2/README.md"
      check_file "$repo" "docs/v2/EXECUTION_BACKLOG.md"
      check_absent "$repo" "docs/v2/LEGACY_DOC_AUDIT.md"
      check_absent "$repo" "docs/PRODUCT_ROADMAP.md"
      check_absent "$repo" "docs/ROADMAP.md"
      check_absent "$repo" "docs/DESIGN.md"
      check_absent "$repo" "docs/UX.md"
      check_absent "$repo" "docs/DATA_SCHEMA.md"
      ;;
    *)
      fail "$repo :: no governance profile for repo '$name'"
      ;;
  esac

  scan_forbidden_refs "$repo" "/Users/oliver/.codex/skills"
  scan_forbidden_refs "$repo" "/Users/oliver/.claude/skills"
  scan_forbidden_refs "$repo" "story-lifecycle-gate"
}

for repo in "${REPOS[@]}"; do
  audit_repo "$repo"
  echo
 done

if [[ "$FAIL" -ne 0 ]]; then
  echo "Governance audit: FAIL"
  exit 1
fi

echo "Governance audit: PASS"
