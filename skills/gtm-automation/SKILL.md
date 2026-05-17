---
name: gtm-automation
description: Use for V.Two GTM automation across Work Vault/02 - GTM, including content ops, LinkedIn draft/post workflows, campaign research, SEO/GEO, outbound planning, and measurement. Requires approval before posting, messaging, scraping, credential use, or external automation.
---

# GTM Automation Skill

## Purpose
Run V.Two GTM workflows from the Vault without loading every marketing note or third-party repo by default.

This is the portable orchestration skill. It may point to a local GTM workspace, but it must not contain local notes, campaign details, post copy, prospect data, credentials, internal links, or private metrics.

Public-safe rules live in `docs/gtm-orchestration.md`.

## Canonical Workspace
`<vault-root>/Work Vault/02 - GTM`

Start with:
1. `CLAUDE.md`
2. `CLAUDE_GTM.md`
3. `_GTM.md`
4. The specific campaign, website, content, or prompt file needed for the task.

## Reference Sources
Use these only when installed locally and the task needs the pattern:
- `staging/private/reference-sources/gtm/ai-marketing-skills`
- `staging/private/reference-sources/gtm/OpenOutreach`
- `Work Vault/02 - GTM/_Marketing Prompts`
- `Work Vault/02 - GTM/_Skills`

Do not bulk-load these directories.

Do not port files from `Work Vault/02 - GTM` into `oliver-local`.

## Workflow Modes

### Research Mode
Use for competitor research, audience research, GEO/SEO, citation source finding, ICP refinement, content gap analysis, and campaign strategy.

Outputs:
- research brief;
- source list;
- recommendation;
- next action.

### Content Ops Mode
Use for LinkedIn drafts, company posts, blog outlines, content sets, weekly briefs, content calendar updates, and quality review.

Outputs:
- channel-ready drafts;
- content metadata;
- posting instructions;
- measurement tags;
- approval status.

### Outbound Planning Mode
Use for ICP, lead dossier, outreach strategy, segmentation, message templates, and CRM update planning.

Outputs:
- target segment;
- lead source plan;
- qualification criteria;
- draft outreach;
- compliance and opt-out checklist.

### Automation Mode
Use only after explicit approval for external tool actions.

Allowed after approval:
- schedule or draft internal content artifacts;
- run local scripts against approved files;
- prepare import files for approved tools.

Requires separate explicit approval:
- LinkedIn login use;
- browser automation;
- scraping;
- connection requests;
- DMs/follow-ups;
- posting to LinkedIn or company pages;
- uploading contact data to third-party services;
- using OpenOutreach or similar automation.

## Required Guardrails
- No public post without user approval.
- No outbound message without user approval.
- No scraping or LinkedIn automation without user approval.
- No credential handling unless `security-review` is loaded.
- Respect opt-out and do-not-contact records.
- Preserve existing GTM tracker data; append or candidate-write unless explicitly told to replace.
- If using OpenOutreach patterns, default to local/self-hosted concepts and keep data under private staging until approved.

## Quality Bar
Every GTM deliverable must include:
- audience;
- objective;
- channel;
- CTA or next action;
- measurement method;
- approval state.

For LinkedIn content, also include:
- author/account;
- post type;
- scheduled window;
- copy;
- link/image needs;
- amplification note.

## Source-Inspired Patterns
From `ai-marketing-skills`, prefer:
- content expert-panel scoring;
- growth experiment hypothesis/variant/metric structure;
- outbound ICP and lead-pipeline separation;
- SEO/GEO content attack briefs;
- revenue attribution and measurement loops;
- PII/security scan before public or outbound use.

From `OpenOutreach`, prefer:
- campaign objective plus target market as the minimum campaign seed;
- lead lifecycle states;
- qualification before contact;
- rate-limit awareness;
- local data ownership;
- human approval before account automation.

Do not copy third-party code into active projects unless the user explicitly asks for implementation.
