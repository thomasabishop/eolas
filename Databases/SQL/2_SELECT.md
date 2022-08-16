---
categories:
  - Databases
  - Programming_Languages
tags: [SQL]
---

# SQL: The SELECT query

## Print/retrieve/write an entire table, unfiltered

```sql
SELECT * FROM [table_name]

SELECT * FROM model
```

## Retrieve all data from a specific field

```sql
SELECT [field_name] FROM [table_name]

SELECT name FROM manufacturer
```

## Retrieve data and order it

This example orders alphabetically:

```sql
SELECT [field_name] FROM [table_name] ORDER BY [property]
SELECT name FROM model ORDER BY name
```

> When `ORDER BY` is used the default method for strings is alphabetical and for integers it is ascending order.

Here's a more complex real-life request:

```sql
SELECT name, cores, ram FROM model ORDER BY ram, name
```

It gives us:

```
name              cores       ram
----------------  ----------  ----------
Commodore VIC-20  1           0.005
Commodore 64      1           0.064
Amiga 500         1           0.5
Apple Lisa        1           1.0
Raspberry Pi 1 M  1           256.0
Raspberry Pi 1 M  1           256.0
Raspberry Pi 1 M  1           512.0
Raspberry Pi 1 M  1           512.0
Raspberry Pi 1 M  1           512.0
Raspberry Pi Zer  1           512.0
```

But we can obviously specify our own ordering method:

```sql
SELECT name, cores, release_date FROM model ORDER BY cores DESC, name;
```

Returns:

```
name               cores       release_date
-----------------  ----------  ------------
Apple MacBook Pro  6           2019-05-21
Apple iMac         4           2019-03-19
Raspberry Pi 2 Mo  4           2015-02-01
Raspberry Pi 3 Mo  4           2018-11-01
Raspberry Pi 3 Mo  4           2016-02-01
Raspberry Pi 3 Mo  4           2018-03-14
Raspberry Pi 4 Mo  4           2019-06-24
Raspberry Pi 4 Mo  4           2019-06-24
Raspberry Pi 4 Mo  4           2019-06-24
```

> `ORDER BY` always comes last, after the selection and any filtering clauses but _before_ a `WHERE` clause
