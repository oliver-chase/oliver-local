# Claude Orchestration Entry

- Runtime root: `~/.claude`
- Shared system root: `<vault-root>/Oliver/_Project Repos/oliver-local`
- Shared docs: `<vault-root>/Oliver/_Project Repos/oliver-local/docs`
- Shared workflows: `<vault-root>/Oliver/_Project Repos/oliver-local/shared/workflows`
- Shared scripts/gates: `<vault-root>/Oliver/_Project Repos/oliver-local/scripts`
- Shared skills: `<vault-root>/Oliver/_Project Repos/oliver-local/skills`
- Skill/persona index: `<vault-root>/Oliver/_Project Repos/oliver-local/docs/skills-personas-index.md`

Startup baseline:
- Read `<vault-root>/_Management/Agent Orchestration/AGENT_START.md`.
- Caveman brevity is always on.
- Progressive disclosure is always on.
- Security/write policy is always on for env, auth, Git, publish, or file movement work.
- Do not preload all skills or policies. Use the context index, then load the smallest matching file.

Claude runtime files stay in `~/.claude`. Canonical shared orchestration assets live in `<vault-root>/Oliver/_Project Repos/oliver-local`.
