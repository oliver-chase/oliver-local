# GTM Orchestration

Purpose: portable GTM operating rules for Oliver Local installs.

This file is public-safe. It must not contain campaign notes, private contacts, account credentials, post copy, client details, or internal metrics.

## Portable Runtime Pieces
- `skills/gtm-automation/SKILL.md`
- `personas/gtm-operator/persona_soul.md`
- `personas/marketing/persona_soul.md`
- `personas/sdr/persona_soul.md`

## Local-Only Pieces
Each install may have its own local GTM workspace. For Kiana's Vault, that workspace is:

`Work Vault/02 - GTM`

Local-only files may include:
- campaign notes;
- content calendars;
- weekly briefs;
- LinkedIn drafts;
- CRM/prospect data;
- Google Sheet links;
- Drive links;
- metrics;
- posting status;
- internal brand guidance.

Do not copy local-only notes into this repo.

## Skill Routing
Use `gtm-automation` when work involves:
- campaign strategy;
- LinkedIn content drafting;
- content calendar operations;
- weekly brief generation;
- SEO/GEO research;
- lead dossier or outbound planning;
- marketing automation;
- measurement summaries.

Use `marketing` for broader brand, positioning, and content judgment.

Use `work-outreach` or `sdr` for prospecting, outreach sequence, opt-out, and CRM workflows.

## Automation Boundary
Allowed without extra approval:
- research;
- draft generation;
- content scoring;
- calendar candidate updates;
- campaign planning;
- SEO/GEO audits;
- lead dossier drafts;
- outbound sequence drafts;
- measurement summaries.

Requires explicit approval:
- LinkedIn posting;
- LinkedIn login/session use;
- scraping;
- connection requests;
- DMs or follow-up messages;
- importing/exporting prospect data to external tools;
- browser automation against logged-in social accounts.

## External Reference Patterns
Reference only; do not auto-run:
- `ericosiu/ai-marketing-skills`: content ops, outbound, SEO, growth experiments, revenue intelligence, privacy/safety patterns.
- `eracle/OpenOutreach`: self-hosted LinkedIn lead discovery, qualification, CRM state, and follow-up architecture.

Use these as patterns, not as startup context.

## Required Output Contract
Every GTM deliverable should state:
- audience;
- objective;
- channel;
- CTA or next action;
- measurement method;
- approval state.

For LinkedIn:
- author/account;
- post type;
- scheduled window;
- copy;
- link/image needs;
- amplification note.
