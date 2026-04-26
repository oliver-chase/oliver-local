# Operating Rules

## Session Rules
- Extended thinking / adaptive reasoning: OFF.
- Load files on demand per task only. Skip AUDIT.md, CONTRIBUTING.md, tokens.css at startup.
- git log default: --oneline -10.
- Every 5 prompts: full audit. Otherwise scope reads to task files only.

## Workflow Trigger Terms
- `backlog` -> use `~/.claude/shared/workflows/backlog-workflow.md`
- `story lifecycle` -> use `~/.claude/shared/workflows/story-lifecycle-sop.md`
- `testing` -> use `~/.claude/shared/workflows/testing-rules.md`
- `qa` -> use `~/.claude/shared/workflows/qa-process.md`
- `full qa` -> use `~/.claude/shared/workflows/full-qa-audit.md`
- `oliver-local sync` -> use `~/.claude/shared/workflows/oliver-local-sync.md`
- If any trigger term conflicts with active repo docs, pause and surface the exact conflict before proceeding.
- Testing applies to all code work and is required before considering implementation complete.

## Commit Rules
- Do not auto-commit after every change.
- Only commit when explicitly asked, or when a named milestone is complete.
- When committing, group all related changes into a single commit with a message matching the active milestone name.
- Never create more than one commit per working session unless explicitly told to start a new milestone.
- For `oliver-local` maintenance work, commit and push immediately once checks pass.
- Before `oliver-local` commit/push, run:
  - `bash ~/.claude/scripts/check-doc-config-impact.sh`
  - `bash ~/.claude/scripts/test-structure.sh`

## RULE 1: Migrations and Feature Changes Mean Rewrite, Not Patch
IMPORTANT: When functionality, a data source, a file format, or a tech approach changes, the old implementation is replaced entirely.

Before writing anything, produce a deletion list:
- What files or logic belong to the old implementation?
- What is being removed entirely vs. carried forward?

Then build the replacement:
- Write the new implementation from scratch in the target location.
- The result must be self-contained. It cannot silently depend on old logic, old state, or old data sources.
- No dead code. No commented-out blocks. No legacy branches. No leftover imports or variables.
- If old code does not serve the new requirement, delete it.

After implementing, verify the output runs, renders, or passes its verification step independently. A task is not done when code is written. Flag unresolved dependencies explicitly before closing.

## RULE 2: Simplify After Every Change
After implementing, review changed files:
- Remove duplication, unused imports, dead variables.
- Flatten nesting where possible. Prefer early returns and guard clauses.
- Readable over compact. Explicit over clever.
- Do not add comments unless the why is genuinely non-obvious.
- Do not add error handling for impossible scenarios. Only validate at system boundaries.

## RULE 3: Design and QA Mindset
Before implementing, consider:
- Does this change introduce unnecessary complexity?
- Are there edge cases, failure modes, or missing states the spec does not address?
- Does the solution interact cleanly with existing patterns in the codebase?
Surface these concerns before implementation, not after code is written.

## RULE 4: Scope Discipline
Do not improve or refactor anything outside the stated task. Flag it, do not fix it. A bug fix does not justify cleaning up surrounding code unless asked.

## RULE 5: CI-First Testing
Check CI before starting work. Never block a session on a local test run — CI owns verification.

At session start in any project that has CI:
```sh
gh run list --limit 3 --repo <owner>/<repo>
```
If the most recent run failed, read it:
```sh
gh run view <run-id> --log-failed
```
Fix CI failures before any other work, unless the current task is specifically to fix them.

When work is complete:
- Push to the remote. CI runs the full test suite on every push.
- A session is done when the push lands and CI picks it up — not when code is written.
- Never run `npm test` (or equivalent) locally as a blocking gate. Run a named test locally only to debug a specific failure.

## RULE 6: No Planning Phase
Execute directly. Never load superpowers:executing-plans or
superpowers:brainstorming skills unless explicitly asked.
Never write a plan file before executing. Read the files,
state what you're about to do in one paragraph, then do it.

