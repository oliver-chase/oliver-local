#!/usr/bin/env bash
set -euo pipefail

ROOT="/Users/oliver/oliver-local"
MAP="$ROOT/shared/repo-map.json"
MANIFEST="$ROOT/shared/project-bootstrap-manifest.json"
OVERWRITE_NON_STRICT="${OVERWRITE_NON_STRICT:-0}"

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
    if [[ "$mode" == "strict" ]]; then
      cp "$src" "$dst"
      echo "synced(strict): $repo_path/$dstRel"
      continue
    fi

    if [[ -f "$dst" && "$OVERWRITE_NON_STRICT" != "1" ]]; then
      echo "kept(local): $repo_path/$dstRel"
      continue
    fi

    cp "$src" "$dst"
    echo "synced(presence): $repo_path/$dstRel"
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
