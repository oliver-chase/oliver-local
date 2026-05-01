#!/usr/bin/env bash
set -euo pipefail

repos=(
  "/Users/oliver/projects/oliver-app"
  "/Users/oliver/projects/tesknota"
  "/Users/oliver/projects/v-two-sdr"
  "/Users/oliver/projects/fallow"
)

for repo in "${repos[@]}"; do
  [ -d "$repo/.git" ] || continue
  mkdir -p "$repo/.git/hooks"
  cat > "$repo/.git/hooks/pre-commit" <<HOOK
#!/usr/bin/env bash
set -euo pipefail
/Users/oliver/oliver-local/scripts/run-governance-gates.sh "$repo"
/Users/oliver/oliver-local/scripts/scan-secrets.sh "$repo"
HOOK
  chmod +x "$repo/.git/hooks/pre-commit"
  echo "installed pre-commit: $repo"
done
