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

echo "PASS secrets filename scan"
