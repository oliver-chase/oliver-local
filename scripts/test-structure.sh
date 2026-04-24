#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FAILURES=0

pass() {
  printf "PASS %s\n" "$1"
}

fail() {
  printf "FAIL %s\n" "$1"
  FAILURES=$((FAILURES + 1))
}

resolve_path() {
  local p="$1"
  if [[ "$p" = /* ]]; then
    printf "%s" "$p"
  else
    printf "%s/%s" "$ROOT" "$p"
  fi
}

check_exists() {
  local label="$1"
  local raw="$2"
  local target
  target="$(resolve_path "$raw")"
  if [[ -e "$target" ]]; then
    pass "$label -> $raw"
  else
    fail "$label -> $raw"
  fi
}

cd "$ROOT"

# 1) statusLine hook path must exist.
STATUS_CMD="$(jq -r '.statusLine.command' settings.json)"
STATUS_PATH="$(printf "%s" "$STATUS_CMD" | sed -n 's/.*"\(\/[^"]*\)".*/\1/p')"
if [[ -n "$STATUS_PATH" && -e "$STATUS_PATH" ]]; then
  pass "settings.statusLine.command target exists"
else
  fail "settings.statusLine.command target exists"
fi

# 2) oliver-local alias should resolve to this repo root.
if [[ "$(readlink /Users/oliver/oliver-local 2>/dev/null || true)" = "/Users/oliver/.claude" ]]; then
  pass "oliver-local symlink points to ~/.claude"
else
  fail "oliver-local symlink points to ~/.claude"
fi

# 3) Persona config paths must resolve.
for persona in cmo marketing sdr; do
  cfg="personas/${persona}/config.json"
  check_exists "${cfg}:workspace" "$(jq -r '.workspace' "$cfg")"
  check_exists "${cfg}:skill" "$(jq -r '.skill' "$cfg")"
  check_exists "${cfg}:persona_soul" "$(jq -r '.persona_soul' "$cfg")"
  while IFS= read -r v; do
    check_exists "${cfg}:shared_data" "$v"
  done < <(jq -r '.collaboration.shared_data | to_entries[] | .value' "$cfg")
done

# 4) Project pointer docs and repo-map should stay aligned.
map_names="$(jq -r '.repos[].name' shared/repo-map.json | sort)"
doc_names="$(find docs/projects -maxdepth 1 -type f -name '*.md' -exec basename {} .md \; | sort)"
if [[ "$map_names" = "$doc_names" ]]; then
  pass "docs/projects/*.md matches shared/repo-map.json"
else
  fail "docs/projects/*.md matches shared/repo-map.json"
fi

while IFS= read -r repo_path; do
  if [[ -d "$repo_path" ]]; then
    pass "repo path exists: $repo_path"
  else
    fail "repo path exists: $repo_path"
  fi
done < <(jq -r '.repos[].path' shared/repo-map.json)

# 5) Guard against known docs drift.
if rg -q 'oliver-app' docs/architecture.md; then
  pass "docs/architecture.md includes oliver-app"
else
  fail "docs/architecture.md includes oliver-app"
fi

if rg -q 'oliver-app' docs/workspace-tree.md; then
  pass "docs/workspace-tree.md includes oliver-app"
else
  fail "docs/workspace-tree.md includes oliver-app"
fi

# 6) README and skills documentation should reflect active structure.
if rg -q 'oliver-app' README.md && rg -q 'prompt-lint' README.md; then
  pass "README.md includes oliver-app and prompt-lint"
else
  fail "README.md includes oliver-app and prompt-lint"
fi

for required_skill in \
  'cmo/' \
  'marketing/' \
  'work-outreach/' \
  'nextjs-advanced-routing/' \
  'vercel-ai-sdk/'; do
  if rg -q "$required_skill" docs/skills.md; then
    pass "docs/skills.md includes $required_skill"
  else
    fail "docs/skills.md includes $required_skill"
  fi
done

# 7) Local scratch directories should remain local-only.
if git check-ignore -q ide/ && git check-ignore -q plans/; then
  pass "ide/ and plans/ are ignored"
else
  fail "ide/ and plans/ are ignored"
fi

# 8) Guard against instruction conflicts.
if rg -q 'Always Plan First' CLAUDE.md; then
  fail "CLAUDE.md removed obsolete 'Always Plan First' rule"
else
  pass "CLAUDE.md removed obsolete 'Always Plan First' rule"
fi

if rg -q 'No Planning Phase' CLAUDE.md; then
  pass "CLAUDE.md keeps 'No Planning Phase' rule"
else
  fail "CLAUDE.md keeps 'No Planning Phase' rule"
fi

printf "\n"
if [[ "$FAILURES" -eq 0 ]]; then
  printf "All structure tests passed.\n"
  exit 0
fi

printf "Structure tests failed: %s issue(s).\n" "$FAILURES"
exit 1
