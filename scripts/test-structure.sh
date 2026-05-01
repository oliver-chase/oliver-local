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

# 1) Runtime settings must stay local and avoid dangerous defaults.
if [[ ! -e "$ROOT/settings.json" ]]; then
  pass "settings.json is runtime-local, not tracked in oliver-local"
else
  fail "settings.json is runtime-local, not tracked in oliver-local"
fi

if jq -e '.permissions.defaultMode == "bypassPermissions" or .skipDangerousModePermissionPrompt == true' /Users/oliver/.claude/settings.json >/dev/null; then
  fail ".claude settings avoid bypass-permission defaults"
else
  pass ".claude settings avoid bypass-permission defaults"
fi

# 2) oliver-local alias should resolve to this repo root.
if [[ -d "/Users/oliver/oliver-local" ]]; then
  pass "oliver-local root exists"
else
  fail "oliver-local root exists"
fi

for alias_name in AGENT_SHARED_STRUCTURE.md SHARED_ORCHESTRATION.md AGENT_SYSTEM_MANIFEST.json; do
  if [[ -L "/Users/oliver/$alias_name" ]]; then
    pass "machine-level alias present: $alias_name"
  else
    fail "machine-level alias present: $alias_name"
  fi
done

if [[ ! -L "$ROOT/skills" && -d "$ROOT/skills" ]]; then
  pass "shared skills stored in oliver-local"
else
  fail "shared skills stored in oliver-local"
fi

if [[ ! -d "/Users/oliver/.claude/.git" ]]; then
  pass ".claude is not a separate shared-system git checkout"
else
  fail ".claude is not a separate shared-system git checkout"
fi

if [[ "$(readlink /Users/oliver/.claude/skills 2>/dev/null || true)" = "/Users/oliver/oliver-local/skills" ]]; then
  pass ".claude skills adapter points to oliver-local"
else
  fail ".claude skills adapter points to oliver-local"
fi

for adapter_name in docs scripts shared personas identity; do
  if [[ "$(readlink "/Users/oliver/.claude/$adapter_name" 2>/dev/null || true)" = "/Users/oliver/oliver-local/$adapter_name" ]]; then
    pass ".claude $adapter_name adapter points to oliver-local"
  else
    fail ".claude $adapter_name adapter points to oliver-local"
  fi
done

if [[ "$(readlink /Users/oliver/.codex/skills/story-lifecycle-gate 2>/dev/null || true)" = "/Users/oliver/oliver-local/skills/story-lifecycle-gate" ]]; then
  pass ".codex story-lifecycle-gate adapter points to oliver-local"
else
  fail ".codex story-lifecycle-gate adapter points to oliver-local"
fi

for runtime in .claude .codex .agents; do
  readme="/Users/oliver/$runtime/README.md"
  orchestration="/Users/oliver/$runtime/ORCHESTRATION.md"
  if [[ -f "$readme" ]] && rg -q 'Runtime Adapter|runtime adapter' "$readme" && rg -q '~/oliver-local' "$readme"; then
    pass "$runtime README documents local runtime adapter"
  else
    fail "$runtime README documents local runtime adapter"
  fi
  if [[ -f "$orchestration" ]] && rg -q '~/oliver-local' "$orchestration"; then
    pass "$runtime ORCHESTRATION points to oliver-local"
  else
    fail "$runtime ORCHESTRATION points to oliver-local"
  fi
  if cmp -s "$ROOT/runtime-pointers/$runtime/README.md" "$readme"; then
    pass "$runtime README matches tracked runtime pointer"
  else
    fail "$runtime README matches tracked runtime pointer"
  fi
  if cmp -s "$ROOT/runtime-pointers/$runtime/ORCHESTRATION.md" "$orchestration"; then
    pass "$runtime ORCHESTRATION matches tracked runtime pointer"
  else
    fail "$runtime ORCHESTRATION matches tracked runtime pointer"
  fi
done

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
map_plus_orchestration="$(printf "%s\noliver-local\n" "$map_names" | sort)"
if [[ "$map_plus_orchestration" = "$doc_names" ]]; then
  pass "docs/projects/*.md matches shared/repo-map.json + oliver-local orchestration doc"
else
  fail "docs/projects/*.md matches shared/repo-map.json + oliver-local orchestration doc"
fi

while IFS= read -r repo_path; do
  if [[ -d "$repo_path" ]]; then
    pass "repo path exists: $repo_path"
  else
    fail "repo path exists: $repo_path"
  fi
done < <(jq -r '.repos[].path' shared/repo-map.json)

# 5) Guard against known docs drift.
if rg -q '~/projects/\*' docs/architecture.md; then
  pass "docs/architecture.md includes canonical product root pattern"
else
  fail "docs/architecture.md includes canonical product root pattern"
fi

if rg -q 'oliver-app' docs/workspace-tree.md; then
  pass "docs/workspace-tree.md includes oliver-app"
else
  fail "docs/workspace-tree.md includes oliver-app"
fi

if [[ -f docs/runtime-adapters.md ]] && rg -q '~/.claude/README.md' docs/runtime-adapters.md && rg -q '~/.codex/README.md' docs/runtime-adapters.md && rg -q '~/.agents/README.md' docs/runtime-adapters.md; then
  pass "docs/runtime-adapters.md documents runtime README files"
else
  fail "docs/runtime-adapters.md documents runtime README files"
fi

# 6) README and skills documentation should reflect active structure.
if rg -q 'Shared System' README.md && rg -q 'Governance Gates' README.md; then
  pass "README.md includes shared-system and governance sections"
else
  fail "README.md includes shared-system and governance sections"
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

# 8) Guard against instruction conflicts and missing orchestration entries.
if rg -q 'Always Plan First' CLAUDE.md; then
  fail "CLAUDE.md removed obsolete 'Always Plan First' rule"
else
  pass "CLAUDE.md removed obsolete 'Always Plan First' rule"
fi

if [[ -f ORCHESTRATION.md ]] && rg -q 'shared system root|Shared system root' ORCHESTRATION.md; then
  pass "ORCHESTRATION.md exists and references shared system"
else
  fail "ORCHESTRATION.md exists and references shared system"
fi

printf "\n"
if [[ "$FAILURES" -eq 0 ]]; then
  printf "All structure tests passed.\n"
  exit 0
fi

printf "Structure tests failed: %s issue(s).\n" "$FAILURES"
exit 1
