# Exercise 03 — Row-Level Security (RLS) Concepts

## Goal

Practice writing RLS policy concepts for a multi-tenant-style table. This is illustrative policy design, not a live/deployed policy.

## Sample Table

```sql
create table user_progress (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null,
  lesson_id uuid not null,
  status text default 'not_started'
);
```

## Policy Design (Illustrative)

```sql
-- Enable RLS
-- alter table user_progress enable row level security;

-- A user may only read their own progress rows
-- create policy "users read own progress"
--   on user_progress for select
--   using (auth.uid() = user_id);

-- A user may only insert progress rows for themselves
-- create policy "users insert own progress"
--   on user_progress for insert
--   with check (auth.uid() = user_id);
```

## Notes

- RLS policies should be written and reasoned about *per operation* (select/insert/update/delete) rather than as one blanket rule.
- A common mistake is writing a `using` clause without a matching `with check` clause on insert/update, which allows a user to create rows that violate the read policy.

## Disclaimer

> This schema is a sanitized learning version based on independent development work. It does not contain production data, private credentials, proprietary logic, or real customer records.
