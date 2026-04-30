# Tooling Inventory

## Active Core Runtimes

- `.claude`: Claude orchestration + runtime.
- `.codex`: Codex runtime.
- `.agents`: shared local skills/config packs used by agent tooling.

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

- `~/.claude/docs/*` (workspace pointers/standards only)
- `~/.codex/*` (runtime state)
- `~/.claude/session-env/*` and similar runtime artifacts

## Duplication Policy

- Product behavior/process docs: keep in each product repo.
- Cross-project agent rules: keep in `~/.claude/shared/*`.
- Do not maintain duplicate copies of the same process document across both locations.
