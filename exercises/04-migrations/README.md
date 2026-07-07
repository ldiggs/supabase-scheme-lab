# Exercise 04 — Migrations

## Goal

Practice writing safe, forward-only migrations for an evolving schema, including a column addition, a backfill, and a constraint addition — done as separate, ordered steps.

## Migration Sequence (Illustrative)

**Step 1 — Add nullable column**

```sql
alter table users add column display_name text;
```

**Step 2 — Backfill existing rows**

```sql
update users set display_name = split_part(email, '@', 1)
where display_name is null;
```

**Step 3 — Add constraint once backfilled**

```sql
alter table users alter column display_name set not null;
```

## Notes

- Splitting "add column," "backfill," and "add constraint" into separate migrations avoids locking large tables on a single blocking operation and keeps each step independently reversible.
- A `not null` constraint should never be added in the same migration as the column itself if the table already has rows.

## Disclaimer

> This schema is a sanitized learning version based on independent development work. It does not contain production data, private credentials, proprietary logic, or real customer records.
