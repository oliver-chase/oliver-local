#!/usr/bin/env bash
set -euo pipefail

ROOT="/Users/oliver/oliver-local"
MAP="$ROOT/shared/repo-map.json"
MANIFEST="$ROOT/shared/project-bootstrap-manifest.json"

sync_repo() {
  local repo_path="$1"
  jq -r '.requiredDirectories[]' "$MANIFEST" | while read -r d; do
    mkdir -p "$repo_path/$d"
  done

  jq -r '.templatedFiles[] | .source + "|" + .target + "|" + (.mode // "presence")' "$MANIFEST" | while IFS='|' read -r srcRel dstRel mode; do
    local src dst
    src="$ROOT/$srcRel"
    dst="$repo_path/$dstRel"
    mkdir -p "$(dirname "$dst")"
    cp "$src" "$dst"
    echo "synced: $repo_path/$dstRel"
  done
}

jq -c '.repos[]' "$MAP" | while read -r repo; do
  name="$(jq -r '.name' <<<"$repo")"
  path="$(jq -r '.path' <<<"$repo")"
  if [[ ! -d "$path" ]]; then
    echo "skip missing repo: $name ($path)"
    continue
  fi
  echo "=== sync: $name ==="
  sync_repo "$path"
done

echo "sync complete"
