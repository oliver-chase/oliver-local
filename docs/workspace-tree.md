# Workspace Tree

Sanitized map of the live `/Users/oliver` workspace. Updated 2026-04-24.

```text
/Users/oliver
|- .claude                    Claude runtime + tracked orchestration layer
|- oliver-local -> .claude    canonical git command alias
|- .codex                     Codex runtime
|- .gstack                    gstack browser agent runtime
|- projects/
|  |- tesknota/
|  |- oliver-app/
|  |- v-two-sdr/
|  |- fallow/
|  `- prompt-lint/ (local utility, non-git)
|- references/
|- dotfiles/
|- claude-push/
`- tesknota-audit/             standalone audit workspace for tesknota
```

## Notes

- `~/.claude` is the active orchestration checkout and Claude runtime
- `~/.codex` is a separate runtime, not nested inside Claude
- `~/.gstack` is an MCP tool runtime
- `~/projects/*` contains the real product repos
- `~/oliver-local` points to `~/.claude` to avoid duplicate checkouts
