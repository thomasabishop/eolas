---
categories:
  - Databases
  - Programming Languages
tags: [SQL, relational-databases]
---

# Retrieve data from table with SQL `SELECT` statement

> Select data from the database. The data returned is stored in a result table called the **result-set**.

_A table named `models`:_

| modelId | name                 | cores | releaseDate |
| ------- | -------------------- | ----- | ----------- |
| 2       | Raspberry Pi Model B | 2     | 2022-11-19  |
| 3       | Raspberry Pi Model C | 4     | 2022-11-25  |
| 4       | MacBook Pro M2       | 9     | 2022-03-18  |

## Basic usage

```sql
SELECT name FROM models
```

We can pass in a comma-separated **list of fields**:

```sql
SELECT name, releaseDate FROM models
```

## With parameters

### `WHERE`

The `WHERE` clause specifies a search criterion. The `WHERE` clause should always be last in the syntax. The clauses are always written in this order: `FROM` followed by `WHERE`

```sql
SELECT name FROM models WHERE cores > 3
```

### Compound statements

Compound statements allow you to apply more filters to your clauses within an SQL statement. SQL allows you to build complex, combinatorial `WHERE` clauses by using Boolean and mathematical operators (i.e `AND` , `OR` , `>` , `<` , `!=` , `<=` ...)

Multiple clauses:

```sql
SELECT name, ram, release_date
FROM model
WHERE release_date > '2018-01-01' AND ram > 512;
```

More complex logic achieve with parentheses:

```sql
SELECT name, cores, release_date
FROM model
WHERE (manufacturer_id = 1 OR manufacturer_id = 2) AND cores >= 2;
```

## Transform returned data

We can apply **ordering** to the return data

```sql
SELECT name FROM models ORDER BY name, cores
SELECT name FROM models ORDER BY name, cores DESC
```

> `ORDER BY` always comes last, after the selection and any filtering clauses but _before_ a `WHERE` clause

## Paginate

We can break our returned data into blocks with `LIMIT`

```sql
LIMIT 5 -- Return first five items
LIMIT 5,5 -- Return first five items from the sixth row
```
