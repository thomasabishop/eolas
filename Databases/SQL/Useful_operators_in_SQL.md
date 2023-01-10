---
categories:
  - Databases
  - Programming Languages
tags: [SQL, relational-database]
---

# Useful operators in SQL

## True and false

> In SQL false results are represented by `0` and true results are represented by `1`. Any zero value is false and any non-zero value is true.

> When comparing operators we can use `SELECT` as a general "execute" function for SQL to interpret

```sql
SELECT 0 = 0 -- 1
SELECT 0.0 = 0 -- 1
SELECT 9 >= 12 -- 0
```

## Boolean operators

SQL supports all Boolean operators:

```sql
SELECT (9 > 7) AND (3 < 5) -- 1
SELECT (3 > 1) OR (2 > 5) -- 1
SELECT (3 > 1) XOR (5 > 1) -- 0
```

We also have `IS` and `IS NOT` for testing Boolean values:

```sql
SELECT (9 > 7) IS TRUE -- 1
SELECT (9 > 7) IS NOT TRUE -- 0
```

## `NULL`

- `NULL` is neither true (1) or false (0). It has no value.
- An empty string (`""`) is **not** `NULL`

```sql
SELECT 1 IS NULL -- 0
SELECT 1 IS NOT NULL -- 1
SELECT NULL IS NULL -- 1
SELECT "" IS NULL -- 0
```
