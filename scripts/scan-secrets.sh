#!/usr/bin/env bash
set -euo pipefail

repo="${1:-$PWD}"
cd "$repo"

if [ -d .git ]; then
  tracked_files=$(git ls-files)
else
  tracked_files=$(find . -type f)
fi

matches=$(echo "$tracked_files" | rg -n '(^|/)(\.env$|\.env\.(local|production|staging|dev)|.*(secret|credential|private[-_]?key|service[-_]?account).*(json|ya?ml|txt|pem|key)$|.*\.(pem|p12|pfx|key)$|secrets/.+\.(json|ya?ml|txt))' -S || true)

filtered=$(echo "$matches" | rg -v '\.env\.example$|\.env\.local\.example$|\.example\.|secrets/README\.md$|\.github/workflows/governance-secrets-gate\.yml$' || true)

if [ -n "${filtered// }" ]; then
  echo "FAIL secret-like tracked files detected"
  echo "$filtered"
  exit 1
fi

content_patterns=(
  'https://[a-z0-9]{15,}\.supabase\.co'
  'github_pat_[A-Za-z0-9_]{20,}'
  'gh[pousr]_[A-Za-z0-9_]{20,}'
  'sk-[A-Za-z0-9]{20,}'
  'xox[baprs]-[A-Za-z0-9-]{20,}'
  'AKIA[0-9A-Z]{16}'
  'AIza[0-9A-Za-z_-]{20,}'
  'sbp_[A-Za-z0-9_-]{20,}'
  'eyJ[A-Za-z0-9_-]{20,}\.[A-Za-z0-9_-]{20,}\.[A-Za-z0-9_-]{20,}'
  '(postgres|postgresql|mongodb(\+srv)?|redis)://[^[:space:]]+'
)

content_hits=""
if [ -d .git ]; then
  for pattern in "${content_patterns[@]}"; do
    hits=$(git grep -nI -E "$pattern" -- . \
      ':!node_modules' \
      ':!.next' \
      ':!dist' \
      ':!build' \
      ':!coverage' \
      ':!test-results' \
      ':!playwright-report' \
      ':!*.lock' \
      ':!skills/gstack/test/**' \
      ':!skills/gstack/tests/**' \
      ':!skills/gstack/**/test/**' \
      ':!skills/gstack/**/tests/**' \
      ':!skills/gstack/**/fixtures/**' \
      ':!skills/gstack/**/README.md' \
      ':!skills/gstack/**/SKILL.md' \
      ':!skills/gstack/**/SKILL.md.tmpl' \
      ':!skills/imagegen/references/**' \
      ':!skills/security-review/SKILL.md' 2>/dev/null || true)
    if [ -n "${hits// }" ]; then
      redacted=$(echo "$hits" | awk -F: -v rule="$pattern" '{print $1 ":" $2 ": " rule}')
      content_hits="${content_hits}${redacted}"$'\n'
    fi
  done
fi

if [ -n "${content_hits// }" ]; then
  echo "FAIL secret-like tracked content detected"
  echo "$content_hits" | sed '/^[[:space:]]*$/d'
  exit 1
fi

echo "PASS secrets filename and content scan"
