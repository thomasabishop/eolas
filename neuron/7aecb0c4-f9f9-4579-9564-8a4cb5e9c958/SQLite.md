---
tags: [databases, SQL, SQLite]
created: Wednesday, November 13, 2024
---

# SQLite

## Enabling foreign key constraints

Foreign key constraints are not enabled by default - it is very permissive. You
must manually turn them on, as part of the connection process:

```py
connection = sqlite3.connect("my_database.db")
connection.execute("PRAGMA foreign_keys = ON")
```

## INSERT OR IGNORE INTO

If table has a `UNIQUE` constraint on a field, insert if it is unique otherwise
skip without throwing a constraint error.

```sql
INSERT OR IGNORE INTO table_name (value) VALUES (:value)
```

## exec and fetchall

For `CREATE`, `INSERT`, `UPDATE`, `DELETE` operations it is sufficient to simply
use `execute` to carry out the operations:

```py
cursor = connection.cursor()
cursor.execute(sql)
```

For `SELECT` operations, you must add a return statement that uses `fetchall`:

```py
sql = "SELECT * FROM table"
cursor = connection.cursor()
cursor.execute(sql)
return cursor.fetchall()
```

## SELECT response data type

A `SELECT` operation returns a [list](Lists_in_Python.md) of
[tuples](Tuples_in_Python.md) where each entry in the tuple is a returned field.

For example:

```py
entries_sql = "SELECT title, size FROM entries"

entries_response = cursor.execute(entries_sql)
print(cursor.fetchall())
# [('Lorem ipsum', 127), ('Dolar sit', 4231)]
```
