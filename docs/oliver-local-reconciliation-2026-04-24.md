# Oliver-Local Reconciliation (2026-04-24)

Source archive: `/Users/oliver/archives/oliver-local-20260424-094343.tgz`

This compares every non-git file from archived `oliver-local` against `~/.claude` and records reconciliation actions.

## Summary

- Files compared: 86
- Identical: 78
- Different: 8
- Missing in current: 0

## Differing Files and Action

- `CLAUDE.md`: merged archived Commit Rules back in; kept new workflow trigger routing.
- `README.md`: kept newer structure, merged archived "What Is Included" context links.
- `docs/architecture.md`: kept newer runtime model, restored repo remotes table.
- `docs/project-repos.md`: replaced with richer archived version; updated timestamp note to 2026-04-24 reconciliation.
- `docs/skills.md`: kept newer narrative and conflict note; restored missing local skill entries from archive.
- `docs/workspace-tree.md`: updated to actual current state (removed .serena, oliver-local -> .claude symlink).
- `settings.json`: additive merge; restored code-review-graph PostToolUse and SessionStart hooks while keeping newer statusLine/effortLevel/plugin state.
- `shared/workflow-standards.md`: kept newer trigger routing and testing baseline additions from 2026-04-24.

## File-by-File Mapping

| File | Status |
|---|---|
| `.gitignore` | identical |
| `CLAUDE.md` | reconciled (different) |
| `README.md` | reconciled (different) |
| `commands/rewrite.md` | identical |
| `config.json` | identical |
| `docs/architecture.md` | reconciled (different) |
| `docs/project-repos.md` | reconciled (different) |
| `docs/skills.md` | reconciled (different) |
| `docs/workspace-tree.md` | reconciled (different) |
| `hooks/json-to-toon.mjs` | identical |
| `hooks/package.json` | identical |
| `hooks/src-DZeOumU6.js` | identical |
| `hooks/toon.mjs` | identical |
| `identity/agent_soul.md` | identical |
| `identity/code-review-checklist.md` | identical |
| `identity/default.md` | identical |
| `identity/heartbeat.md` | identical |
| `identity/identity.md` | identical |
| `identity/user.md` | identical |
| `personas/architect/persona_soul.md` | identical |
| `personas/cmo/config.json` | identical |
| `personas/cmo/persona_soul.md` | identical |
| `personas/dev/persona_soul.md` | identical |
| `personas/fe-designer/persona_soul.md` | identical |
| `personas/marketing/config.json` | identical |
| `personas/marketing/persona_soul.md` | identical |
| `personas/sdr/config.json` | identical |
| `personas/sdr/persona_soul.md` | identical |
| `personas/tester/persona_soul.md` | identical |
| `settings.json` | reconciled (different) |
| `shared/repo-map.json` | identical |
| `shared/workflow-standards.md` | reconciled (different) |
| `skills/browser-qa/SKILL.md` | identical |
| `skills/codebase-onboarding/SKILL.md` | identical |
| `skills/context-budget/SKILL.md` | identical |
| `skills/debug-issue.md` | identical |
| `skills/devextreme/SKILL.md` | identical |
| `skills/doc-audit.md` | identical |
| `skills/e2e-testing/SKILL.md` | identical |
| `skills/explore-codebase.md` | identical |
| `skills/imagegen/LICENSE.txt` | identical |
| `skills/imagegen/SKILL.md` | identical |
| `skills/imagegen/agents/openai.yaml` | identical |
| `skills/imagegen/assets/imagegen-small.svg` | identical |
| `skills/imagegen/assets/imagegen.png` | identical |
| `skills/imagegen/references/cli.md` | identical |
| `skills/imagegen/references/codex-network.md` | identical |
| `skills/imagegen/references/image-api.md` | identical |
| `skills/imagegen/references/prompting.md` | identical |
| `skills/imagegen/references/sample-prompts.md` | identical |
| `skills/imagegen/scripts/image_gen.py` | identical |
| `skills/mem-sync.md` | identical |
| `skills/openai-docs/LICENSE.txt` | identical |
| `skills/openai-docs/SKILL.md` | identical |
| `skills/openai-docs/agents/openai.yaml` | identical |
| `skills/openai-docs/assets/openai-small.svg` | identical |
| `skills/openai-docs/assets/openai.png` | identical |
| `skills/openai-docs/references/gpt-5p4-prompting-guide.md` | identical |
| `skills/openai-docs/references/latest-model.md` | identical |
| `skills/openai-docs/references/upgrading-to-gpt-5p4.md` | identical |
| `skills/plugin-creator/SKILL.md` | identical |
| `skills/plugin-creator/agents/openai.yaml` | identical |
| `skills/plugin-creator/assets/plugin-creator-small.svg` | identical |
| `skills/plugin-creator/assets/plugin-creator.png` | identical |
| `skills/plugin-creator/references/plugin-json-spec.md` | identical |
| `skills/plugin-creator/scripts/create_basic_plugin.py` | identical |
| `skills/refactor-safely.md` | identical |
| `skills/review-changes.md` | identical |
| `skills/security-review/SKILL.md` | identical |
| `skills/skill-creator/SKILL.md` | identical |
| `skills/skill-creator/agents/openai.yaml` | identical |
| `skills/skill-creator/assets/skill-creator-small.svg` | identical |
| `skills/skill-creator/assets/skill-creator.png` | identical |
| `skills/skill-creator/license.txt` | identical |
| `skills/skill-creator/references/openai_yaml.md` | identical |
| `skills/skill-creator/scripts/generate_openai_yaml.py` | identical |
| `skills/skill-creator/scripts/init_skill.py` | identical |
| `skills/skill-creator/scripts/quick_validate.py` | identical |
| `skills/skill-installer/LICENSE.txt` | identical |
| `skills/skill-installer/SKILL.md` | identical |
| `skills/skill-installer/agents/openai.yaml` | identical |
| `skills/skill-installer/assets/skill-installer-small.svg` | identical |
| `skills/skill-installer/assets/skill-installer.png` | identical |
| `skills/skill-installer/scripts/github_utils.py` | identical |
| `skills/skill-installer/scripts/install-skill-from-github.py` | identical |
| `skills/skill-installer/scripts/list-skills.py` | identical |
