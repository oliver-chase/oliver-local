# oliver-local

`oliver-local` is the current sanitized map of the live `/Users/oliver` workspace.

It is meant to recreate the old `OliverRepo` intent using the current machine state:
- document the real local operating structure
- preserve stable orchestration files and cross-agent docs
- record project repo structure without duplicating full app repos
- keep runtime state, secrets, auth, caches, logs, and other machine-private artifacts out of git

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
|  |- shared/
|  `- skills/
|     |- gstack/             canonical Garry Tan toolkit
|     |- <aliases>           top-level links into gstack for overlapping skills
|     |- browser-qa/
|     |- codebase-onboarding/
|     |- context-budget/
|     |- devextreme/
|     |- e2e-testing/
|     |- security-review/
|     |- imagegen/
|     |- openai-docs/
|     |- plugin-creator/
|     |- skill-creator/
|     `- skill-installer/
|- .codex                     Codex runtime
|  |- memories/
|  `- skills/.system/
|- projects/
|  |- tesknota/
|  |- ops-dashboard/
|  |- v-two-sdr/
|  `- fallow/
|- dotfiles/
|- claude-push/
`- tesknota-audit/
```

## What Is Included

- Sanitized workspace and repo structure docs in [docs/workspace-tree.md](docs/workspace-tree.md) and [docs/project-repos.md](docs/project-repos.md)
- Current Claude skill-layer explanation in [docs/skills.md](docs/skills.md)
- Stable orchestration files mirrored under [snapshot/.claude](snapshot/.claude)
- Selected Codex memory under [snapshot/.codex](snapshot/.codex)

## What Is Deliberately Not Duplicated

- Full contents of `~/projects/*`, because each project already has its own Git repo
- Full vendored `gstack` source tree, because it is already the canonical skill toolkit inside `~/.claude/skills/gstack`
- Runtime-only Claude and Codex state such as sessions, caches, telemetry, logs, sqlite DBs, auth files, and shell snapshots
- Secret material or machine-private credentials

## Current Skill Model

- `~/.claude/skills/gstack` is the canonical source for overlapping Garry Tan skills
- top-level overlapping skill names in `~/.claude/skills/` are aliases into `gstack`
- local-only Claude skills remain top-level
- Codex system skills were imported into the Claude skill layer as top-level additions

See [docs/skills.md](docs/skills.md) for the current map.
