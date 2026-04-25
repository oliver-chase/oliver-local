#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

BASE_REF="${OLIVER_LOCAL_BASE_REF:-origin/main}"
if ! git rev-parse --verify --quiet "$BASE_REF" >/dev/null; then
  BASE_REF="main"
fi

MERGE_BASE="$(git merge-base "$BASE_REF" HEAD)"
WORKTREE_CHANGED="$(git diff --name-only HEAD)"
UNTRACKED_CHANGED="$(git ls-files --others --exclude-standard)"

if [[ -n "$WORKTREE_CHANGED" || -n "$UNTRACKED_CHANGED" ]]; then
  CHANGED_FILES="$(printf "%s\n%s\n" "$WORKTREE_CHANGED" "$UNTRACKED_CHANGED" | sed '/^$/d' | sort -u)"
  CHANGE_SCOPE="working tree"
else
  CHANGED_FILES="$(git diff --name-only "$MERGE_BASE..HEAD")"
  CHANGE_SCOPE="$MERGE_BASE..HEAD"
fi

if [[ -z "$CHANGED_FILES" ]]; then
  echo "No changes detected."
  exit 0
fi

has_changed() {
  local pattern="$1"
  grep -Eq "$pattern" <<<"$CHANGED_FILES"
}

FAILURES=0

pass() {
  printf "PASS %s\n" "$1"
}

fail() {
  printf "FAIL %s\n" "$1"
  FAILURES=$((FAILURES + 1))
}

if has_changed '^shared/repo-map\.json$'; then
  if has_changed '^docs/project-repos\.md$|^docs/workspace-tree\.md$|^docs/architecture\.md$|^README\.md$'; then
    pass "repo-map change has matching docs updates"
  else
    fail "repo-map changed without related docs (project-repos/workspace-tree/architecture/README)"
  fi
fi

if has_changed '^shared/workflow-standards\.md$'; then
  if has_changed '^shared/workflows/README\.md$|^CLAUDE\.md$'; then
    pass "workflow standards change has trigger/routing updates"
  else
    fail "workflow-standards changed without workflow index or CLAUDE trigger updates"
  fi
fi

if has_changed '^settings\.json$|^config\.json$'; then
  if has_changed '^README\.md$|^docs/architecture\.md$|^docs/workspace-tree\.md$'; then
    pass "settings/config change has context doc updates"
  else
    fail "settings/config changed without architecture/readme/workspace doc updates"
  fi
fi

if has_changed '^personas/.+/config\.json$'; then
  if has_changed '^docs/personas/|^CLAUDE\.md$'; then
    pass "persona config change has docs/protocol updates"
  else
    fail "persona config changed without persona docs or CLAUDE updates"
  fi
fi

if has_changed '^docs/projects/.+\.md$'; then
  if has_changed '^shared/repo-map\.json$|^docs/project-repos\.md$'; then
    pass "project pointer updates include repo inventory updates"
  else
    fail "docs/projects changed without repo-map or project-repos index updates"
  fi
fi

printf "\nChanged files checked from %s\n" "$CHANGE_SCOPE"
printf "%s\n" "$CHANGED_FILES"
printf "\n"

if [[ "$FAILURES" -gt 0 ]]; then
  printf "doc-config-impact check failed: %s issue(s).\n" "$FAILURES"
  exit 1
fi

printf "doc-config-impact check passed.\n"
