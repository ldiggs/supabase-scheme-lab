# Exercise 01 — Normalization

## Goal

Take a deliberately denormalized sample dataset and normalize it step by step, documenting the reasoning and tradeoffs at each stage.

## Starting Point (Denormalized)

```
orders_flat(
  order_id, customer_name, customer_email,
  product_name, product_category, product_price,
  quantity, order_date
)
```

## Steps

1. **1NF** — Confirm atomic columns, no repeating groups. `orders_flat` is already 1NF.
2. **2NF** — Identify partial dependencies. `customer_name`/`customer_email` depend only on the customer, not the full order+product key. Split into `customers`.
3. **3NF** — Identify transitive dependencies. `product_category` and `product_price` depend on `product_name`, not on the order. Split into `products`.
4. **Result** — `customers`, `products`, `orders`, `order_items`.

## Result Schema

See `../../sql/reference-schemas.sql` for the normalized version of this exercise.

## Tradeoffs Documented

- Normalization reduces update anomalies (a product price change only touches one row) at the cost of requiring joins for reporting queries.
- For a read-heavy reporting table, a denormalized materialized view built *from* the normalized schema is often the right compromise, rather than denormalizing the source of truth.

## Disclaimer

> This schema is a sanitized learning version based on independent development work. It does not contain production data, private credentials, proprietary logic, or real customer records.