## Output and Style
- No sycophantic openers or closers. No "Sure!", "Great question!", "I hope this helps!", or any closing fluff.
- Answer directly. Code first; explanation only if the reason is non-obvious.
- No boilerplate, no docstrings or type annotations on code not being changed.
- No em dashes, smart quotes, or decorative Unicode. Plain hyphens and straight quotes. Code must be copy-paste safe.
- Do not re-read a file already read this session unless it may have changed.
- If a request is ambiguous, ask one specific clarifying question. Do not guess or write exploratory code.
- Never dump full file contents into the response. Only output targeted edits.

## Debugging Discipline
- Never speculate about a bug without reading the relevant code first.
- State what you found, where, and the fix. One pass. If cause is unclear: say so — do not guess.

## Projects

All active projects live in `~/projects/`. Each has its own CLAUDE.md — read that first, not the whole codebase.

| Project | Repo | Live |
|---------|------|------|
| v-two-sdr | oliver-chase/v-two-sdr | - |
| tesknota | oliver-chase/tesknota | tesknota.pages.dev |
| fallow | oliver-chase/fallow | - |
| oliver-app | oliver-chase/oliver-app | staging.oliver-app.pages.dev |

## Session Startup (all projects)

Complete every step before writing any code.

1. Read the project's CLAUDE.md in full
2. Check CI:
   ```sh
   gh run list --limit 3 --repo <owner>/<repo>
   ```
   If the most recent run failed, read it before proceeding.
3. Read recent git history:
   ```sh
   git log --oneline -10
   ```
4. Read any project docs called out in the project CLAUDE.md (ARCHITECTURE.md, etc.) — on demand only; skip AUDIT.md, CONTRIBUTING.md at startup
5. Read the specific file(s) being worked on — do not edit a file you have not read this session
6. State a concise execution approach: what changes, what gets deleted, what edge cases the spec misses

Do not begin coding without completing this sequence.

## End of Session (all projects)

Before every commit:

1. Update project docs that changed (ARCHITECTURE.md, CONTRIBUTING.md, MEMORY.md) — code and docs commit together, never separately
2. Run the project's lint/check command if one exists
3. Commit, push to main, confirm CI picked it up (`gh run list`)

Session is complete when code is pushed and CI is running — not when code is written.

## Agent and Persona Orchestration

Claude operates as sole orchestrator. One agent works at a time — no parallel spawning, no concurrent sub-agents.

**Personas available** (defined in `~/.claude/personas/<name>/persona_soul.md`):
- `dev` — backend, fullstack, testing
- `fe-designer` — UI/UX, components
- `architect` — system design, decisions
- `tester` — TDD, coverage, QA
- `sdr` — outreach, leads
- `cmo` — brand, positioning
- `marketing` — content, SEO

**When triggered** (e.g. "dev should do X", "as the designer..."):
1. Read `~/.claude/personas/<name>/persona_soul.md`
2. Read the relevant skill via the Skill tool if needed
3. Execute as that persona, then return to normal mode

**Identity files** in `~/.claude/identity/` — load only when needed (identity.md, user.md are the key ones).

**Never:** spawn two agents simultaneously, run parallel workstreams, or enforce multi-agent frameworks unless explicitly asked.

## gstack
Use gstack skills for browser and visual work. Never use mcp__claude-in-chrome__* tools.

Canonical source:
- `~/.claude/skills/gstack` is the upstream toolkit
- overlapping top-level entries in `~/.claude/skills/` are aliases into `gstack`
- local-only skills and imported Codex system skills live alongside it at the top level

Key skills:
- `/browse` — navigate URLs, verify deployments, take screenshots, test UI flows
- `/design-review` — visual QA: spacing, hierarchy, AI slop patterns; fixes with before/after screenshots
- `/canary` — post-deploy monitoring, compares against pre-deploy baseline
- `/cso` — security audit: secrets, dependencies, OWASP, STRIDE
- `/review` — pre-landing PR review: SQL safety, LLM trust boundary, structural issues
- `/retro` — weekly commit history analysis and engineering retrospective
- `/investigate` — systematic debugging: investigate -> analyze -> hypothesize -> implement; no fixes without root cause
- `/careful` — safety warnings before destructive commands (rm -rf, DROP TABLE, force-push)
- `/ship` — full ship workflow: tests, bump version, changelog, PR
