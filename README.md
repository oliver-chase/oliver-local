# oliver-local

Sanitized map of the live `/Users/oliver` workspace. Updated 2026-04-24.

- documents the real local operating structure
- preserves stable orchestration files and cross-agent docs
- records project repo structure without duplicating full app repos
- keeps runtime state, secrets, auth, caches, logs, and other machine-private artifacts out of git

Checked out at `~/.claude` with canonical Git command path `~/oliver-local` (symlink alias).

## Quick Structure

```text
/Users/oliver
|- .claude                    Claude runtime + tracked orchestration layer
|- oliver-local -> .claude    canonical git command alias
|- .codex                     Codex runtime
|- .gstack                    gstack browser agent runtime
|- projects/
|  |- tesknota/
|  |- oliver-app/
|  |- ops-dashboard/
|  |- v-two-sdr/
|  |- fallow/
|  `- prompt-lint/ (local utility, non-git)
|- references/
|- dotfiles/
|- claude-push/
`- tesknota-audit/
```

## What Is Included

- Sanitized workspace and repo structure in [docs/workspace-tree.md](docs/workspace-tree.md) and [docs/project-repos.md](docs/project-repos.md)
- Current Claude skill-layer map in [docs/skills.md](docs/skills.md)

## What Is Deliberately Not Duplicated

- Full contents of `~/projects/*` - each project has its own Git repo
- Full vendored `gstack` source tree - canonical inside `~/.claude/skills/gstack`
- Runtime-only Claude and Codex state: sessions, caches, telemetry, logs, sqlite DBs, auth files, shell snapshots
- Secret material or machine-private credentials
- Local runtime scratch artifacts under `~/ide` and `~/plans`

## Current Skill Model

- `~/.claude/skills/gstack` is the canonical source for overlapping gstack skills
- Top-level overlapping skill names in `~/.claude/skills/` are aliases into `gstack`
- Local-only Claude skills remain top-level
- Codex system skills were imported into the Claude skill layer as top-level additions

See [docs/skills.md](docs/skills.md) for the full map.

## Key Docs

- [Architecture](docs/architecture.md)
- [Project Repos](docs/project-repos.md)
- [Skills](docs/skills.md)
- [Workspace Tree](docs/workspace-tree.md)
- [Repo Map](shared/repo-map.json)
- [Workflow Standards](shared/workflow-standards.md)
- [Workflow Procedures](shared/workflows/)
