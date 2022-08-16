---
categories:
  - Databases
  - Programming_Languages
tags: [SQL]
---

# SQL: INSERT

## Adding a record

```sql
INSERT INTO sales
VALUES (1, 11, '2020-01-01','mhogan');
```

If you intend to miss out a value, you shouldn't leave it blank, you should instead use `NULL` :

```sql
INSERT INTO sales
VALUES (1, 11, '2020-01-01', NULL);
```

> There is a problem with this format: it only works so long as the order to the values in the `VALUES` clause corresponds to the order of the fields in the tables. To rule out error we should instead specify these fields along with the table name:

```sql
INSERT INTO sales**(employee_id, sale_id, model_id, sale_date)**
VALUES ('mhogan', 1, 11, '2020-01-01',);
```
