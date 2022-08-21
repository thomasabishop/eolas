---
categories:
  - Databases
  - Programming Languages
tags: [SQL]
---

# SQL: Joins

Once a relationship has been created using primary and foreign keys (as detailed in the previous section), you are able to combine and integrated data from the different tables. This is known as performing **joins.**

## Inner joins

We can demonstrate this with the following scenario:

> We want to create a list of the name of all computers that have been sold and when they were sold.

This will require us to use the `name` field from the `model` table and the `sale_date` field from the `sales` table.

Here's the SQL:

```sql
SELECT model.name, sales.sale_date
FROM model
INNER JOIN sales on model.model_id = sales.model_id;
```

- We use dot notation to distinguish the `table.field` for each table.
- We use `INNER JOIN` to join the `sales` table with the `model` table where `model_id` field in `model` is the same as the `model_id` field in `sales`

This returns:

```sql
name                     sale_date
--------------------     ----------
Raspberry Pi 2 Mo  4     2015-02-01
Raspberry Pi 3 Mo  4     2018-11-01
```

Note data will only be returned when there is a match between both fields stated in the `SELECT` clause. There must be corresponding data between `model.name` and `sale.sale_data` for a row to be returned. For example if there is a model that has not been sold, there will be a `mode.model_name` but no `sale_data` .

![](/img/model_sales_inner_join_step2.jpg)

## Outer joins

In the example above, we used the `INNER JOIN` method. This enshrines the logic:

> return only rows where there is a matching row in both tables

Which in the applied context means:

- If there is a model that has never been sold, it won’t be returned
- If there is a sale without a model, it won’t be returned

But there are other types of join that satisfy other types of logic.

The logical state that obtains in the case of **inner joins**:

![1_3.7-Inner_Join_Venn.png](/img/1_3.7-Inner_Join_Venn.png)

The logical state that obtains in the case of **left outer joins**
![](/img/2_3.7-Inner_Join_Left.png)

The logical state that obtains in the case of **right outer joins**:

![3_3.7-Inner_Join_Right.png](/img/3_3.7-Inner_Join_Right.png)

The logical state that obtains in the case of **full outer joins**:

![4_3.7-Full_Outer_Join.png](/img/4_3.7-Full_Outer_Join.png)

This type of join is used when you want to discern when there is _not_ a match between two fields across tables. For example: imagine that you wanted a list of computers that had never been sold. In this case, you would be interested in rows where there is a `model_id` without a corresponding `sales_id` .

In SQL this would be achieved with:

```sql
SELECT model.name, sales.sale_date
FROM model
LEFT JOIN sales on model.model_id = sales.model_id;
```

Note that this would return all the model names but where there isn't a sale data, `NULL` would be returned. This is an **important distinction :** the outer join method doesn't just return the rows with a `NULL` value for `sale_date` as we might expect. It returns all models along with those that have not been sold. This is because it is oriented to the "left" table, equivalent to the table in the SQL that we cited first with the `on` keyword.

> A left outer join returns all the records from the left (model) table and those that match in the right (sales) table. Where there are no matching records in the right (sales) table, a `NULL` value is returned.

A **right outer join**, often referred to as a right join, is the opposite of a left outer; it returns all the records from the right table and those that match in the left table. In our scenario this would be all the models that had a `sale_date` including models that didn't have a `sale_date` , i.e which returned `NULL`

Finally, a **full outer join** returns all the records from both tables, and where a record cannot be matched, a NULL value is returned. So this would mean there could be `NULL`s in both fields of the returned rows.

We can combine multiple types of join in the same SQL query:

```sql
SELECT model.name, sales.sale_date, manufacturer.url
FROM model
LEFT JOIN sales on model.model_id = sales.model_id
INNER JOIN manufacturer on model.manufacturer_id = manufacturer.manufacturer_id;
```
