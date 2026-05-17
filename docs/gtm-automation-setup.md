# GTM Automation Setup

Purpose: deterministic setup path when the user says "set up all GTM automations."

This file is public-safe. It defines the automation architecture and gates, not private campaign content.

## Inputs To Discover Locally
An installed workspace should provide local equivalents of:
- GTM workspace root;
- brand voice;
- campaigns/offers;
- content repo/calendar;
- website/SEO/GEO docs;
- CRM/prospect source;
- metrics framework;
- approval owner;
- available API keys and logged-in tools.

Do not assume these exist. Discover them through local folder overlays and ask only for missing blockers.

## Automation Stack

### 1. Vault Orchestration
Use `skills/gtm-automation/SKILL.md` and the local GTM overlay to decide what to do.

Owns:
- source-of-truth routing;
- draft/candidate outputs;
- approval gates;
- local note updates.

### 2. Dify Workflow Layer
Use Dify when repeatable GTM workflows need a UI, API endpoint, RAG, model/provider switching, logs, and workflow monitoring.

Good Dify candidates:
- content brief generator;
- LinkedIn post draft scorer;
- SEO/GEO audit assistant;
- lead dossier builder;
- weekly GTM brief generator;
- research intake to campaign brief;
- content repurposing workflow.

Do not put LinkedIn credentials or prospect lists into Dify until a private data policy is approved.

### 3. AI Marketing Skills Patterns
Use as implementation patterns for:
- growth experiments;
- content expert-panel scoring;
- outbound ICP and lead pipeline;
- SEO/GEO content briefs;
- revenue attribution;
- PII/safety scans.

Install individual pieces only when a workflow needs them.

### 4. OpenOutreach Patterns
Use as architecture reference for:
- campaign seed = product description + target market;
- generated search queries;
- lead lifecycle states;
- qualification before contact;
- rate limits;
- local CRM ownership.

Do not run LinkedIn automation by default.

## Setup Sequence

1. Load local GTM overlay.
2. Inventory local GTM sources.
3. Produce an automation map with these columns:
   - workflow;
   - source files;
   - trigger;
   - output;
   - tool owner;
   - approval gate;
   - risk level;
   - metric.
4. Split workflows into three classes:
   - safe local automation;
   - approval-gated external automation;
   - prohibited until credentials/compliance are reviewed.
5. Create candidate workflow specs.
6. Ask user to approve which specs to implement.
7. Implement only approved specs.
8. Log setup actions.

## Safe Local Automations
Can usually be created without extra approval:
- content inventory;
- weekly brief draft;
- post copy scoring;
- SEO/GEO audit draft;
- research brief generation;
- content calendar candidate rows;
- lead dossier draft from approved data;
- metrics summary from local exports.

## Approval-Gated Automations
Require explicit approval:
- Dify app deployment;
- API key configuration;
- Google Workspace write actions;
- LinkedIn/browser automation;
- CRM/prospect imports;
- outbound message generation at scale;
- scheduled posting.

## Prohibited By Default
Do not run without explicit user approval and security review:
- LinkedIn login/session use;
- scraping;
- connection requests;
- DMs/follow-ups;
- automatic posting;
- third-party upload of prospect data;
- OpenOutreach daemon against a live account.

## Model Routing
Use `docs/model-routing.md`.

Default:
- local/Ollama for low-risk summarization or compaction;
- Codex for orchestration and policy enforcement;
- Claude/Codex implementation tools for file edits and tests;
- Dify for deployed workflow execution and observability;
- frontier model for final review/security/deployment decisions.

## Output Contract
When setup is complete, produce:
- workflow map;
- implemented workflows;
- credentials still needed;
- approval gates;
- how to run each workflow;
- rollback/disable instructions;
- validation results.
