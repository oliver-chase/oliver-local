# Architecture

## Principle

Keep application code, agent runtime state, and orchestration definitions separate.

## Layers

### 1. Application Layer

Lives in `~/projects/*`.

This contains the actual codebases:

- `tesknota`
- `ops-dashboard`
- `v-two-sdr`
- `fallow`

### 2. Runtime Layer

Lives in:

- `~/.claude`
- `~/.codex`

These directories contain each agent's local runtime state, caches, sessions, auth, and installed tooling.

### 3. Orchestration Layer

Tracked by `OliverRepo`, currently checked out at `~/.claude`.

This layer defines:

- Claude instructions and personas
- Shared repo metadata
- Shared workflow standards
- Documentation of how the workspace is wired

## Cross-Agent Pattern

Claude and Codex should remain separate runtimes, but they should agree on:

- where project repos live
- how deploy workflows are described
- frontend and mobile expectations
- what the primary repos are

That common material should be written once in tracked files and referenced by both agents rather than duplicated in both runtimes.

## Safe Near-Term Structure

```text
~/.claude/
|- CLAUDE.md
|- commands/
|- hooks/
|- identity/
|- personas/
|- skills/
|- docs/
`- shared/

~/.codex/
|- runtime files only
`- system/custom skills as needed
```

## Recommended Next Step For Codex

When Codex gets a mature custom layer, create a separate tracked Codex-oriented repo or a tracked Codex subtree that can be linked into `~/.codex` without moving the runtime there prematurely.

Do not place `.codex` inside `.claude`.
