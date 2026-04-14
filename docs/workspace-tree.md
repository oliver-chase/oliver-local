# Workspace Tree

Sanitized snapshot of the live `/Users/oliver` layout on `2026-04-14`.

This is intentionally structural rather than exhaustive. Secret files, auth material, caches, logs, telemetry, sessions, sqlite state, and other runtime-only artifacts are omitted.

```text
/Users/oliver
|- .claude
|  |- CLAUDE.md
|  |- README.md
|  |- .gitignore
|  |- config.json
|  |- commands/
|  |- docs/
|  |- hooks/
|  |- identity/
|  |- personas/
|  |- shared/
|  `- skills/
|- .codex
|  |- memories/
|  |- skills/
|  `- config.toml
|- .gstack
|- .serena
|- CLAUDE.md
|- claude-push/
|- dotfiles/
|- main/
|- oliver-local/
|- projects/
|  |- fallow/
|  |- ops-dashboard/
|  |- tesknota/
|  `- v-two-sdr/
|- sync-repos.sh
`- tesknota-audit/
```

## Notes

- `~/.claude` is the active orchestration checkout and Claude runtime
- `~/.codex` is a separate runtime, not nested inside Claude
- `~/projects/*` contains the real product repos
- `oliver-local` captures the operating structure and selected stable orchestration files, not a second copy of every repo
