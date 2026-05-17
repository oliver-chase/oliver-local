# Skills And Personas Index

Purpose: route to useful capabilities without loading full files by default.

## Load Rule
- Load full skill/persona files only when the task requires them.
- Prefer this index for routing.
- If this index is not specific enough, use `<vault-root>/_Management/Agent Orchestration/manifests/skills_inventory.md` for the complete skill list.
- Use `<vault-root>/_Management/Agent Orchestration/manifests/skill_optimization_audit.md` before adding, merging, or deleting skills.
- Do not paste full skill/persona bodies into handoff docs.
- Treat gstack as one skill family; load only the invoked gstack subskill.
- `.md` files under `skills/` that are not named `SKILL.md` are reference playbooks, not installable/runtime skills.

## Mandatory Efficiency Layer
- `caveman` -> `<vault-root>/_Management/Agent Orchestration/staging/private/runtime-state/.agents/skills/caveman/SKILL.md`
  - Upstream: `https://github.com/JuliusBrussee/caveman`
  - Apply concise, no-filler technical communication at startup.
  - Load full Caveman skill files only for explicit Caveman commands or workflows.
- `caveman-commit`, `caveman-review`, `caveman-compress`, `caveman-stats`, `cavecrew`
  - Available under `staging/private/runtime-state/.agents/skills/`.
  - Use only when the task invokes that specialized workflow.

## Core Skill Families
- `gstack` -> `skills/gstack/SKILL.md`
  - Optional workflow overlay, not an app dependency or startup layer.
  - Use after repo-native scripts/docs for browser QA, product/design reviews, shipping, canary checks, security review, retrospectives, and plan review.
  - Load subskills such as `gstack/qa`, `gstack/review`, `gstack/ship`, or `gstack/autoplan` only when invoked.
  - Large generated family. Never load gstack as a startup default.
- `nextjs-*` -> `skills/nextjs-*/SKILL.md`
  - Active project repos include Next.js apps, so keep these available.
  - Use for Next.js App Router, server/client components, routing, cookies, pathname/search params, and scaffolding.
  - Large reference family. Load the narrowest matching pattern file only.
- `openai-docs` -> `skills/openai-docs/SKILL.md`
  - Use for current OpenAI API/product documentation.
- `gtm-automation` -> `skills/gtm-automation/SKILL.md`
  - Use for V.Two GTM content ops, LinkedIn draft workflows, SEO/GEO, outbound planning, and marketing automation.
  - Requires approval before posting, LinkedIn automation, scraping, prospect messages, credential use, or external uploads.
  - Portable routing rules: `docs/gtm-orchestration.md`.
- `skill-creator` / `skill-installer` / `plugin-creator`
  - Use for creating or installing reusable Codex/agent capabilities.

## Local Shared Skills
- `browser-qa` -> `skills/browser-qa/SKILL.md`
- `codebase-onboarding` -> `skills/codebase-onboarding/SKILL.md`
- `context-budget` -> `skills/context-budget/SKILL.md`
- `debug-issue` -> `skills/debug-issue.md`
- `doc-audit` -> `skills/doc-audit.md`
- `e2e-testing` -> `skills/e2e-testing/SKILL.md`
- `explore-codebase` -> `skills/explore-codebase.md`
- `full-qa-standard` -> `skills/full-qa-standard/SKILL.md`
- `marketing` -> `skills/marketing/SKILL.md`
- `mem-sync` -> `skills/mem-sync.md`
- `refactor-safely` -> `skills/refactor-safely.md`
- `review-changes` -> `skills/review-changes.md`
- `security-review` -> `skills/security-review/SKILL.md`
- `story-lifecycle-gate` -> `skills/story-lifecycle-gate/SKILL.md`
- `vercel-ai-sdk` -> `skills/vercel-ai-sdk/SKILL.md`
- `work-outreach` -> `skills/work-outreach/SKILL.md`

## Personas
- `architect` -> `personas/architect/persona_soul.md`
- `dev` -> `personas/dev/persona_soul.md`
- `fe-designer` -> `personas/fe-designer/persona_soul.md`
- `marketing` -> `personas/marketing/persona_soul.md`
- `gtm-operator` -> `personas/gtm-operator/persona_soul.md`
- `sdr` -> `personas/sdr/persona_soul.md`
- `tester` -> `personas/tester/persona_soul.md`

## Routing Notes
- Use `personas/marketing/config.json` for marketing workspace pointers.
- Use `personas/sdr/config.json` for SDR workspace pointers.
- For project-specific context, load the project repo or `Oliver/<Project>` notes, not all personas.
- For token pressure, load `skills/context-budget/SKILL.md` before loading broad skill families.
- For env/auth/secrets/public-release work, load `skills/security-review/SKILL.md`.
- For story/backlog hygiene, load `skills/story-lifecycle-gate/SKILL.md`.
