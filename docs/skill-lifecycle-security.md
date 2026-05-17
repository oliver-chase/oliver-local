# Skill Lifecycle And Security Gate

Purpose: keep imported skills current without silently changing runtime behavior or accepting malicious/broken updates.

## Rule
Run update checks automatically. Do not apply updates automatically.

The update loop may:
- check upstream heads;
- stage candidates;
- scan staged code;
- produce manifests;
- recommend actions.

The update loop may not:
- overwrite active skills;
- change runtime symlinks;
- install packages globally;
- run third-party setup scripts;
- add secrets;
- commit or push changes.

## Lifecycle

1. Check upstream source registry.
2. Stage new candidate under local private staging.
3. Compare file inventory, changed skill files, package scripts, and executable files.
4. Run security gate.
5. Run syntax/static checks where available.
6. Produce manifest.
7. Human approves promotion.
8. Promote through reviewed commit.

## Security Gate

Every staged update must check for:
- hardcoded secrets;
- suspicious install scripts;
- shell download-and-execute patterns;
- credential file references;
- new network endpoints;
- new telemetry;
- postinstall/preinstall scripts;
- binary blobs;
- obfuscated code;
- unexpected executable bits;
- prompt-injection language that asks agents to ignore system/developer/user instructions.

High-risk findings block promotion until reviewed.

## Gap Learning

When an update check or work session finds a recurring gap, write the smallest durable update:
- skill routing issue -> `docs/skills-personas-index.md`;
- category issue -> `docs/skill-taxonomy.md`;
- security/update issue -> this file or local update policy;
- local-only rule -> nearest folder overlay;
- voice/style issue -> `skills/voice-humanizer/SKILL.md` or local voice memory.

Do not create broad notes when one routing line is enough.

## Sources To Watch

See local control-plane `SKILL_SOURCE_REGISTRY.yaml`.

Portable categories:
- orchestration;
- development;
- security/review;
- context/memory;
- marketing/GTM;
- social/video;
- automation platforms;
- model/tool adapters;
- voice/style.

## Scheduler

Recommended:
- daily or weekly check-only job;
- no auto-promotion;
- notification manifest only.

Do not run long clone/update jobs at shell startup.
