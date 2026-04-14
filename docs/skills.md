# Claude Skills

The live Claude skill layer now treats `~/.claude/skills/gstack` as canonical for overlapping Garry Tan skills. Top-level duplicates were replaced with aliases into that vendored toolkit. Unique local skills and imported Codex system skills remain top-level additions.

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
browser-qa
codebase-onboarding
context-budget
debug-issue.md
devextreme
e2e-testing
explore-codebase.md
refactor-safely.md
review-changes.md
security-review
```

## Imported Codex system skills

```text
imagegen
openai-docs
plugin-creator
skill-creator
skill-installer
```
