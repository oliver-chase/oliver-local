# Repo Structure Contract

Status: Active

## Canonical Contract Sources

1. `~/oliver-local/contracts/PROJECT_HYGIENE_STANDARD.md`
2. `~/oliver-local/contracts/PROJECT_STRUCTURE_STANDARD.md`

## Profile

Choose exactly one profile for this repo and keep all path statements below consistent with that profile.

1. Profile A: split planning root + module artifact roots (oliver-app family).
2. Profile B: docs backlog/catalog + story artifacts under `.github/user-stories/<project>/`.

## Required Structure

1. Root docs:
- `README.md`
- `CLAUDE.md`
- `AGENTS.md`
- `docs/repo-structure-contract.md`
2. Story registry:
- `.github/user-stories/README.md`
- `.github/user-stories/_index.md`
- `.github/user-stories/<project>/`
3. Story folder minimum:
- `.github/user-stories/<project>/README.md`
- `.github/user-stories/<project>/_index.md`
- one of:
  - `.github/user-stories/<project>/US-*.md`
  - `.github/user-stories/<project>/backlog/<module>/README.md`

## Backlog and Evidence Paths

Declare repo-specific canonical paths and keep them synchronized with story files. Do not leave unresolved placeholders.

1. Active backlog source: `<set explicit path>`
2. Story catalog source: `<set explicit path>`
3. Acceptance test matrix source:
   - `<set explicit path>`, or
   - `N/A (story files carry AC/test evidence directly)`
4. Story artifact source:
   - Profile A: `<set explicit module artifact root>`
   - Profile B: `.github/user-stories/<project>/US-*.md`
5. Root index source: `.github/user-stories/_index.md`

All placeholder tokens are invalid in committed files. Replace each with a concrete project path before merge.

## Branch Lifecycle Contract

1. `development`: unstarted and in-progress story housing.
2. `staging`: completed work ready for QA validation.
3. `main`: production-ready promotions only.
4. Source-of-truth link: `~/oliver-local/shared/workflow-standards.md`.
5. Change-one/change-all:
- If this lifecycle changes in a project repo, update this template and re-sync managed repos in the same governance cycle.

## Naming Rules

1. `_index.md` is the only story index filename.
2. `backlog.md` is retired as an active planning filename.
3. Story IDs are immutable.

## Enforcement

1. `npm run check:structure` or `npm run check-stories` (match repo profile)
2. `npm run qa:hygiene`
