#!/usr/bin/env bash
set -euo pipefail

repos=(
  "/Users/oliver/projects/oliver-app"
  "/Users/oliver/projects/tesknota"
  "/Users/oliver/projects/v-two-sdr"
  "/Users/oliver/projects/fallow"
)

for repo in "${repos[@]}"; do
  hook_dir="$repo/.git/hooks"
  hook_file="$hook_dir/pre-commit"
  mkdir -p "$hook_dir"
  cat > "$hook_file" <<HOOK
#!/usr/bin/env bash
set -euo pipefail
/Users/oliver/oliver-local/scripts/run-governance-gates.sh "$repo"
HOOK
  chmod +x "$hook_file"
  echo "installed: $hook_file"
done
