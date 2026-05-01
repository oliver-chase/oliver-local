# testing-rules

All code changes require tests.

Always:

- Add or update tests for changed behavior.
- Check downstream and adjacent tests for impact.
- Update all impacted downstream and adjacent tests.
- Treat stale or missing impacted test updates as a failure.
- Strengthen weak coverage around changed paths, edge cases, and regressions.
- Do not treat implementation as complete without test alignment.
- Run a new QA pass for all changes, including test-suite-only changes.
