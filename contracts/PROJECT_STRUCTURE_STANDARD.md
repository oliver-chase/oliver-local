# Project Structure Standard

Status: Active
Effective Date: 2026-05-01
Scope: All project repositories under `~/projects/*`

## Purpose

Define one locked folder/file contract for backlog, epics, user stories, and lifecycle evidence so every agent follows the same read/write flow.

## Core Invariants

1. Every repo has exactly one active backlog source.
2. Story registry and story artifacts are separate from the active backlog.
3. Story IDs are immutable and updated in place.
4. `_index.md` is the only allowed story index filename.
5. `backlog.md` is retired as an active planning filename.
6. Each repo must keep `docs/repo-structure-contract.md` current.

## Required Base Paths (All Repos)

1. `README.md`
2. `CLAUDE.md`
3. `AGENTS.md`
4. `docs/repo-structure-contract.md`
5. `.github/user-stories/README.md`
6. `.github/user-stories/_index.md`
7. `.github/user-stories/<project>/`

## Story Artifact Rules

1. Story files live under `.github/user-stories/<project>/` or a declared module artifact root.
2. Story filenames must use stable ticket IDs such as `US-*`, `SLD-*`, `SMK-*`.
3. Each story folder must include `_index.md`.
4. Root `.github/user-stories/` may contain only:
- `README.md`
- `_index.md`
- dated governance/audit files
- project folders

## Documentation Roles

1. Backlog doc: active queue (not archive).
2. Epics/story catalog doc: long-form story inventory and scope map.
3. Acceptance test matrix: AC-to-test evidence mapping.
4. Story files: execution-level acceptance criteria and evidence updates.
5. Index files: registry navigation and lifecycle visibility; they must not become the active backlog queue.

## Locked Path Map (Managed Repos)

Use these canonical locations exactly; do not create parallel backlog systems.

1. `oliver-app` / `oliver-app-dev` / `oliver-app-main` / `oliver-app-staging`
- Backlog source: `.github/user-stories/oliver-app/backlog/<module>/README.md`
- Story artifacts: `.github/oliver-app/modules/<module>/*.md`
- Story index: `.github/user-stories/_index.md` and `.github/user-stories/oliver-app/_index.md`
- Acceptance evidence: in story artifacts + repo execution docs/tests

2. `tesknota`
- Backlog source: `docs/product/03-backlog-user-stories.md`
- Story catalog: `docs/product/07-execution-status.md`
- Story artifacts: `.github/user-stories/tesknota/US-TSK-*.md`
- Story index: `.github/user-stories/_index.md` and `.github/user-stories/tesknota/_index.md`
- Acceptance evidence: story files + `docs/product/07-execution-status.md`

3. `v-two-sdr`
- Backlog source: `docs/SDR_EXECUTION_BACKLOG.md`
- Story catalog: `docs/SDR_EPICS_USER_STORIES.md`
- Acceptance matrix: `docs/SDR_ACCEPTANCE_TEST_MATRIX.md`
- Story artifacts: `.github/user-stories/v-two-sdr/US-SDR-*.md`
- Story index: `.github/user-stories/_index.md` and `.github/user-stories/v-two-sdr/_index.md`

4. `fallow`
- Backlog source: `docs/v2/EXECUTION_BACKLOG.md`
- Story catalog: `docs/v2/EPICS_USER_STORIES.md`
- Acceptance matrix: `docs/v2/ACCEPTANCE_TEST_MATRIX.md`
- Story artifacts: `.github/user-stories/fallow/US-FAL-*.md`
- Story index: `.github/user-stories/_index.md` and `.github/user-stories/fallow/_index.md`

## Allowed Repo Profiles

### Profile A: Split Planning + Module Artifact Roots (`oliver-app` family)

1. Planning root:
- `.github/user-stories/oliver-app/backlog/<module>/README.md`
2. Executable artifacts:
- `.github/oliver-app/modules/<module>/*.md`
3. Contract file:
- `docs/repo-structure-contract.md` must explicitly state the split-root rule.

### Profile B: Docs-Backlog + Story Artifact Tree (`tesknota`, `v-two-sdr`, `fallow`)

1. Active backlog file stays in docs (repo-defined path).
2. Story artifact root:
- `.github/user-stories/<project>/US-*.md`
3. Project story folder includes:
- `README.md`
- `_index.md`

## Agent Read Order

1. `README.md`
2. `AGENTS.md`
3. `CLAUDE.md`
4. `docs/repo-structure-contract.md`
5. active backlog file declared by the contract
6. `.github/user-stories/README.md`
7. `.github/user-stories/_index.md`
8. project story folder index and story files
9. acceptance test matrix file declared by the contract

## Story Path Flow

1. Intake or reprioritization updates the active backlog source only.
2. Execution updates the story artifact file (`US-*`) and keeps story ID stable.
3. Verification updates acceptance evidence (story file and matrix/execution doc when defined by profile).
4. Completion updates `_index.md` status and removes done items from active backlog queues.

## Enforcement

1. Run the repo's structure gate (`npm run check:structure` or `npm run check-stories`, depending on profile).
2. `npm run qa:hygiene` in each repo.
3. `~/oliver-local/scripts/check-project-structure.sh` for cross-repo shape checks.
4. Contract drift in `docs/repo-structure-contract.md` is a blocker.
