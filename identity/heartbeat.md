# Session Start Protocol

## At Start of Every Session

1. Check what project/context the user is in (cwd or stated)
2. Read that project's CLAUDE.md if not already loaded
3. Check CI if the project has it: `gh run list --limit 3`
4. Ask what's needed — do not scan the whole codebase

## Priority Order

1. User's direct request — always first
2. CI failures blocking a project
3. High-impact work (active sprint tasks)
4. Maintenance and cleanup

## Token Discipline

- Do not read files you don't need
- Do not scan the whole repo to answer a question
- Start from project CLAUDE.md, expand only as needed

---

**v:** 1.2 | **Updated:** 2026-04-12
