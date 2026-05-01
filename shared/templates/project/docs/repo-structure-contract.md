# Repo Structure Contract

Status: Active

## Canonical Contract Sources

1. `/Users/oliver/oliver-local/contracts/PROJECT_HYGIENE_STANDARD.md`
2. `/Users/oliver/oliver-local/contracts/PROJECT_STRUCTURE_STANDARD.md`

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
- `.github/user-stories/<project>/US-*.md`

## Backlog and Evidence Paths

Declare repo-specific canonical paths and keep them synchronized with story files:

1. Active backlog source: `<replace-with-canonical-path>`
2. Story catalog source: `<replace-with-canonical-path>`
3. Acceptance test matrix source: `<replace-with-canonical-path>`

## Naming Rules

1. `_index.md` is the only story index filename.
2. `backlog.md` is retired as an active planning filename.
3. Story IDs are immutable.

## Enforcement

1. `npm run check:structure`
2. `npm run qa:hygiene`
