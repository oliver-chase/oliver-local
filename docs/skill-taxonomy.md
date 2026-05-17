# Skill Taxonomy

Purpose: organize skills by use case without hiding cross-functional skills.

## Principle
Use category tags, not deep folder silos.

A skill may belong to multiple categories. Keep the physical skill path stable and route through this taxonomy.

## Categories

### Orchestration
- startup routing;
- model/tool switching;
- handoff;
- multi-agent dispatch;
- governance.

Examples:
- `context-budget`
- `codebase-onboarding`
- `gstack`
- `cavecrew`

### Development
- implementation;
- debugging;
- refactor;
- tests;
- Next.js;
- Vercel AI SDK.

Examples:
- `nextjs-*`
- `e2e-testing`
- `refactor-safely`
- `debug-issue`

### Review And Security
- code review;
- dependency/security scan;
- secret review;
- PR gates;
- corruption/injection checks.

Examples:
- `security-review`
- `review-changes`
- `gstack/review`
- CodeRabbit code-review pattern

### Context And Memory
- context compression;
- self-learning;
- voice memory;
- handoff restore;
- session summaries.

Examples:
- `context-budget`
- `voice-humanizer`
- `caveman-compress`
- `context-mode` pattern

### Marketing And GTM
- campaigns;
- SEO/GEO;
- content ops;
- outbound planning;
- lead dossiers;
- LinkedIn drafts.

Examples:
- `gtm-automation`
- `marketing`
- `work-outreach`
- `ai-marketing-skills` patterns

### Social And Video
- post scheduling;
- social repurposing;
- video clips;
- captions;
- humanized posts.

Examples:
- `voice-humanizer`
- Postiz agent pattern
- `ai-marketing-skills/video-*` patterns

### Automation Platforms
- workflow UI/API;
- internal tools;
- low-code ops apps;
- RAG/workflow execution.

Examples:
- Dify pattern
- Budibase pattern

### Model And Tool Adapters
- Gemini CLI;
- Ollama;
- Codex auth;
- Dify model providers;
- MCP/tool bridges.

## Routing Rule
When a task crosses categories, load the smallest set:
1. one orchestration/routing skill;
2. one domain skill;
3. one guardrail skill if needed.

Do not load a whole category.
