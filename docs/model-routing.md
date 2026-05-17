# Model Routing

Purpose: public-safe model/tool switching rules for Oliver Local installs.

## Principle
Switching is rules-based, scoped, and logged. It is not "always use the strongest model."

## Routing Targets

| Target | Use For | Do Not Use For |
|---|---|---|
| Codex | orchestration, policy enforcement, repo edits, validation, structured handoff | unattended social posting, credential decisions |
| Claude Code | implementation, refactor, code review, project work | source-of-truth policy changes without handoff updates |
| Claude Cowork | planning, summaries, handoff packaging | shell/file operations |
| Dify | repeatable deployed workflows, UI/API automation, RAG, observability | raw credential storage without private policy |
| Ollama/local | private summarization, classification, draft compaction, offline fallback | final code/security/deployment decisions |
| gstack | QA/review/ship/design workflow overlays | startup context or always-on mode |

## Trigger Rules

Switch or recommend switch only when:
- active tool lacks required capability;
- context exceeds hard threshold;
- same atomic step fails repeatedly;
- cost/latency pressure crosses threshold;
- user explicitly requests a tool/model;
- workflow needs deployment/observability, making Dify the right surface.

## Not Codex Direct
Codex is one execution target. It should not be the only router.

The router is the orchestration control plane:
- startup file;
- handoff state;
- tool capability map;
- model switch policy;
- logged decisions.

Codex can execute the routing decision when it is the active agent, but it should not silently switch accounts/models/tools without the policy trail.

## Practical Use

For local installs, keep a small evaluator or checklist that emits:
- active tool/model;
- required operation;
- trigger;
- recommended target;
- final action;
- rationale.

Then update handoff before changing tools.

## GTM Defaults

For GTM automation:
- use Dify for repeatable workflows and API endpoints;
- use local/Ollama for safe summarization/classification;
- use frontier models for final content judgment when quality matters;
- use OpenOutreach-style automations only after explicit approval;
- use Codex/Claude to edit files and generate specs.
