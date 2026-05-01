#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
RULES="$ROOT/shared/project-structure-rules.json"
TMP="/tmp/structure-check"
mkdir -p "$TMP"
FAIL=0

pass() { echo "PASS $1"; }
fail() { echo "FAIL $1"; FAIL=1; }

expand_home() {
  local p="$1"
  if [[ "$p" == "~"* ]]; then
    printf "%s" "${p/#\~/$HOME}"
  else
    printf "%s" "$p"
  fi
}

SHARED_WORKFLOW_FILENAMES=(
  "workflow-standards.md"
  "backlog-workflow.md"
  "story-lifecycle-sop.md"
  "testing-rules.md"
  "qa-process.md"
  "full-qa-audit.md"
  "oliver-local-sync.md"
)

while read -r repo; do
  name="$(jq -r '.name' <<<"$repo")"
  path="$(expand_home "$(jq -r '.path' <<<"$repo")")"
  echo "=== structure: $name ($path)"

  if [[ ! -d "$path" ]]; then
    fail "$name repo missing"
    continue
  fi

  while read -r req; do
    if [[ -e "$path/$req" ]]; then
      pass "$name required path present: $req"
    else
      fail "$name required path missing: $req"
    fi
  done < <(jq -r '.required_paths[]' <<<"$repo")

  # Forbidden globs (files should not exist)
  while read -r glob; do
    [[ -z "$glob" ]] && continue
    if compgen -G "$path/$glob" > /dev/null; then
      echo "forbidden matches for $name: $glob"
      compgen -G "$path/$glob" | sed -n '1,20p'
      fail "$name forbidden matches present: $glob"
    else
      pass "$name forbidden matches absent: $glob"
    fi
  done < <(jq -r '.forbidden_backlog_globs[]?' <<<"$repo")

  # Backlog-like files outside allowed roots
  find "$path" -type f -iname '*backlog*.md' \
    ! -path '*/.git/*' \
    ! -path '*/node_modules/*' \
    > "$TMP/$name-backlog-files.txt"

  while IFS= read -r file; do
    rel="${file#$path/}"
    [[ -z "$rel" ]] && continue

    allowed="0"
    while IFS= read -r root; do
      if [[ "$rel" == "$root"* ]]; then
        allowed="1"
        break
      fi
    done < <(jq -r '.allowed_backlog_roots[]?' <<<"$repo")

    if [[ "$allowed" == "1" ]]; then
      pass "$name backlog file allowed: $rel"
    else
      fail "$name backlog file outside allowed roots: $rel"
    fi
  done < "$TMP/$name-backlog-files.txt"

  # Duplicate shared process/workflow docs inside project repos
  for wf in "${SHARED_WORKFLOW_FILENAMES[@]}"; do
    find "$path" -type f -name "$wf" \
      ! -path '*/.git/*' \
      ! -path '*/node_modules/*' \
      ! -path '*/.github/user-stories/*' \
      > "$TMP/$name-$wf.txt"
    if [[ -s "$TMP/$name-$wf.txt" ]]; then
      echo "duplicate shared workflow doc(s) found in $name: $wf"
      sed -n '1,20p' "$TMP/$name-$wf.txt"
      fail "$name duplicates shared workflow doc: $wf"
    else
      pass "$name no duplicate shared workflow doc: $wf"
    fi
  done

  echo
done < <(jq -c '.repos[]' "$RULES")

if [[ "$FAIL" -ne 0 ]]; then
  echo "Project structure check: FAIL"
  exit 1
fi

echo "Project structure check: PASS"
