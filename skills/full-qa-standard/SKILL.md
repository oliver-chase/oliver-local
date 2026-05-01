---
name: full-qa-standard
description: Use when the user asks for "full QA", "deep QA", "QA review", "don't skip steps", or asks to audit Oliver App modules for functionality, mobile behavior, design-system parity, chatbot consistency, regressions, dead code, tech debt, and release readiness.
metadata:
  short-description: Oliver App full QA workflow
---

# Full QA Standard

Use this skill for deep QA on Oliver App modules or comparable product areas. The job is to find real gaps, fix what is safe to fix, and leave executable evidence. Do not treat one green gate as enough.

## Operating Rules

- Start by reading the dirty worktree and recent diffs. Preserve unrelated user changes.
- Convert vague concerns into explicit surfaces: functionality, rendering, mobile, accessibility, design tokens, module shell parity, chatbot behavior, API contracts, calendar/reporting flows, dead code, duplicate code, and regression risk.
- Prefer repo-native contracts and Playwright tests over manual claims. Add or strengthen tests when a class of issue can regress.
- If a long monolithic smoke run is unstable, use fresh-server split batches and document that choice. Do not claim the monolith is green unless it passed.
- Fix concrete defects discovered during QA when scoped and safe. Otherwise record the residual risk with file paths and evidence.

## Required Passes

1. Scope and baseline:
   - `git status --short`
   - inspect relevant diffs with `git diff -- <paths>`
   - list touched modules, routes, APIs, and shared components

2. Static integrity:
   - `npm run lint`
   - `npm run typecheck`
   - `npm run test:contracts`
   - targeted `rg` scans for raw colors, inline layout styles, duplicate shell code, dead route/API assumptions, and dormant feature text

3. Build and runtime:
   - `npm run build`
   - run focused Playwright tests for touched modules first
   - run full desktop smoke and mobile smoke before declaring release readiness

4. Module shell and design-system parity:
   - Verify shared sidebar/topbar/header primitives are used consistently.
   - Check spacing, margins, colors, border radii, touch targets, overflow, empty states, loading states, and error states.
   - Raw colors belong in tokens or intentional documented exceptions. Layout styles should live in CSS or shared primitives unless dynamic.

5. Mobile and responsive:
   - Exercise mobile route entry, sidebar open/close, bottom nav where present, dialogs, chatbot, filter bars, tables, calendars, and horizontal overflow.
   - Require evidence from `npm run test:smoke:mobile` or equivalent Playwright mobile config.

6. Chatbot baseline:
   - Every enabled module must register Oliver from the module registry.
   - Commands need durable labels, groups, hints, aliases, and no duplicate labels/aliases.
   - Profile/settings aliases should stay consistent across modules.
   - Block wrong-scope intents and verify recovery guidance.

7. Campaign/calendar/reporting focus:
   - Verify Campaign routes, subpage links, content library, reminders, review queue, calendar filters, open slots, claim/schedule actions, exports, permissions, and chatbot calendar commands.
   - Include mobile certification for Campaign routes and critical actions.

## Evidence Standard

Final QA notes must include:

- defects found and fixed, with file links
- tests added or updated
- exact verification commands and pass/fail results
- any command that remains flaky or was replaced by stronger split evidence
- residual risks, if any

Do not finish with generic confidence. Finish with concrete evidence.
