#!/usr/bin/env bash
set -euo pipefail

ROOT="/Users/oliver/oliver-local"
MANIFEST="$ROOT/shared/project-bootstrap-manifest.json"
FORCE="${FORCE:-0}"

if [[ $# -lt 1 ]]; then
  echo "usage: $0 /absolute/path/to/project" >&2
  exit 1
fi

PROJECT_ROOT="$1"
if [[ "$PROJECT_ROOT" != /* ]]; then
  echo "project path must be absolute" >&2
  exit 1
fi

mkdir -p "$PROJECT_ROOT"

jq -r '.requiredDirectories[]' "$MANIFEST" | while read -r d; do
  mkdir -p "$PROJECT_ROOT/$d"
  echo "created dir: $PROJECT_ROOT/$d"
done

jq -r '.templatedFiles[] | .source + "|" + .target + "|" + (.mode // "presence")' "$MANIFEST" | while IFS='|' read -r srcRel dstRel mode; do
  src="$ROOT/$srcRel"
  dst="$PROJECT_ROOT/$dstRel"

  mkdir -p "$(dirname "$dst")"
  if [[ -f "$dst" && "$FORCE" != "1" ]]; then
    echo "skip existing: $dst"
    continue
  fi
  cp "$src" "$dst"
  echo "templated: $dst"
done

echo "bootstrap complete: $PROJECT_ROOT"
