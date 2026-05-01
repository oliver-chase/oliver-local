# Oliver-Local Repo Operations

Status: Active
Scope: Full `/Users/oliver` orchestration system (git root: `~/oliver-local`)

## Purpose

This repository exists to version the orchestration system and guardrails used across local agent runtimes. It is not a product code repository.

## System Boundaries

- Git repo root: `~/oliver-local`
- Shared-system scope includes runtime integrations for:
  - `~/.claude` (runtime adapter)
  - `~/.codex`
  - `~/.agents`
- Authoritative shared contracts:
  - `~/oliver-local/contracts/AGENT_SHARED_STRUCTURE.md`
  - `~/oliver-local/contracts/SHARED_ORCHESTRATION.md`
  - `~/oliver-local/contracts/AGENT_SYSTEM_MANIFEST.json`
- Machine-level aliases point to those contract files:
  - `/Users/oliver/AGENT_SHARED_STRUCTURE.md`
  - `/Users/oliver/SHARED_ORCHESTRATION.md`
  - `/Users/oliver/AGENT_SYSTEM_MANIFEST.json`

## What Gets Pushed

Push only orchestration-system assets, including:

- shared workflow standards and SOPs (`shared/*`)
- shared skills and tools (`skills/*`)
- orchestration docs (`README.md`, `ORCHESTRATION.md`, `docs/*`)
- governance scripts and validators (`scripts/*`)
- persona and routing config (`personas/*`, `settings.json`, `identity/*`)

Do not treat runtime state as product code. Do not add project feature code here.

## Required Guardrails Before Commit

From `~/oliver-local`, run:

```bash
/Users/oliver/oliver-local/scripts/run-governance-gates.sh
/Users/oliver/oliver-local/scripts/scan-secrets.sh /Users/oliver/oliver-local
```

Commit only if both pass.

## Required Commit Format

Use the repository commit policy format:

```text
type(epic-theme): summary

Stories:
- US-<ID>: ...

Acceptance Criteria:
- AC-<ID>: ...
```

## Push Procedure

1. Confirm clean intent: only orchestration/system files staged.
2. Run governance + secret gates.
3. Commit with required format.
4. Push `main` to `origin` (`git@github.com:oliver-chase/oliver-local.git`).
5. If push includes shared-system contract changes, ensure `.codex/ORCHESTRATION.md` remains aligned with shared contracts.

## History and Cleanliness Policy

- Active docs describe current state only.
- Archive material stays in `docs/archive/` with concise index entries.
- Do not duplicate shared workflow docs into project repos.
- Active docs describe current system behavior only.
