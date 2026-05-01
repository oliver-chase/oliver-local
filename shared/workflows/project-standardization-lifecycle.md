# Project Standardization Lifecycle

## Purpose
Define one standard lifecycle for project bootstrap, governance sync, drift audit, and promotion across all Oliver repos.

## Source of Truth
1. `shared/templates/project/**` for scaffold templates.
2. `shared/project-bootstrap-manifest.json` for managed files and strictness modes.
3. `shared/repo-map.json` for managed repo inventory.
4. `shared/project-structure-rules.json` for structure and backlog-location enforcement.
5. `contracts/PROJECT_STRUCTURE_STANDARD.md` for locked story/backlog/index naming and folder shape.

## Lifecycle
1. Bootstrap new project:
- Run `scripts/bootstrap-project-standard.sh /absolute/project/path`.
- Add the project to `shared/repo-map.json`.
- Add structure rules entry in `shared/project-structure-rules.json`.

2. Sync existing projects:
- Run `scripts/sync-project-hygiene.sh`.
- Default behavior: strict files are overwritten; presence files are not overwritten if already present.
- To force overwrite presence files: `OVERWRITE_NON_STRICT=1 scripts/sync-project-hygiene.sh`.

3. Audit drift:
- Run `scripts/audit-project-hygiene.sh`.
- Run `scripts/check-project-structure.sh`.
- Drift is blocking for strict files and required paths.

4. Promotion and alignment:
- Update development/staging/main project tracks via the same sync source.
- Verify branch status and ahead/behind after push.
- Enforce branch role mapping in every project:
  - `development` -> unstarted/in-progress work
  - `staging` -> completed QA-ready work
  - `main` -> production-ready promotions
- Never promote without a passing hygiene audit.

## Managed File Policy
- `strict`: file content must exactly match template.
- `presence`: file must exist; repo-specific content is allowed.

## Mandatory Repo Contract File

Each repo must keep `docs/repo-structure-contract.md` current with:
1. active backlog path
2. story catalog path
3. acceptance matrix path
4. story artifact roots

## Cadence
1. Run sync + audit before major releases.
2. Run sync + audit after adding any new project.
3. Run sync + audit when workflow templates change.

## Incident Response
If a repo fails audit:
1. Run sync.
2. Re-run audit.
3. If still failing, patch repo-specific drift and commit with story/AC metadata.
4. Re-run audit until pass.
