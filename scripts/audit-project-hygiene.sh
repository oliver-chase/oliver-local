#!/usr/bin/env bash
set -euo pipefail

ROOT="/Users/oliver/oliver-local"
MAP="$ROOT/shared/repo-map.json"
MANIFEST="$ROOT/shared/project-bootstrap-manifest.json"
FAIL=0

check_repo() {
  local repo_name="$1"
  local repo_path="$2"

  echo "=== audit: $repo_name ==="

  while read -r d; do
    if [[ -d "$repo_path/$d" ]]; then
      echo "PASS dir: $d"
    else
      echo "FAIL dir: $d"
      FAIL=1
    fi
  done < <(jq -r '.requiredDirectories[]' "$MANIFEST")

  while IFS='|' read -r srcRel dstRel mode; do
    local src dst
    src="$ROOT/$srcRel"
    dst="$repo_path/$dstRel"

    if [[ ! -f "$dst" ]]; then
      echo "FAIL missing file: $dstRel"
      FAIL=1
      continue
    fi

    if [[ "$mode" == "strict" ]]; then
      if cmp -s "$src" "$dst"; then
        echo "PASS file(strict): $dstRel"
      else
        echo "FAIL drift(strict): $dstRel"
        FAIL=1
      fi
    else
      echo "PASS file(presence): $dstRel"
    fi
  done < <(jq -r '.templatedFiles[] | .source + "|" + .target + "|" + (.mode // "presence")' "$MANIFEST")
}

while read -r repo; do
  name="$(jq -r '.name' <<<"$repo")"
  path="$(jq -r '.path' <<<"$repo")"
  if [[ ! -d "$path" ]]; then
    echo "FAIL missing repo: $name ($path)"
    FAIL=1
    continue
  fi
  check_repo "$name" "$path"
done < <(jq -c '.repos[]' "$MAP")

if [[ "$FAIL" -ne 0 ]]; then
  echo "audit: FAIL"
  exit 1
fi

echo "audit: PASS"
