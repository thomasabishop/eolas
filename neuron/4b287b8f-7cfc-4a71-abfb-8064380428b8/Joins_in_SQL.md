---
tags:
  - SQL
  - databases
---

# Joins in SQL

<!-- Once a relationship has been created using primary and foreign keys (as detailed in the previous section), you are able to combine and integrate data from the different tables. This is known as performing **joins.** -->

We perform joins in SQL when we combine and integrate data from multiple tables.
In order for a join to be possible, **the tables you want to join must have rows
that share the same fields**.

The output will be represented as a table but it is virtual, not an actual
table. (If you wish to actually create a table or a view off the back of a join
operation you should combine the join with the
[`CREATE TABLE`](Create_an_SQL_table.md) command etc.)

## Inner joins

> An inner join combines rows that have matching values in two or more tables.
> This join is based on the existence of a common field between the tables and
> is used to retrieve data that appears in both tables.

The following is a good scenario for creating an inner join:

> We want to create a list of the name of all computers that have been sold and
> when they were sold.

We will be working from the following tables.

_The `sales` table_:

| saleId | modelId | saleDate   | employeeId | price   |
| ------ | ------- | ---------- | ---------- | ------- |
| 1      | 44      | 2020-07-27 | tbishop    | 40.99   |
| 2      | 22      | 2021-02-05 | tbishop    | 986.99  |
| 3      | 14      | 2022-11-16 | tgnomay    | 1248.99 |

_The `model` table_:

| modelId | modelName            |
| ------- | -------------------- |
| 44      | Raspberry Pi Model A |
| 22      | Apple MacBook Air    |
| 14      | Lenovo ThinkPad P15  |

The data points we need are not provided in a single table. `sales` gives us the
`saleDate` but not the `modelName`. In order to meet our requirements we must
perform a join that combines `modelName` from the `model` table and `saleDate`
from the `sale` table to give us a table like the following:

| modelName            | sale_date  |
| -------------------- | ---------- |
| Raspberry Pi Model A | 2015-02-01 |
| Apple Macbook Air    | 2018-11-01 |
| Lenovo ThinkPad P15  | 2018-11-01 |

We can do this by utilising the field they have in common: `modelId`.

### Implementation

The general syntax for creating an inner join from two tables that share a
common field is as follows:

```sql
SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.columnName = table2.columnName
```

So basically, look at `table1` and `table2` return the rows where the fields for
`table1` and `table2` match, where these fields are the ones specified in the
`SELECT`.

Applied to our example:

```sql
SELECT model.modelName, sales.saleDate -- Name the fields
FROM model -- Specify the first table
INNER JOIN sales -- Specify the second table
ON model.model_id = sales.model_id; -- Specify the match criteria
```

> It is important to note that the match must _be_ a match. Both tables must
> have a row with the same value for `modelId` for the join to be applied. If
> there is a `modelId` of X in `sales` but no corresponding X for `modelId` in
> `model`, nothing will be returned for that row.

We can represent the logical relationship that obtains between the `sales` and
`model` tables as follows:

![](static/sql-inner-join.png)

## Outer joins

Outer joins are joins that return matched values **and unmatched** values from
either or both tables.

To explain outer joins we need to expand our data set:

_The `sales` table_:

| saleId | modelId | saleDate   | employeeId | price   |
| ------ | ------- | ---------- | ---------- | ------- |
| 1      | 44      | 2020-07-27 | tbishop    | 40.99   |
| 2      | 22      | 2021-02-05 | tbishop    | 986.99  |
| 3      | 14      | 2022-11-16 | tgnomay    | 1248.99 |
| 4      |         | 2020-03-01 | msmelk     | 699.99  |

_The `model` table_:

| modelId | modelName            |
| ------- | -------------------- |
| 44      | Raspberry Pi Model A |
| 22      | Apple MacBook Air    |
| 14      | Lenovo ThinkPad P15  |
| 66      | Google Chromebook    |

> We will assume that `sales` is our left table and `model` our right.

### Left outer join

A left outer join returns all records from the left or first table and the
matching records from the right or second table. If there are not matches on the
right then only the left data is returned.

In the context of our dataset, in the _sales_ database we have a row where there
is a sale with no corresponding `modelId`. If we performed a left outer join
this would give us the following table in return:

| modelName            | sale_date  |
| -------------------- | ---------- |
| Raspberry Pi Model A | 2015-02-01 |
| Apple Macbook Air    | 2018-11-01 |
| Lenovo ThinkPad P15  | 2018-11-01 |
|                      | 2020-03-01 |

The logical relationship sustained between `sales` and `model` by a left inner
join is represented in the following diagram:

![](static/sql-left-outer-join.png)

#### Implementation

The schematic form:

```sql
SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;
```

Applied to our data set:

```sql
SELECT model.modelName, sales.saleDate
FROM sales.saleDate
LEFT JOIN model
ON sales.modelId = model.modelId
```

### Right outer join

This is the inverse of the right outer join. A right outer join returns all
records from the right or second table and the matching records from the left or
first table. If there are not matches on the left then only the right data is
returned.

In the context of our dataset, in the _model_ database we have a row where there
is a `modelId` without a corresponding entry in the `sales` table. If we
performed a right outer join this would give us the following table in return:

| modelName            | sale_date  |
| -------------------- | ---------- |
| Raspberry Pi Model A | 2015-02-01 |
| Apple Macbook Air    | 2018-11-01 |
| Lenovo ThinkPad P15  | 2018-11-01 |
| Google Chromebook    |            |

The logical relationship sustained between `sales` and `model` by a right inner
join is represented in the following diagram:

![](static/sql-right-outer-join.png)

#### Implementation

The schematic form:

```sql
SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;
```

Applied to our data set:

```sql
SELECT model.modelName, sales.saleDate
FROM sales.saleDate
RIGHT JOIN model
ON sales.modelId = model.modelId
```

### Full outer join

The full outer join returns all rows when there is a match in either the left or
the right table. So, for table A and table B the full join returns all rows in A
and all rows in B including those where there is a match between A and B. This
is the broadest type of join and can often result in large data sets.

In the context of our dataset it would result in the following table being
generated:

| modelName            | sale_date  |
| -------------------- | ---------- |
| Raspberry Pi Model A | 2015-02-01 |
| Apple Macbook Air    | 2018-11-01 |
| Lenovo ThinkPad P15  | 2018-11-01 |
|                      | 2020-03-01 |
| Google Chromebook    |            |

Represented by the following diagram:

![](static/sql-full-outer-join.png)

#### Implementation

The schematic form:

```sql
SELECT column_name(s)
FROM table1
FULL OUTER JOIN table2
ON table1.column_name = table2.column_name;
```

Applied to our data set:

```sql
SELECT model.modelName, sales.saleDate
FROM sales.saleDate
FULL OUTER JOIN model
ON sales.modelId = model.modelId
```

This type of join is used when you want to discern when there is _not_ a match
between two fields across tables. For example: imagine that you wanted a list of
computers that had never been sold. In this case, you would be interested in
rows where there is a `model_id` without a corresponding `sales_id` .

In SQL this would be achieved with:

```sql
SELECT model.name, sales.sale_date
FROM model
LEFT JOIN sales on model.model_id = sales.model_id;
```

Note that this would return all the model names but where there isn't a sale
data, `NULL` would be returned. This is an **important distinction :** the outer
join method doesn't just return the rows with a `NULL` value for `sale_date` as
we might expect. It returns all models along with those that have not been sold.
This is because it is oriented to the "left" table, equivalent to the table in
the SQL that we cited first with the `on` keyword.

> A left outer join returns all the records from the left (model) table and
> those that match in the right (sales) table. Where there are no matching
> records in the right (sales) table, a `NULL` value is returned.

A **right outer join**, often referred to as a right join, is the opposite of a
left outer; it returns all the records from the right table and those that match
in the left table. In our scenario this would be all the models that had a
`sale_date` including models that didn't have a `sale_date` , i.e which returned
`NULL`

Finally, a **full outer join** returns all the records from both tables, and
where a record cannot be matched, a NULL value is returned. So this would mean
there could be `NULL`s in both fields of the returned rows.

We can combine multiple types of join in the same SQL query:

```sql
SELECT model.name, sales.sale_date, manufacturer.url
FROM model
LEFT JOIN sales on model.model_id = sales.model_id
INNER JOIN manufacturer on model.manufacturer_id = manufacturer.manufacturer_id;
```
