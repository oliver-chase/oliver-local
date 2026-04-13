# OliverRepo — Agent Personas & Identity

Agent persona and identity files for Claude Code orchestration.

## Structure

- `personas/<name>/persona_soul.md` — Role definitions (dev, fe-designer, architect, tester, sdr, cmo, marketing)
- `identity/` — Shared soul files (identity.md, user.md, agent_soul.md, capabilities.md, etc.)

## Usage

Files in this repo mirror `~/.claude/personas/` and `~/.claude/identity/`.
The global `~/.claude/CLAUDE.md` is the authoritative instruction file for Claude Code.

## Projects

All active projects live in `~/projects/`:
- `ops-dashboard` → saturdaythings/ops-dashboard
- `v-two-sdr` → saturdaythings/v-two-sdr
- `tesknota` → saturdaythings/tesknota
- `fallow` → saturdaythings/fallow
