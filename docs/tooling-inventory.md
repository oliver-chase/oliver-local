# Tooling Inventory

## Active Core Runtimes

- `~/oliver-local`: shared orchestration root.
- `.claude`: Claude runtime adapter + state.
- `.codex`: Codex runtime adapter + state.
- `.agents`: agent-runtime adapters + state.

`~/.claude` must not be a separate Git checkout for shared orchestration. Its shared-facing directories are adapter links into `~/oliver-local`.

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

## Runtime Adapter Links

- `~/.claude/docs` -> `~/oliver-local/docs`
- `~/.claude/scripts` -> `~/oliver-local/scripts`
- `~/.claude/shared` -> `~/oliver-local/shared`
- `~/.claude/personas` -> `~/oliver-local/personas`
- `~/.claude/identity` -> `~/oliver-local/identity`
- `~/.claude/skills` -> `~/oliver-local/skills`
- `~/.codex/skills/story-lifecycle-gate` -> `~/oliver-local/skills/story-lifecycle-gate`

## Duplication Policy

- Product behavior/process docs: keep in each product repo.
- Cross-project agent rules: keep in `~/oliver-local/shared/*`.
- Shared skills/tools: keep in `~/oliver-local/skills/*`.
- Do not maintain duplicate copies of the same process document across both locations.
