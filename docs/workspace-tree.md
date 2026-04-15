# Workspace Tree

Sanitized snapshot of the live `/Users/oliver` layout. Updated 2026-04-15.

Intentionally structural, not exhaustive. Secret files, auth material, caches, logs, telemetry, sessions, sqlite state, and other runtime-only artifacts are omitted.

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
|- .codex                     Codex runtime
|  |- memories/
|  |- skills/
|  `- config.toml
|- .gstack                    gstack browser agent runtime
|- .serena                    Serena MCP runtime
|- CLAUDE.md
|- claude-push/               git repo for pushing claude state
|- dotfiles/
|- main/
|- oliver-local/              this repo — workspace map and orchestration docs
|- projects/
|  |- fallow/
|  |- ops-dashboard/
|  |- tesknota/
|  `- v-two-sdr/
|- sync-repos.sh
`- tesknota-audit/            standalone audit workspace for tesknota
```

## Notes

- `~/.claude` is the active orchestration checkout and Claude runtime
- `~/.codex` is a separate runtime, not nested inside Claude
- `~/.gstack` and `~/.serena` are MCP tool runtimes
- `~/projects/*` contains the real product repos
- `oliver-local` captures the operating structure and selected stable orchestration files, not a second copy of every repo
