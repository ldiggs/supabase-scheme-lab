# Exercise 02 — Indexing Strategy

## Goal

Practice identifying which columns need indexes based on query patterns, and documenting the before/after impact.

## Sample Query Pattern

```sql
select * from orders
where customer_id = $1
order by order_date desc
limit 25;
```

## Exercise Steps

1. Run `explain analyze` on the query against an unindexed `orders` table and record the plan (expect a sequential scan).
2. Add a composite index: `create index idx_orders_customer_date on orders (customer_id, order_date desc);`
3. Re-run `explain analyze` and compare the plan (expect an index scan).
4. Document the tradeoff: faster reads, marginally slower writes, additional storage.

## Notes

- Composite index column order matters: put the equality-filtered column first, the sorted column second.
- Over-indexing every column "just in case" is itself a design smell — each index has a write-time and storage cost.

## Disclaimer

> This schema is a sanitized learning version based on independent development work. It does not contain production data, private credentials, proprietary logic, or real customer records.
