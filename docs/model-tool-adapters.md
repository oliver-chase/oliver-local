# Model And Tool Adapters

Purpose: decide when to use external model CLIs and local models.

## Gemini CLI
Use Gemini CLI for:
- large-context review;
- Google Search-grounded research;
- alternate-model second opinion;
- non-interactive scripted analysis;
- multimodal or Google ecosystem tasks when configured.

Reference: `google-gemini/gemini-cli`.

Guardrails:
- no secret-bearing prompts unless explicitly approved;
- no file writes unless active tool policy permits;
- log second-opinion decisions in handoff when they affect work.

## Ollama
Use Ollama for:
- private summarization;
- local classification;
- context compaction;
- offline fallback.

Guardrails:
- not final authority;
- no direct writes;
- no security/deployment decision authority.

## Codex
Use Codex for:
- repo edits;
- orchestration;
- validation;
- policy enforcement;
- structured handoff.

Codex is not the model-switch router by itself. The control plane is the router.

## Dify
Use Dify when a workflow needs:
- UI;
- API;
- logs;
- RAG;
- deployed repeatability.
