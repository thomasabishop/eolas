---
categories:
  - Databases
  - Programming Languages
tags: [SQL, relational-databases]
---

# Creating views with foreign keys

We utilise **foreign** and [primary keys](/Databases/Relational_Databases/Primary_key.md) to create relationships between tables in SQL. Foreign keys link data in one table to the data in another table and are how we cross-reference data in SQL.

In essence you use the primary key of one table to access data in another table. When one table _A_ contains the primary key of another table _B_ as a field, that key is "foreign" to _A_ hence the name.

Let's say we have a `sales` table:

| saleId | modelId | saleDate   | employeeId | price  |
| ------ | ------- | ---------- | ---------- | ------ |
| 1      | 44      | 2020-07-27 | tbishop    | 399.99 |
| 2      | 22      | 2021-02-05 | tbishop    | 200.99 |

In SQL this would be set up as follows:

```sql
CREATE TABLE sales (
  saleId integer PRIMARY KEY,
  modelId integer,
  saleDate date,
  employeeId text,
  price float
)
```

For every model that is sold it is possible for the customer to return it. This data will be kept in another table `returns`. Every model sold will have an entry in `sales` but may or may not have an entry in `returns` (not every customer will return an item).

We want to establish a relationship between the two tables so that if an item is returned we can trace it back to its original sale.

As the `saleId` is the primary key in `sales` this means it is a unique identifier for each model sold. We will therefore use this in our `returns` table to track the sale data.

Here's our `returns` table:

| returnId | saleId | returnDate  | reason                                         |
| -------- | ------ | ----------- | ---------------------------------------------- |
| 7899     | 1      | 2020-11-218 | New device issued under warranty due to defect |
| 6711     | 2      | 2022-09-02  | Returned gift                                  |

In this table `saleId` is identical to `saleId` in sales. It is the primary key in `sales` but a foreign key in `returns`. If a device has been returned it must have an entry in `returns` and the `salesId` of the entry in `returns` must match the `salesId` in `sales`.

This is the primary benefit of utilising foreign keys: they add a restriction. Entries to the table with a foreign key **must** have a value that corresponds with the foreign key column.

We call this a **foreign key contraint**. More explicitly, our contraint is as follows:

> Any value entered into returns.saleId must already exist in sales.salesId

A secondary benefit is that they save us the trouble of repeating data. Without foreign keys we would have to input `saleId` twice in two different tables.

We establish the foreign key reference with ther following SQL:

```sql
CREATE TABLE returns (
	returnId integer PRIMARY KEY,
	saleId integer NOT NULL,
	returnDate date,
	reason text,
	FOREIGN KEY (sale_id) REFERENCES sales(sale_id)
	);
```

A table can have more than one foreign key.

If you delete the source of the foreign key, you also delete its references in tables for which it is a foreign key. This is important to remember. So if a row was deleted from `sales` the row in `returns` with the corresponding `saleId` would also be deleted.
