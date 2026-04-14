# Workflow Standards

These are the cross-agent rules both Claude and Codex should follow when working in the Oliver workspace.

## Repo Location

All product repos live under `~/projects/`.

## Product Repos

- `tesknota`
- `ops-dashboard`
- `v-two-sdr`
- `fallow`

## Stack Reality

The current workspace is primarily:

- JavaScript
- HTML
- CSS

Workflow-adjacent systems also matter:

- Google Sheets
- Outlook
- frontend design review
- mobile optimization

## Orchestration Rules

- Do not duplicate project repos just to expose them to another agent runtime
- Do not create a second fake checkout of `OliverRepo`
- Keep Claude and Codex runtime state separate
- Put shared metadata and standards in tracked files once
- Treat the live machine layout as the source of truth over stale cached paths

## Design Standards

- Preserve the existing visual language of each product unless a redesign is requested
- Prioritize mobile responsiveness and touch usability
- Treat frontend polish, spacing, hierarchy, and accessibility as first-class concerns

## Operational Standards

- Prefer SSH Git remotes for `oliver-chase/*`
- Do not hard-code primary vs. secondary repo assumptions into long-lived docs
- Keep deployment and repo-path knowledge in tracked metadata instead of agent memory alone
