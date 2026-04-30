# Governance Status

Last run: 2026-04-30 18:22:14 EDT

## Cleanup

- oliver-app: removed 1 runtime artifact dirs
- tesknota: removed 0 runtime artifact dirs
- v-two-sdr: removed 0 runtime artifact dirs
- fallow: removed 0 runtime artifact dirs

## Gate Results

PASS settings.statusLine.command target exists
PASS oliver-local symlink points to ~/.claude
PASS personas/cmo/config.json:workspace -> /Users/oliver/.claude/docs/personas/cmo
PASS personas/cmo/config.json:skill -> skills/cmo/SKILL.md
PASS personas/cmo/config.json:persona_soul -> personas/cmo/persona_soul.md
PASS personas/cmo/config.json:shared_data -> /Users/oliver/.claude/docs/personas/cmo/brand-guide.md
PASS personas/cmo/config.json:shared_data -> /Users/oliver/.claude/docs/personas/cmo/positioning.md
PASS personas/cmo/config.json:shared_data -> /Users/oliver/.claude/docs/personas/cmo/campaigns/
PASS personas/marketing/config.json:workspace -> /Users/oliver/.claude/docs/personas/marketing
PASS personas/marketing/config.json:skill -> skills/marketing/SKILL.md
PASS personas/marketing/config.json:persona_soul -> personas/marketing/persona_soul.md
PASS personas/marketing/config.json:shared_data -> /Users/oliver/.claude/docs/personas/marketing/content-calendar.md
PASS personas/marketing/config.json:shared_data -> /Users/oliver/.claude/docs/personas/marketing/seo-targets.md
PASS personas/marketing/config.json:shared_data -> /Users/oliver/.claude/docs/personas/marketing/assets/
PASS personas/sdr/config.json:workspace -> /Users/oliver/projects/v-two-sdr
PASS personas/sdr/config.json:skill -> skills/work-outreach/SKILL.md
PASS personas/sdr/config.json:persona_soul -> personas/sdr/persona_soul.md
PASS personas/sdr/config.json:shared_data -> /Users/oliver/projects/v-two-sdr/prospects.json
PASS personas/sdr/config.json:shared_data -> /Users/oliver/projects/v-two-sdr/outreach/templates.md
PASS personas/sdr/config.json:shared_data -> /Users/oliver/projects/v-two-sdr/outreach/sends.json
PASS personas/sdr/config.json:shared_data -> /Users/oliver/projects/v-two-sdr/outreach/opt-outs.json
PASS personas/sdr/config.json:shared_data -> /Users/oliver/projects/v-two-sdr/outreach/weekly-reports.json
PASS docs/projects/*.md matches shared/repo-map.json + oliver-local orchestration doc
PASS repo path exists: /Users/oliver/projects/tesknota
PASS repo path exists: /Users/oliver/projects/oliver-app
PASS repo path exists: /Users/oliver/projects/v-two-sdr
PASS repo path exists: /Users/oliver/projects/fallow
PASS docs/architecture.md includes canonical product root pattern
PASS docs/workspace-tree.md includes oliver-app
PASS README.md includes shared-system and governance sections
PASS docs/skills.md includes cmo/
PASS docs/skills.md includes marketing/
PASS docs/skills.md includes work-outreach/
PASS docs/skills.md includes nextjs-advanced-routing/
PASS docs/skills.md includes vercel-ai-sdk/
PASS ide/ and plans/ are ignored
PASS CLAUDE.md removed obsolete 'Always Plan First' rule
PASS ORCHESTRATION.md exists and references shared system

All structure tests passed.
PASS workflow standards change has trigger/routing updates
PASS settings/config change has context doc updates
PASS project pointer updates include repo inventory updates

Changed files checked from working tree
CLAUDE.md
ORCHESTRATION.md
README.md
docs/architecture.md
docs/archive/project-repos-detailed-2026-04-24.md
docs/cleanup-candidates.md
docs/codex-remote-ssh-auth.md
docs/governance.md
docs/oliver-local-reconciliation-2026-04-24.md
docs/project-repos.md
docs/projects/oliver-app.md
docs/runtime-verification/governance-status.md
docs/tooling-inventory.md
docs/workspace-tree.md
scripts/check-project-structure.sh
scripts/governance-audit.sh
scripts/install-governance-hook.sh
scripts/run-governance-gates.sh
scripts/run-nightly-governance.sh
scripts/test-structure.sh
scripts/validate-doc-integrity.sh
settings.json
shared/project-structure-rules.json
shared/workflow-standards.md
shared/workflows/README.md

doc-config-impact check passed.
Doc integrity scan
Root: /Users/oliver

=== /Users/oliver/projects/oliver-app

=== /Users/oliver/projects/tesknota

=== /Users/oliver/projects/v-two-sdr

=== /Users/oliver/projects/fallow

Result: PASS
=== auditing /Users/oliver/projects/oliver-app
PASS /Users/oliver/projects/oliver-app :: README.md
PASS /Users/oliver/projects/oliver-app :: CLAUDE.md
PASS /Users/oliver/projects/oliver-app :: AGENTS.md
PASS /Users/oliver/projects/oliver-app :: docs/MODULE_CONTEXT.md
PASS /Users/oliver/projects/oliver-app :: docs/MODULE_INSTRUCTIONS.md
PASS /Users/oliver/projects/oliver-app :: forbidden reference '/Users/oliver/.codex/skills' absent
PASS /Users/oliver/projects/oliver-app :: forbidden reference '/Users/oliver/.claude/skills' absent
PASS /Users/oliver/projects/oliver-app :: forbidden reference 'story-lifecycle-gate' absent

=== auditing /Users/oliver/projects/tesknota
PASS /Users/oliver/projects/tesknota :: README.md
PASS /Users/oliver/projects/tesknota :: CLAUDE.md
PASS /Users/oliver/projects/tesknota :: AGENTS.md
PASS /Users/oliver/projects/tesknota :: docs/product/03-backlog-user-stories.md
PASS /Users/oliver/projects/tesknota :: docs/product/07-execution-status.md
PASS /Users/oliver/projects/tesknota :: forbidden reference '/Users/oliver/.codex/skills' absent
PASS /Users/oliver/projects/tesknota :: forbidden reference '/Users/oliver/.claude/skills' absent
PASS /Users/oliver/projects/tesknota :: forbidden reference 'story-lifecycle-gate' absent

=== auditing /Users/oliver/projects/v-two-sdr
PASS /Users/oliver/projects/v-two-sdr :: README.md
PASS /Users/oliver/projects/v-two-sdr :: CLAUDE.md
PASS /Users/oliver/projects/v-two-sdr :: docs/README.md
PASS /Users/oliver/projects/v-two-sdr :: docs/SDR_EXECUTION_BACKLOG.md
PASS /Users/oliver/projects/v-two-sdr :: forbidden file absent docs/STATE-AUDIT-2026-04-22.md
PASS /Users/oliver/projects/v-two-sdr :: forbidden file absent docs/REDESIGN-2026-04-22.md
PASS /Users/oliver/projects/v-two-sdr :: forbidden file absent docs/SDR_FULL_PASS_BACKLOG_2026-04-24.md
PASS /Users/oliver/projects/v-two-sdr :: forbidden file absent docs/SDR_USER_STORIES_ACCEPTANCE_TESTS.md
PASS /Users/oliver/projects/v-two-sdr :: forbidden reference '/Users/oliver/.codex/skills' absent
PASS /Users/oliver/projects/v-two-sdr :: forbidden reference '/Users/oliver/.claude/skills' absent
PASS /Users/oliver/projects/v-two-sdr :: forbidden reference 'story-lifecycle-gate' absent

=== auditing /Users/oliver/projects/fallow
PASS /Users/oliver/projects/fallow :: README.md
PASS /Users/oliver/projects/fallow :: CLAUDE.md
PASS /Users/oliver/projects/fallow :: docs/v2/README.md
PASS /Users/oliver/projects/fallow :: docs/v2/EXECUTION_BACKLOG.md
PASS /Users/oliver/projects/fallow :: forbidden file absent docs/v2/LEGACY_DOC_AUDIT.md
PASS /Users/oliver/projects/fallow :: forbidden file absent docs/PRODUCT_ROADMAP.md
PASS /Users/oliver/projects/fallow :: forbidden file absent docs/ROADMAP.md
PASS /Users/oliver/projects/fallow :: forbidden file absent docs/DESIGN.md
PASS /Users/oliver/projects/fallow :: forbidden file absent docs/UX.md
PASS /Users/oliver/projects/fallow :: forbidden file absent docs/DATA_SCHEMA.md
PASS /Users/oliver/projects/fallow :: forbidden reference '/Users/oliver/.codex/skills' absent
PASS /Users/oliver/projects/fallow :: forbidden reference '/Users/oliver/.claude/skills' absent
PASS /Users/oliver/projects/fallow :: forbidden reference 'story-lifecycle-gate' absent

Governance audit: PASS
=== structure: oliver-app (/Users/oliver/projects/oliver-app)
PASS oliver-app required path present: README.md
PASS oliver-app required path present: CLAUDE.md
PASS oliver-app required path present: AGENTS.md
PASS oliver-app required path present: docs/MODULE_CONTEXT.md
PASS oliver-app required path present: docs/MODULE_INSTRUCTIONS.md
PASS oliver-app required path present: .github/oliver-app/modules
PASS oliver-app required path present: .github/user-stories/oliver-app
PASS oliver-app forbidden matches absent: docs/*backlog*.md
PASS oliver-app forbidden matches absent: src/*backlog*.md
PASS oliver-app backlog file allowed: .github/oliver-app/modules/campaigns-module/campaigns-module-backlog.md
PASS oliver-app backlog file allowed: .github/oliver-app/modules/general-platform/general-platform-backlog.md
PASS oliver-app backlog file allowed: .github/oliver-app/modules/general-platform/outstanding-build-priorities/smoke-stabilization/smoke-stabilization-backlog-2026-04-26.md
PASS oliver-app backlog file allowed: .github/oliver-app/modules/general-platform/platform-governance/auth-permissions-incident-backlog/US-AUTH-incident-backlog.md
PASS oliver-app backlog file allowed: .github/oliver-app/modules/slides-module/SLIDES-STRATEGY-AND-STORY-BACKLOG-2026-04-30.md
PASS oliver-app backlog file allowed: .github/oliver-app/modules/crm-module/crm-module-backlog.md
PASS oliver-app backlog file allowed: .github/oliver-app/modules/reviews-module/reviews-module-backlog.md
PASS oliver-app backlog file allowed: .github/oliver-app/modules/accounts-module/accounts-module-backlog.md
PASS oliver-app backlog file allowed: .github/oliver-app/modules/hr-module/hr-module-backlog.md
PASS oliver-app backlog file allowed: .github/oliver-app/modules/chatbot-module/chatbot-module-backlog.md
PASS oliver-app backlog file allowed: .github/oliver-app/modules/sdr-module/sdr-module-backlog.md
PASS oliver-app backlog file allowed: src/tech-debt/slides-backlog.md
PASS oliver-app backlog file allowed: src/tech-debt/campaign-content-posting-backlog.md
PASS oliver-app backlog file allowed: src/tech-debt/admin-design-system-backlog.md

=== structure: tesknota (/Users/oliver/projects/tesknota)
PASS tesknota required path present: README.md
PASS tesknota required path present: CLAUDE.md
PASS tesknota required path present: AGENTS.md
PASS tesknota required path present: docs/product/03-backlog-user-stories.md
PASS tesknota required path present: docs/product/07-execution-status.md
PASS tesknota required path present: .github/user-stories
PASS tesknota forbidden matches absent: docs/*backlog*.md
PASS tesknota backlog file allowed: docs/product/03-backlog-user-stories.md
PASS tesknota backlog file allowed: .github/user-stories/tesknota/US-TSK-173-reconcile-cloudflare-build-gates-with-canonical-backlog-and-clean-ts-state.md
PASS tesknota backlog file allowed: .github/user-stories/tesknota/backlog.md

=== structure: v-two-sdr (/Users/oliver/projects/v-two-sdr)
PASS v-two-sdr required path present: README.md
PASS v-two-sdr required path present: CLAUDE.md
PASS v-two-sdr required path present: docs/README.md
PASS v-two-sdr required path present: docs/SDR_EXECUTION_BACKLOG.md
PASS v-two-sdr required path present: docs/SDR_EPICS_USER_STORIES.md
PASS v-two-sdr forbidden matches absent: docs/*STATE-AUDIT*.md
PASS v-two-sdr forbidden matches absent: docs/*FULL_PASS_BACKLOG*.md
PASS v-two-sdr forbidden matches absent: docs/*USER_STORIES_ACCEPTANCE_TESTS*.md
PASS v-two-sdr backlog file allowed: docs/SDR_EXECUTION_BACKLOG.md

=== structure: fallow (/Users/oliver/projects/fallow)
PASS fallow required path present: README.md
PASS fallow required path present: CLAUDE.md
PASS fallow required path present: docs/v2/README.md
PASS fallow required path present: docs/v2/EXECUTION_BACKLOG.md
PASS fallow required path present: docs/v2/EPICS_USER_STORIES.md
PASS fallow forbidden matches absent: docs/*ROADMAP*.md
PASS fallow forbidden matches absent: docs/*DESIGN*.md
PASS fallow forbidden matches absent: docs/*UX*.md
PASS fallow forbidden matches absent: docs/*DATA_SCHEMA*.md
PASS fallow forbidden matches absent: docs/v2/*LEGACY_DOC_AUDIT*.md
PASS fallow backlog file allowed: docs/v2/EXECUTION_BACKLOG.md

Project structure check: PASS
- Overall: PASS
