---
categories:
  - Databases
tags: [relational-databases]
---

# Unique key

> Every table in a relational database should have a **unique key**. A unique
> key is one **field that uniquely identifies each record**.

This is essential for carrying out operations across database tables and for
creating and deleting database entires in accordance with the
[ACID principle](/Databases/ACID_principle.md). It is also a safeguard: it means
you can always identify a record by itself and don't have to rely on generic
queries to identify it.

Sometimes you will have a dedicated field such as `UNIQUE_ID` for the unique
key. Other times you can use an existing field to fulfil that function. When an
existing, visible column is used as the unique key it is called the **primary
key**. Other times the unique key can be hidden from the table.

In both cases the following constraints **must be met:**

1. No two records can have the **same** primary key data
1. The primary key value should **never be reused**. Thus, if a record is
   deleted from the table, it should not be re-allocated to a new record.
1. A primary key value **must not be modified** once it has been created
1. A primary key **must have a value**; it cannot be `null`
