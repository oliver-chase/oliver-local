# Workspace Tree

Current live structure for `~`.

```text
~
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
|- references/                 external templates/reference repos
|- dotfiles/                   machine shell/config repo
`- claude-push/                Claude permission push-notification helper
```

## Notes

- `oliver-local` is the shared orchestration checkout.
- `.claude`, `.codex`, and `.agents` are sibling runtimes with separate state.
- Project source-of-truth lives only in `~/projects/*` repositories.
- `references` is read-only reference material unless explicitly promoted into a project or shared skill.
- `dotfiles` is machine configuration, not orchestration policy.
- `claude-push` is helper automation for Claude permission notifications, not a shared orchestration root.
