# Project Hygiene Drift Review

Status: review required before applying shared bootstrap templates.

This is not an active-root blocker. `scripts/check-project-structure.sh` and `scripts/governance-audit.sh` pass. The failures below are stricter bootstrap-template drift and must not be overwritten automatically.

## Rule

Use zero-loss review before applying any shared workflow, CODEOWNERS, quality baseline, or structure-check template to a project repo. Create candidates or diffs first; commit to the project repo only after review.

## Current Drift

### tesknota

- Missing directories: `.github/user-stories`, `docs/tech-debt`
- Drifted strict templates: `.github/workflows/qa-hygiene.yml`, `.github/workflows/dependency-review.yml`, `scripts/check-structure-contract.mjs`
- Missing files: `.github/workflows/governance-secrets-gate.yml`, `QUALITY_BASELINE.md`, `.github/user-stories/README.md`, `.github/user-stories/_index.md`, `docs/tech-debt/README.md`

### oliver-app

- Missing directories: `.github/workflows`, `.github/user-stories`, `docs/tech-debt`, `docs/product`
- Missing shared hygiene files: workflow templates, CODEOWNERS, pull request template, quality baseline, user-story index, structure contract script, repo structure contract, tech-debt README, product README

### v-two-sdr

- Drifted strict templates: `.github/workflows/qa-hygiene.yml`, `.github/workflows/governance-secrets-gate.yml`, `QUALITY_BASELINE.md`

### fallow

- Missing directories: `docs/tech-debt`, `docs/product`
- Missing workflow templates: `.github/workflows/qa-hygiene.yml`, `.github/workflows/governance-secrets-gate.yml`, `.github/workflows/dependency-review.yml`
- Drifted strict templates: `QUALITY_BASELINE.md`, `scripts/check-structure-contract.mjs`
- Missing files: `docs/tech-debt/README.md`, `docs/product/README.md`

## Next Action

Generate candidate diffs per repo, then apply only reviewed changes. Do not run direct template sync as an unattended operation.
