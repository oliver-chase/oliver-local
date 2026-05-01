# Oliver App Worktree Branch Normalization (2026-05-01)

## Current State
- Repository uses multiple git worktrees sharing one `.git` directory.
- Active mappings observed:
  - `/Users/oliver/projects/oliver-app` -> `main`
  - `/Users/oliver/projects/oliver-app-dev` -> `development`
  - `/Users/oliver/projects/oliver-app-main` -> `promote-main-epics`
  - `/Users/oliver/projects/oliver-app-staging` -> `promote-staging-epics`
- Constraint: a branch can only be checked out in one worktree at a time.

## Branch Uniformity Rules
- `main`: production-ready trunk only, no long-lived uncommitted story/governance batches.
- `development`: active integration and broad hygiene updates.
- `promote-main-epics`: promotion prep for `main` epic backfills.
- `promote-staging-epics`: promotion prep for `staging` epic backfills.
- `staging*`: release validation and environment-specific fixes.
- `tmp/*`, `backup/*`, `*-temp-*`, `merge-*-tmp-*`: temporary branches; must be deleted after merge/signoff.

## Lifecycle Remediation
1. For each temporary branch, verify merged or superseded commit lineage.
2. Archive needed evidence into user stories before deletion.
3. Delete stale temp branches locally and remotely.
4. Keep one durable purpose per worktree path; do not repurpose path/branch pairings ad hoc.

## QA Gate Before Branch Deletion
- Story metadata complete (`Status`, `Verified`, AC checklist, evidence).
- Related contract/e2e tests recorded in story evidence.
- No unresolved dependency references from remaining active stories.
