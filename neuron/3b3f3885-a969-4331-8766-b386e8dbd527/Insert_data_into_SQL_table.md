---
tags:
  - SQL
  - databases
---

# Insert data into table with SQL `INSERT` statement

_A table named `sales`:_

| saleId | modelId | date       | salesPerson |
| ------ | ------- | ---------- | ----------- |
| 223    | 2       | 2020-01-09 | tgomay      |
| 321    | 3       | 2020-03-14 | snedgamon   |
| 491    | 4       | 2021-08-06 | tricksahoy  |

```sql
INSERT INTO sales
VALUES (1, 11, '2020-01-01','mhogan');
```

> If you intend to miss out a value, you shouldn't leave it blank, you should
> instead use `NULL` :

```sql
INSERT INTO sales
VALUES (1, 11, '2020-01-01', NULL);
```

> The approach above works well if the order of entry matches the order of the
> table fields. If this is not the case you can specify the order as part of the
> `INSERT` statement:

```sql
INSERT INTO sales**(employee_id, sale_id, model_id, sale_date)**
VALUES ('mhogan', 1, 11, '2020-01-01',);
```
