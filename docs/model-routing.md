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
| Gemini CLI | large-context review, search-grounded research, alternate-model second opinion, scripted analysis | secret-bearing work without approval |
| gstack | QA/review/ship/design workflow overlays | startup context or always-on mode |

## Runtime Classes

Human-operated runtimes:
- Codex
- Claude Code
- Claude Cowork

These do not silently switch into each other. If the current runtime is wrong, the agent should update handoff and tell the user where to continue.

Callable adapters:
- Gemini CLI
- Ollama/local
- Dify
- Budibase

These can be invoked by the active runtime when installed and policy allows it. Adapter output is advisory unless explicitly promoted by the workflow.

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

If the target is Claude Code, Claude Cowork, or Codex, the action is a human handoff.

If the target is Gemini CLI, Ollama, Dify, or Budibase, the action can be an adapter invocation inside the active session.

## Model Strength Inside A Runtime

Tool/runtime routing and model strength are separate decisions.

After choosing the runtime, choose the cheapest model tier that can do the work:

| Runtime | Cheap | Balanced | Strong | Deep / Max |
|---|---|---|---|---|
| Codex | `gpt-5.4-mini` + low effort | `gpt-5.4` + medium | `gpt-5.5` + high | `gpt-5.5` + xhigh |
| Claude | `haiku` + low | `sonnet` + medium | `sonnet` + high | `opus` + xhigh/max |
| Gemini CLI | `flash-lite` | `auto` | `pro` | `pro` |
| Ollama | small local model | mid local model | large local model if installed | not preferred unless privacy/offline dominates |

Escalate model tier for:
- security-sensitive work;
- multi-file refactors;
- architecture decisions;
- repeated failure;
- ambiguous requirements.

De-escalate after the hard reasoning phase when the task becomes mechanical.

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
