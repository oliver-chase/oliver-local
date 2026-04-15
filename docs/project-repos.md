# Project Repos

Each project lives in its own Git repo under `/Users/oliver/projects`. Structure only — no vendored content.

Updated 2026-04-15.

## tesknota

Next.js 15 app (TypeScript + Supabase). Migrated from vanilla JS. Live at tesknota.pages.dev.

```text
~/projects/tesknota/
|- app/
|  |- (app)/
|  |  |- admin/page.tsx
|  |  |- analytics/page.tsx
|  |  |- collection/page.tsx
|  |  |- compliments/page.tsx
|  |  |- dashboard/page.tsx
|  |  |- friend/page.tsx
|  |  |- import/page.tsx
|  |  |- settings/page.tsx
|  |  |- wishlist/page.tsx
|  |  `- layout.tsx
|  |- globals.css
|  |- layout.tsx
|  `- page.tsx
|- components/
|  |- layout/
|  |  |- AppShell.tsx
|  |  |- Sidebar.tsx
|  |  `- Topbar.tsx
|  `- ui/
|     |- accord-cloud.tsx
|     |- bot-drawer.tsx
|     |- button.tsx
|     |- cmd-palette.tsx
|     |- comp-form.tsx
|     |- filter-bar.tsx
|     |- frag-detail.tsx
|     |- frag-form.tsx
|     |- frag-row.tsx
|     |- modal.tsx
|     |- pagination.tsx
|     |- section-header.tsx
|     |- stat-box.tsx
|     `- toast.tsx
|- lib/
|  |- data/
|  |  |- index.ts
|  |  `- mutations.ts
|  |- data-context.tsx
|  |- frag-utils.ts
|  |- mobile-nav-context.tsx
|  |- state.ts
|  |- supabase.ts
|  |- user-context.tsx
|  `- utils.ts
|- scripts/
|  |- migrate-to-supabase.js
|  `- schema.sql
|- types/index.ts
|- AGENTS.md
|- ARCHITECTURE.md
|- CLAUDE.md
|- MIGRATION.md
|- README.md
|- components.json
|- next.config.ts
|- postcss.config.mjs
`- tsconfig.json
```

## ops-dashboard

Vanilla JS multi-section dashboard. Cloudflare Pages + Supabase backend. Live at vtwo-ops.pages.dev.

```text
~/projects/ops-dashboard/
|- accounts/
|  |- js/
|  |  |- actions.js
|  |  |- app.js
|  |  |- chatbot-upload.js
|  |  |- chatbot.js
|  |  |- data.js
|  |  |- export.js
|  |  |- notes.js
|  |  |- opportunities.js
|  |  |- orgchart.js
|  |  |- overview-chart.js
|  |  |- overview.js
|  |  |- people.js
|  |  |- pickers.js
|  |  |- projects.js
|  |  |- state.js
|  |  `- utils.js
|  |- accounts.css
|  |- chatbot.css
|  |- index.html
|  `- MEMORY.md
|- admin/
|  |- js/keys.js
|  |- admin.css
|  `- index.html
|- crm/
|  |- js/app.js
|  |- crm.css
|  `- index.html
|- docs/
|  |- AGENT-PERSONA.md
|  |- DATA-GUIDE.md
|  |- FOUNDATION-RUNBOOK.md
|  `- RUNBOOK.md
|- functions/
|  |- _shared/ai.js
|  `- api/
|     |- admin/keys.js
|     |- chat.js
|     |- confirm-write.js
|     |- parse-document.js
|     `- parse-image.js
|- hr/
|  |- js/
|  |  |- assignments.js
|  |  |- cp-flows-cand.js
|  |  |- cp-flows-device.js
|  |  |- cp-flows-emp.js
|  |  |- cp-flows-track.js
|  |  |- cp.js
|  |  |- dashboard.js
|  |  |- data.js
|  |  |- directory.js
|  |  |- global-search.js
|  |  |- hiring-modals.js
|  |  |- hiring.js
|  |  |- inventory.js
|  |  |- onboarding.js
|  |  |- reports.js
|  |  |- settings.js
|  |  |- state.js
|  |  |- tracks.js
|  |  `- utils.js
|  |- hr.css
|  `- index.html
|- scripts/
|  |- pre-commit
|  |- run-audit.js
|  |- setup-hooks.sh
|  `- setup-supabase.sql
|- sdr/
|  |- js/app.js
|  |- sdr.css
|  `- index.html
|- shared/
|  |- components-base.css
|  |- components-interactive.css
|  |- components-layout.css
|  |- components.css
|  |- db.js
|  |- hub-nav.js
|  |- placeholder.css
|  |- popover.js
|  |- styles.css
|  |- tokens.css
|  `- utils.js
|- supabase/
|  `- ai_config.sql
|- ARCHITECTURE.md
|- AUDIT.md
|- CLAUDE.md
|- CONTRIBUTING.md
|- MEMORY.md
|- README.md
|- _headers
|- build.js
|- config.example.js
├- index.html
`- package.json
```

## v-two-sdr

Node.js automated B2B outreach pipeline. GitHub Actions orchestration. 386/386 tests passing.

```text
~/projects/v-two-sdr/
|- __tests__/
|- cloudflare/
|  |- approval-worker.js
|  `- wrangler.toml
|- config/
|  |- config.oauth.js
|  |- config.sheets.js
|  `- sequences.js
|- docs/
|- lib/timezone-cache.js
|- outreach/
|- scripts/
|  |- add-prospects.js
|  |- approval-email.js
|  |- bounce-handler.js
|  |- cleanup-sheet.js
|  |- digest.js
|  |- draft.js
|  |- enrichment-engine.js
|  |- followup-scheduler.js
|  |- handle-approval.js
|  |- hunter-verifier.js
|  |- inbox-monitor.js
|  |- inbox.js
|  |- mailer.js
|  |- oauth-client.js
|  |- prospect.js
|  |- reply-classifier.js
|  |- send.js
|  |- sheets-writer.js
|  |- sync.js
|  `- validate-prospects.js
|- CLAUDE.md
|- README.md
|- REDESIGN.md
`- RUNBOOK.md
```

## fallow

Early-stage project. Docs-heavy, minimal code.

```text
~/projects/fallow/
|- docs/
|  |- DATA_SCHEMA.md
|  |- DEPLOYMENT.md
|  |- DESIGN.md
|  |- HOSTING_GUIDE.md
|  |- LEGAL_COMPLIANCE.md
|  |- LEGAL_VERIFICATION.md
|  |- PRODUCT_ROADMAP.md
|  |- ROADMAP.md
|  `- UX.md
|- src/
|  |- data/
|  |- scripts/
|  |- ui/
|  `- server.js
`- README.md
```
