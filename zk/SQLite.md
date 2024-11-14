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
