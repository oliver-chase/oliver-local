#!/usr/bin/env bash
set -euo pipefail

STAMP="$(date '+%Y-%m-%d %H:%M:%S %Z')"
REPORT_DIR="/Users/oliver/oliver-local/docs/runtime-verification"
REPORT_FILE="$REPORT_DIR/governance-status.md"
LOG_FILE="/tmp/oliver-governance-nightly.log"

mkdir -p "$REPORT_DIR"

{
  echo "# Governance Status"
  echo
  echo "Last run: $STAMP"
  echo

  echo "## Cleanup"
  echo
  for repo in \
    /Users/oliver/projects/oliver-app \
    /Users/oliver/projects/tesknota \
    /Users/oliver/projects/v-two-sdr \
    /Users/oliver/projects/fallow; do
    removed=0
    for d in test-results playwright-report; do
      if [[ -d "$repo/$d" ]]; then
        rm -rf "$repo/$d"
        removed=$((removed+1))
      fi
    done
    echo "- $(basename "$repo"): removed $removed runtime artifact dirs"
  done

  echo
  echo "## Gate Results"
  echo

  if /Users/oliver/oliver-local/scripts/run-governance-gates.sh; then
    echo "- Overall: PASS"
  else
    echo "- Overall: FAIL"
    echo "- See: $LOG_FILE"
    exit 1
  fi
} > "$REPORT_FILE" 2> "$LOG_FILE"

cat "$REPORT_FILE"
