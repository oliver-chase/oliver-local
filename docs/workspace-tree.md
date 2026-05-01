# Workspace Tree

Current live structure for `/Users/oliver`.

```text
/Users/oliver
|- oliver-local/               shared orchestration repo
|- .claude                     Claude runtime adapter + state
|- .codex                      Codex runtime adapter + state
|- .agents                     agent-runtime adapters + state
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

- `oliver-local` is the shared orchestration checkout.
- `.claude`, `.codex`, and `.agents` are sibling runtimes with separate state.
- Project source-of-truth lives only in `~/projects/*` repositories.
