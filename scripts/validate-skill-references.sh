#!/usr/bin/env bash
set -euo pipefail

ROOT="/Users/oliver/.claude"
FAIL=0

pass() { echo "PASS $1"; }
fail() { echo "FAIL $1"; FAIL=1; }

# Check persona config skill entries.
while IFS= read -r cfg; do
  skill_rel="$(jq -r '.skill // empty' "$cfg")"
  [[ -z "$skill_rel" ]] && continue
  skill_abs="$ROOT/$skill_rel"
  if [[ -f "$skill_abs" ]]; then
    pass "$(basename "$(dirname "$cfg")") config skill exists: $skill_rel"
  else
    fail "$(basename "$(dirname "$cfg")") config missing skill: $skill_rel"
  fi
done < <(find "$ROOT/personas" -type f -name 'config.json')

# Check persona_soul markdown skill path mentions.
while IFS= read -r md; do
  while IFS= read -r rel; do
    [[ -z "$rel" ]] && continue
    abs="$ROOT/$rel"
    if [[ -f "$abs" ]]; then
      pass "$(basename "$(dirname "$md")") persona_soul skill exists: $rel"
    else
      fail "$(basename "$(dirname "$md")") persona_soul missing skill: $rel"
    fi
  done < <(rg -o "skills/[A-Za-z0-9._/-]+/SKILL.md" "$md" | sort -u)
done < <(find "$ROOT/personas" -type f -name 'persona_soul.md')

if [[ "$FAIL" -ne 0 ]]; then
  echo "Skill reference check: FAIL"
  exit 1
fi

echo "Skill reference check: PASS"
