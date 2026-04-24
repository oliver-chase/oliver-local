# Architecture

## Principle

Keep application code, agent runtime state, and orchestration definitions separate.

## Layers

### 1. Application Layer

Lives in `~/projects/*`.

This contains the actual codebases:

- `tesknota`
- `ops-dashboard`
- `oliver-app`
- `v-two-sdr`
- `fallow`

### 2. Runtime Layer

Lives in:

- `~/.claude`
- `~/.codex`

These directories contain each agent's local runtime state, caches, sessions, auth, and installed tooling.

### 3. Orchestration Layer

Tracked by `oliver-local` (`oliver-chase/oliver-local`), checked out at `~/.claude` with command alias `~/oliver-local`.

This layer defines:

- Claude instructions and personas
- Shared repo metadata
- Shared workflow standards
- Shared workflow procedures (`shared/workflows/*.md`)
- Documentation of how the workspace is wired

### 4. Auxiliary Layer

Support directories that are intentionally outside the canonical app-repo map:

- `~/references` - imported templates and upstream reference repos
- `~/tesknota-audit` - standalone audit artifacts
- `~/claude-push` - separate utility repo for Claude push automation

These are not product source-of-truth repos and should not be added to `shared/repo-map.json`.

## Persona Workspace Mapping

Persona config and workspace conventions:

- `personas/cmo/config.json` -> strategy docs in `docs/personas/cmo/`
- `personas/marketing/config.json` -> strategy docs in `docs/personas/marketing/`
- `personas/sdr/config.json` -> execution workspace in `~/projects/v-two-sdr`

## Cross-Agent Pattern

Claude and Codex should remain separate runtimes, but they should agree on:

- where project repos live
- how deploy workflows are described
- frontend and mobile expectations
- what the primary repos are

That common material should be written once in tracked files and referenced by both agents rather than duplicated in both runtimes.

## Repo Remotes

| Local path | Remote |
|------------|--------|
| `~/.claude` (alias: `~/oliver-local`) | `oliver-chase/oliver-local` |
| `~/projects/tesknota` | `oliver-chase/tesknota` |
| `~/projects/ops-dashboard` | `oliver-chase/ops-dashboard` |
| `~/projects/oliver-app` | `oliver-chase/oliver-app` |
| `~/projects/v-two-sdr` | `oliver-chase/v-two-sdr` |
| `~/projects/fallow` | `oliver-chase/fallow` |

## Codex

Separate runtime at `~/.codex`. Do not place `.codex` inside `.claude`.
