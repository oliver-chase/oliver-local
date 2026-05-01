# Quality Baseline Standard

This repository uses **shared, strict-managed quality files**.

Canonical source-of-truth (outside project docs):
- `~/oliver-local/shared/templates/project/.github/workflows/qa-hygiene.yml`
- `~/oliver-local/shared/templates/project/.github/workflows/governance-secrets-gate.yml`
- `~/oliver-local/shared/templates/project/.github/workflows/dependency-review.yml`
- `~/oliver-local/shared/templates/project/.github/CODEOWNERS`
- `~/oliver-local/shared/templates/project/.github/pull_request_template.md`
- `~/oliver-local/shared/templates/project/QUALITY_BASELINE.md`

## Rule

If one managed quality file changes in any project, the canonical file in `oliver-local` must be changed first and then synced to all projects.

## Sync Command

```bash
bash ~/oliver-local/scripts/sync-project-hygiene.sh
```

## Audit Command

```bash
bash ~/oliver-local/scripts/audit-project-hygiene.sh
```

`audit-project-hygiene` must pass before merging quality/workflow policy edits.
