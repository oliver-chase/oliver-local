# oliver-local

Sanitized map of the live `/Users/oliver` workspace. Updated 2026-04-15.

- documents the real local operating structure
- preserves stable orchestration files and cross-agent docs
- records project repo structure without duplicating full app repos
- keeps runtime state, secrets, auth, caches, logs, and other machine-private artifacts out of git

## Quick Structure

```text
/Users/oliver
|- .claude                    Claude runtime + tracked orchestration layer
|  |- CLAUDE.md
|  |- README.md
|  |- commands/
|  |- docs/
|  |- hooks/
|  |- identity/
|  |- personas/
|  |- plugins/
|  |- shared/
|  `- skills/
|     |- gstack/             canonical gstack toolkit
|     |- <aliases>           top-level links into gstack for overlapping skills
|     |- browser-qa/
|     |- codebase-onboarding/
|     |- context-budget/
|     |- devextreme/
|     |- e2e-testing/
|     |- security-review/
|     |- supabase/
|     |- supabase-postgres-best-practices/
|     |- imagegen/
|     |- openai-docs/
|     |- plugin-creator/
|     |- skill-creator/
|     `- skill-installer/
|- .codex                     Codex runtime
|- .gstack                    gstack browser agent runtime
|- .serena                    Serena MCP runtime
|- projects/
|  |- tesknota/               Next.js 15 + TypeScript + Supabase
|  |- ops-dashboard/          Vanilla JS + Cloudflare Pages + Supabase
|  |- v-two-sdr/              Node.js outreach pipeline
|  `- fallow/                 Early-stage project
|- dotfiles/
|- claude-push/
`- tesknota-audit/
```

## What Is Included

- Sanitized workspace and repo structure in [docs/workspace-tree.md](docs/workspace-tree.md) and [docs/project-repos.md](docs/project-repos.md)
- Current Claude skill-layer map in [docs/skills.md](docs/skills.md)

## What Is Deliberately Not Duplicated

- Full contents of `~/projects/*` — each project has its own Git repo
- Full vendored `gstack` source tree — canonical inside `~/.claude/skills/gstack`
- Runtime-only Claude and Codex state: sessions, caches, telemetry, logs, sqlite DBs, auth files, shell snapshots
- Secret material or machine-private credentials

## Current Skill Model

- `~/.claude/skills/gstack` is the canonical source for overlapping gstack skills
- Top-level overlapping skill names in `~/.claude/skills/` are aliases into `gstack`
- Local-only Claude skills remain top-level
- Codex system skills were imported into the Claude skill layer as top-level additions

See [docs/skills.md](docs/skills.md) for the full map.
