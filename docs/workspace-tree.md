# Workspace Tree

Current live structure for `/Users/oliver`.

```text
/Users/oliver
|- .claude                     Claude orchestration repo + runtime
|- oliver-local -> /Users/oliver/.claude
|- .codex                      Codex runtime
|- .agents                     shared local skill packs
|- projects/
|  |- oliver-app/
|  |- tesknota/
|  |- v-two-sdr/
|  |- fallow/
|  `- prompt-lint/             local utility (non-git)
|- references/
|- dotfiles/
`- claude-push/
```

## Notes

- `oliver-local` is an alias, not a separate checkout.
- `.codex` and `.claude` are sibling runtimes with separate state.
- Project source-of-truth lives only in `~/projects/*` repositories.
