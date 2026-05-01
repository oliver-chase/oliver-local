# Project Hygiene Standard

Status: Active
Effective Date: 2026-04-30
Scope: All repositories, modules, and workstreams

## Required story hygiene
1. Every implementation change maps to an existing story or creates a new story first.
2. Every story includes:
- `Epic`
- `Status`
- `Verified`
- Acceptance Criteria
- QA / Evidence
- Test Plan (positive, negative, regression)
3. Story IDs are immutable; updates happen in-place.

## Required epic hygiene
1. Every commit maps to exactly one owning epic.
2. Commit message format: `<type>(epic-<name>): <summary>`.
3. Commit body must include `Tickets:` and `Scope:` lines.
4. Mixed-epic work must be split into separate commits.

## Required test hygiene
1. Every behavior change updates or adds automated tests in the correct lane (contract, regression, visual, integration).
2. Every story needs at least one negative-path assertion.
3. `Verified: true` is blocked unless fresh evidence is present in git.
4. Archived (not removed) features must retain non-regression tests for data/telemetry paths.

## Required documentation hygiene
1. Module docs, backlog docs, and story files are updated in the same change when behavior/contracts change.
2. One canonical location per module/workstream; no duplicate story maps across docs.
3. Backlog root files must keep current epic map and list unassigned-epic debt explicitly.
4. Public tracked docs use placeholders for service URLs, account emails, local usernames, device paths, and deployment identifiers unless the value is intentionally public product information.

## Canonical story layout contract
1. Contract source: `contracts/PROJECT_STRUCTURE_STANDARD.md`.
2. Every repo must keep `docs/repo-structure-contract.md` aligned with that contract.
3. `_index.md` is the canonical index filename for story folders.
4. `backlog.md` is retired as an active planning filename.
5. The same story ID filename must not exist in more than one artifact root.
6. Story checkers must fail when:
- artifact roots validate zero stories where stories are expected
- planning roots contain executable story artifact files
- required index/contract files are missing

## Required secret hygiene
1. Real credentials, tokens, API keys, service-role keys, webhook secrets, private keys, and local auth files stay in ignored local env or provider secret stores.
2. Concrete project URLs and public anon keys stay in ignored local env unless there is a documented reason they must be public.
3. `.env.local` is the local holding area during rotation; examples in git show variable names and placeholders only.
4. Runtime adapter settings and auth state are never committed to `~/oliver-local`.

## Required discoverability hygiene
1. Provide one backlog root per module with quick commands for listing stories, epics, and unassigned entries.
2. Keep archive indexes for deferred functionality with clear re-enable instructions.
3. Define a single orchestration command named `qa:hygiene` in each repo package scripts that runs all required story/epic/test hygiene gates for that repo.

## Enforcement checklist (pre-push)
1. Story linked and AC/evidence/test-plan complete.
2. Epic assignment explicit and correct.
3. Commit scope is one epic.
4. Tests added/updated and relevant suite passes.
5. Docs/backlog/story metadata synchronized.
6. Secret and privacy scans pass before commit.
7. Story layout contract passes (`check-stories` and epic-hygiene gate where present).
