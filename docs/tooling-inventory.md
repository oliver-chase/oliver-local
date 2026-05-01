# Tooling Inventory

## Active Core Runtimes

- `~/oliver-local`: shared orchestration root.
- `.claude`: Claude runtime adapter + state.
- `.codex`: Codex runtime adapter + state.
- `.agents`: agent-runtime adapters + state.

## Product Repositories

- `~/projects/oliver-app`
- `~/projects/tesknota`
- `~/projects/v-two-sdr`
- `~/projects/fallow`

## Utility Repositories / Workspaces

- `~/claude-push`: helper automation repo.
- `~/dotfiles`: machine config repo.
- `~/references/*`: external templates/reference code.
- `~/projects/prompt-lint`: local utility workspace.

## Not Source Of Truth For Product Features

- `~/oliver-local/docs/*` (workspace pointers/standards only)
- `~/.codex/*` (runtime state)
- `~/.claude/*` runtime artifacts outside pointer files
- `~/.agents/*` runtime artifacts outside pointer files

## Duplication Policy

- Product behavior/process docs: keep in each product repo.
- Cross-project agent rules: keep in `~/oliver-local/shared/*`.
- Shared skills/tools: keep in `~/oliver-local/skills/*`.
- Do not maintain duplicate copies of the same process document across both locations.
