# Automation Platforms

Purpose: portable guidance for choosing workflow platforms across the Vault.

## Dify
Use for:
- repeatable AI workflows;
- RAG over approved documents;
- model/provider switching;
- API endpoints;
- workflow logs and observability.

Do not use for:
- raw credential storage without a private data policy;
- automatic social posting without approval;
- unreviewed prospect data uploads.

Reference: `langgenius/dify`.

## Budibase
Use for:
- internal ops apps;
- dashboards;
- admin panels;
- approval queues;
- lightweight CRUD over operational data;
- human review interfaces for automations.

Do not use for:
- replacing canonical source files;
- bypassing approval gates;
- storing secrets in app config without review.

Reference: `Budibase/budibase`.

## Postiz Agent
Use for:
- social scheduling integration patterns;
- approved post queue workflows;
- connecting agents to social publishing tools.

Do not use for:
- silent posting;
- account login handling without approval;
- bypassing platform rules.

Reference: `gitroomhq/postiz-agent`.

## OpenOutreach
Use for:
- lead lifecycle architecture;
- qualification-before-contact patterns;
- rate-limit and local-ownership patterns.

Do not run live LinkedIn automation without explicit approval.

## Platform Choice
Use:
- Vault files for canonical notes and draft state.
- Budibase for internal admin/review apps.
- Dify for AI workflows and APIs.
- Postiz-style integration for approved social publishing.
- OpenOutreach-style pipeline for approved outbound/lead discovery.
