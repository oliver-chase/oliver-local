# Local Runtime Setup

Purpose: define optional host tools without making them startup requirements.

## Rule
Runtime tools are opt-in adapters. Do not install, start, or authenticate them automatically.

Use the orchestration control plane to decide when an adapter is useful, then log the decision when it affects output.

## Gemini CLI
Use for:
- large-context second-opinion review;
- Google Search-grounded research;
- scripted non-interactive analysis;
- multimodal or Google ecosystem tasks.

Setup options:
- ad hoc: `npx @google/gemini-cli`
- persistent: `npm install -g @google/gemini-cli@latest`

Guardrails:
- no secret-bearing prompts without approval;
- no automatic writes into Vault or repos;
- no use as final authority for security, deployment, legal, or financial decisions.

## Ollama
Use for:
- local/private summaries;
- low-risk classification;
- context compaction;
- offline fallback.

Recommended operating mode:
- local-only;
- candidate text only;
- no direct file writes;
- no final decision authority.

## Dify
Use for:
- repeatable AI workflows;
- RAG over approved documents;
- workflow APIs;
- observability.

Keep Dify as a platform adapter, not a GTM-only tool.

## Budibase
Use for:
- internal admin apps;
- approval queues;
- dashboards;
- lightweight operations UI.

Budibase is useful when a human review surface is needed for automations, especially social posting, outbound, source review, or project-cleanup queues.

## Update Model
Runtime adapters follow the same lifecycle as skills:
1. check upstream;
2. stage candidate;
3. run security scan;
4. write manifest;
5. promote only after review.

No background updater may change active runtime behavior.
