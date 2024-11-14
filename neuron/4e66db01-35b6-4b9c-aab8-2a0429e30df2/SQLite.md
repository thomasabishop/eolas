---
tags: [databases, SQL, SQLite]
created: Wednesday, November 13, 2024
---

# SQLite

## INSERT OR IGNORE INTO

If table has a `UNIQUE` constraint on a field, insert if it is unique otherwise
skip without throwing a constraint error.

```sql
INSERT OR IGNORE INTO table_name (value) VALUES (:value)
```
