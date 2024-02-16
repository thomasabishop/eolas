---
categories:
  - Databases
  - Programming Languages
tags: [SQL]
---

# Aggregate functions in SQL

Aggregate functions enable us to return data about the data that a table holds.
For example the sum of a given column or its average.

## Count return with custom variable

```sql
SELECT COUNT(*) AS total_sales
FROM SALES
```

## Sum

```sql
SELECT SUM(price) as total_value
FROM sales
```

## Average

```sql
SELECT AVG(price) as average_income
FROM sales
```

## Applying aggregate function with sorting applied

```sql
SELECT COUNT(*) AS total_sales
FROM sales
GROUP BY employee_id
```
