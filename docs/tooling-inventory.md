# Tooling Inventory

## Active Core Runtimes

- `<vault-root>/Oliver/_Project Repos/oliver-local`: shared orchestration root.
- `.claude`: Claude runtime adapter + state.
- `.codex`: Codex runtime adapter + state.
- `.agents`: agent-runtime adapters + state.

`~/.claude` must not be a separate Git checkout for shared orchestration. Its shared-facing directories are adapter links into `<vault-root>/Oliver/_Project Repos/oliver-local`.

## Product Repositories

- `<vault-root>/Oliver/_Project Repos/oliver-app`
- `<vault-root>/Oliver/_Project Repos/tesknota`
- `<vault-root>/Oliver/_Project Repos/v-two-sdr`
- `<vault-root>/Oliver/_Project Repos/fallow`

## Utility Repositories / Workspaces

- `~/claude-push`: helper automation repo for Claude permission push notifications.
- `~/dotfiles`: machine shell/config repo.
- `~/references/*`: external templates/reference code; not active source-of-truth.
- `<vault-root>/Oliver/_Project Repos/prompt-lint`: local utility workspace.

## Not Source Of Truth For Product Features

- `<vault-root>/Oliver/_Project Repos/oliver-local/docs/*` (workspace pointers/standards only)
- `~/.codex/*` (runtime state)
- `~/.claude/*` runtime artifacts outside pointer files
- `~/.agents/*` runtime artifacts outside pointer files

## Runtime Adapter Links

Tracked context for runtime adapter README/ORCHESTRATION files lives in `docs/runtime-adapters.md` and `runtime-pointers/*`.

- Runtime adapter README files:
  - `~/.claude/README.md`
  - `~/.codex/README.md`
  - `~/.agents/README.md`
- `~/.claude/docs` -> `<vault-root>/Oliver/_Project Repos/oliver-local/docs`
- `~/.claude/scripts` -> `<vault-root>/Oliver/_Project Repos/oliver-local/scripts`
- `~/.claude/shared` -> `<vault-root>/Oliver/_Project Repos/oliver-local/shared`
- `~/.claude/personas` -> `<vault-root>/Oliver/_Project Repos/oliver-local/personas`
- `~/.claude/identity` -> `<vault-root>/Oliver/_Project Repos/oliver-local/identity`
- `~/.claude/skills` -> `<vault-root>/Oliver/_Project Repos/oliver-local/skills`
- `~/.codex/skills/story-lifecycle-gate` -> `<vault-root>/Oliver/_Project Repos/oliver-local/skills/story-lifecycle-gate`

## Duplication Policy

- Product behavior/process docs: keep in each product repo.
- Cross-project agent rules: keep in `<vault-root>/Oliver/_Project Repos/oliver-local/shared/*`.
- Shared skills/tools: keep in `<vault-root>/Oliver/_Project Repos/oliver-local/skills/*`.
- Do not maintain duplicate copies of the same process document across both locations.
