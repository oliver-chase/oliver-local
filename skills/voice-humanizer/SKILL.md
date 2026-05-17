---
name: voice-humanizer
description: Use to rewrite drafts into the user's learned voice across general writing, GTM, social, documentation, and outreach. Learns from approved examples and updates only small voice rules, not private source text.
---

# Voice Humanizer Skill

## Purpose
Make writing sound like the user while preserving factual accuracy and channel fit.

This skill is inspired by humanizer-style AI-slop removal, but it is broader: it learns reusable voice rules across the Vault.

## Inputs
Use only the smallest relevant source set:
- approved examples supplied by the user;
- local brand/voice files when the task is GTM;
- prior approved outputs;
- channel constraints.

Do not bulk-load private notes.

## Workflow
1. Identify channel and audience.
2. Extract 3-7 voice rules from approved examples.
3. Rewrite the draft.
4. Remove AI tells:
   - generic setup phrases;
   - overexplaining;
   - fake balance;
   - empty enthusiasm;
   - unnecessary lists;
   - inflated claims;
   - "not just X, but Y" overuse;
   - corporate filler.
5. Preserve facts, URLs, names, and claims.
6. Return final copy plus a short note of what changed.

## Self-Learning
When the user approves or edits output:
- capture the reusable rule;
- store only the rule, not the private example text;
- prefer local voice memory outside public repos unless the rule is generic.

Portable generic rules may live in this skill.

Private/user-specific voice memory belongs in local private staging or local folder overlays.

## Guardrails
- Do not invent facts.
- Do not copy private examples into public files.
- Do not make regulated claims stronger.
- For outbound/social content, keep approval gates from `gtm-automation`.
