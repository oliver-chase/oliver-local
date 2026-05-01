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
  hook_dir="$repo/.git/hooks"
  hook_file="$hook_dir/pre-commit"
  mkdir -p "$hook_dir"
  cat > "$hook_file" <<HOOK
#!/usr/bin/env bash
set -euo pipefail
"$ROOT/scripts/run-governance-gates.sh" "$repo"
HOOK
  chmod +x "$hook_file"
  echo "installed: $hook_file"
done
