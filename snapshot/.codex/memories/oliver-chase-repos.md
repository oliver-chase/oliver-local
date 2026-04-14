Oliver Chase workspace notes

- GitHub SSH auth is working for account `oliver-chase` via `git@github.com:...` remotes.
- Prefer SSH remotes for clone/fetch/pull/push. Do not rely on the current shell `GH_TOKEN`; `gh auth status` reported it invalid on 2026-04-14.
- Main working repos:
  - `/Users/oliver/projects/tesknota`
  - `/Users/oliver/projects/ops-dashboard`
- Additional repos already present locally:
  - `/Users/oliver/projects/fallow`
  - `/Users/oliver/projects/v-two-sdr`
- `OliverRepo` is the broader local structure/workspace concept, not a separate repo that always needs to be cloned into `/Users/oliver/projects`.
- The active repo roots are under `/Users/oliver/projects`, not `/Users/oliver/OliverRepo/workspaces/work/projects/...`.
- Leave existing uncommitted user changes intact unless explicitly asked to modify them.
