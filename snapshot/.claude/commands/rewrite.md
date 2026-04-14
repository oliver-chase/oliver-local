A feature, file, or functionality is being replaced or migrated.

Before writing any code:
1. List every file and piece of logic tied to the old implementation.
2. Produce a deletion list: what gets removed entirely vs. carried forward.
3. Write the new implementation from scratch in the target file(s).
4. Delete or clear the old implementation — no dead code, no legacy branches, no leftover imports.
5. Verify the result is self-contained and runs independently.

Do not append. Do not patch. Do not preserve old logic as a fallback.
