#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
REPO_PATH="${1:-}"
if [[ -n "$REPO_PATH" ]]; then
  "$SCRIPT_DIR/governance-audit.sh" "$REPO_PATH"
  "$SCRIPT_DIR/check-project-structure.sh"
  exit 0
fi
"$SCRIPT_DIR/test-structure.sh"
"$SCRIPT_DIR/check-doc-config-impact.sh"
"$SCRIPT_DIR/validate-skill-references.sh"
"$SCRIPT_DIR/validate-doc-lengths.sh"
"$SCRIPT_DIR/validate-active-doc-hygiene.sh"
"$SCRIPT_DIR/validate-doc-integrity.sh"
"$SCRIPT_DIR/governance-audit.sh"
"$SCRIPT_DIR/check-project-structure.sh"
