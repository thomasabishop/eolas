---
tags:
  - SQL
  - regex
  - databases
---

# Regular expressions in SQL

```sql
SELECT name FROM country WHERE name RLIKE '[xy][ai]' ORDER BY name;

Guyana
Mexico
Myanmar
```
