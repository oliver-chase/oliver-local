# Workspace Tree

Sanitized snapshot of the live `/Users/oliver` layout. Updated 2026-04-24.

Intentionally structural, not exhaustive. Secret files, auth material, caches, logs, telemetry, sessions, sqlite state, and other runtime-only artifacts are omitted.

```text
/Users/oliver
|- .claude                    Claude runtime + tracked orchestration layer
|- oliver-local -> .claude    this repo alias path
|- .codex                     Codex runtime
|  |- memories/
|  |- skills/
|  `- config.toml
|- .gstack                    gstack browser agent runtime
|- CLAUDE.md
|- claude-push/               git repo for pushing claude state
|- dotfiles/
|- main/
|- projects/
|  |- fallow/
|  |- oliver-app/
|  |- prompt-lint/           local utility workspace (non-git)
|  |- tesknota/
|  `- v-two-sdr/
|- references/               upstream references and templates
|- sync-repos.sh
`- tesknota-audit/            standalone audit workspace for tesknota
```

## Notes

- `~/.claude` is the active orchestration checkout and Claude runtime
- `~/.codex` is a separate runtime, not nested inside Claude
- `~/.gstack` is an MCP tool runtime
- `~/projects/*` contains the real product repos
- `~/oliver-local` points to `~/.claude` to avoid duplicate checkouts
- `~/references`, `~/tesknota-audit`, and `~/claude-push` are intentional auxiliary directories
