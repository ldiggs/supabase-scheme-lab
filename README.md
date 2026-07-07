# supabase-schema-lab (Future Repo — Starter Plan)

## Repo Description

A focused learning lab for practicing Supabase/PostgreSQL schema design in isolation from any specific application — normalization, constraints, indexing, row-level security concepts, and migration structure.

## README Outline

1. Purpose and scope (schema design practice, not a full app)
2. What's covered: normalization, keys/constraints, indexing strategy, RLS concepts, migrations
3. How to read the lab (one folder per exercise)
4. Disclaimer
5. Interview positioning

## Folder Structure

```
supabase-schema-lab/
├── README.md
├── exercises/
│   ├── 01-normalization/
│   ├── 02-indexing-strategy/
│   ├── 03-row-level-security/
│   └── 04-migrations/
└── sql/
    └── reference-schemas.sql
```

## Suggested Learning Exercises

- Take a denormalized sample dataset and normalize it into 3rd normal form, documenting the tradeoffs at each step.
- Add indexes to a query-heavy table and document before/after query plans (`EXPLAIN ANALYZE`).
- Write RLS policy concepts for a multi-tenant-style table (e.g., "a user can only read their own rows").
- Practice writing forward-only migrations for an evolving schema (add column, backfill, add constraint).

## Example SQL Contract

```sql
-- Example: row-level security concept (illustrative, not a live policy)
-- alter table user_progress enable row level security;
-- create policy "users read own progress"
--   on user_progress for select
--   using (auth.uid() = user_id);
```

## Interview Value

Demonstrates schema design as a discipline on its own — not just as a byproduct of building a feature — including the ability to reason about indexing, security policy, and migration safety independent of any single application.

## Disclaimer

> This schema is a sanitized learning version based on independent development work. It does not contain production data, private credentials, proprietary logic, or real customer records.
