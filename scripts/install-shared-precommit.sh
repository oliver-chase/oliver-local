#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MAP="$ROOT/shared/repo-map.json"

repos=()
while IFS= read -r repo_path; do
  repos+=("$repo_path")
done < <(jq -r '.repos[].path' "$MAP")

for repo in "${repos[@]}"; do
  if [[ "$repo" == "~"* ]]; then
    repo="${repo/#\~/$HOME}"
  fi
  [ -d "$repo/.git" ] || continue
  mkdir -p "$repo/.git/hooks"
  cat > "$repo/.git/hooks/pre-commit" <<HOOK
#!/usr/bin/env bash
set -euo pipefail
"$ROOT/scripts/run-governance-gates.sh" "$repo"
"$ROOT/scripts/scan-secrets.sh" "$repo"
HOOK
  chmod +x "$repo/.git/hooks/pre-commit"
  echo "installed pre-commit: $repo"
done
