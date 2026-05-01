#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 3 ]; then
  echo "usage: protected-replace.sh <root> <from_regex> <to>"
  exit 2
fi

root="$1"
from="$2"
to="$3"

# Protected identifiers/paths that must never be mass-replaced.
deny='v-two-sdr|/Users/oliver/projects/v-two-sdr|/Users/oliver/projects/oliver-app|/Users/oliver/projects/tesknota|/Users/oliver/projects/fallow|repo-map\.json|project-structure-rules\.json'

if echo "$from $to" | rg -qi "$deny"; then
  echo "FAIL protected identifier/path in replace args"
  exit 1
fi

rg -l "$from" "$root" -S --glob '!.git/**' --glob '!node_modules/**' --glob '!.next/**' \
| while IFS= read -r f; do
  perl -0pi -e "s/$from/$to/g" "$f"
done

echo "PASS protected replace completed"
