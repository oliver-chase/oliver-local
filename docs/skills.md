# Claude Skills

Updated 2026-04-24.

`~/oliver-local/skills` is the canonical shared skill layer for this system. Runtime adapters reference these shared skills.

Workflow trigger routing is defined separately in `shared/workflows/*.md`.
If a plain-language trigger term and a skill alias collide (for example, `qa`), pause and surface the conflict before proceeding.

## Canonical gstack aliases

```text
autoplan -> gstack/autoplan
benchmark -> gstack/benchmark
browse -> gstack/browse
canary -> gstack/canary
careful -> gstack/careful
checkpoint -> gstack/checkpoint
codex -> gstack/codex
connect-chrome -> gstack/connect-chrome
cso -> gstack/cso
design-consultation -> gstack/design-consultation
design-html -> gstack/design-html
design-review -> gstack/design-review
design-shotgun -> gstack/design-shotgun
devex-review -> gstack/devex-review
document-release -> gstack/document-release
freeze -> gstack/freeze
gstack-upgrade -> gstack/gstack-upgrade
guard -> gstack/guard
health -> gstack/health
investigate -> gstack/investigate
land-and-deploy -> gstack/land-and-deploy
learn -> gstack/learn
office-hours -> gstack/office-hours
open-gstack-browser -> gstack/open-gstack-browser
pair-agent -> gstack/pair-agent
plan-ceo-review -> gstack/plan-ceo-review
plan-design-review -> gstack/plan-design-review
plan-devex-review -> gstack/plan-devex-review
plan-eng-review -> gstack/plan-eng-review
qa -> gstack/qa
qa-only -> gstack/qa-only
retro -> gstack/retro
review -> gstack/review
setup-browser-cookies -> gstack/setup-browser-cookies
setup-deploy -> gstack/setup-deploy
ship -> gstack/ship
unfreeze -> gstack/unfreeze
```

## Local-only Claude skills

```text
browser-qa/
codebase-onboarding/
context-budget/
devextreme/
e2e-testing/
security-review/
supabase/
supabase-postgres-best-practices/
cmo/
marketing/
work-outreach/
debug-issue.md
doc-audit.md
explore-codebase.md
mem-sync.md
refactor-safely.md
review-changes.md
```

## Imported Codex system skills

```text
imagegen/
openai-docs/
plugin-creator/
skill-creator/
skill-installer/
nextjs-advanced-routing/
nextjs-anti-patterns/
nextjs-app-router-fundamentals/
nextjs-client-cookie-pattern/
nextjs-dynamic-routes-params/
nextjs-pathname-id-fetch/
nextjs-scaffold/
nextjs-server-client-components/
nextjs-server-navigation/
nextjs-use-search-params-suspense/
vercel-ai-sdk/
```
