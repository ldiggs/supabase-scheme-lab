-- Reference schemas for supabase-schema-lab exercises
-- This schema is a sanitized learning version based on independent development work. It does not contain production data, private credentials, proprietary logic, or real customer records.

-- Exercise 01: Normalization result

create table customers (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  email text unique
);

create table products (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  category text,
  price numeric(10,2)
);

create table orders (
  id uuid primary key default gen_random_uuid(),
  customer_id uuid references customers(id),
  order_date timestamptz default now()
);

create table order_items (
  id uuid primary key default gen_random_uuid(),
  order_id uuid references orders(id),
  product_id uuid references products(id),
  quantity integer not null default 1
);

-- Exercise 02: Indexing strategy example
-- create index idx_orders_customer_date on orders (customer_id, order_date desc);
