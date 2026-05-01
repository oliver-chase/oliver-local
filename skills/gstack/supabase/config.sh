#!/usr/bin/env bash
# Supabase project config for gstack telemetry.
# Keep concrete project URLs and keys in local environment files only.

GSTACK_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
if [[ -f "$GSTACK_ROOT/.env.local" ]]; then
  set -a
  # shellcheck source=/dev/null
  source "$GSTACK_ROOT/.env.local"
  set +a
fi

GSTACK_SUPABASE_URL="${GSTACK_SUPABASE_URL:-}"
GSTACK_SUPABASE_ANON_KEY="${GSTACK_SUPABASE_ANON_KEY:-}"
