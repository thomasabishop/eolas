---
tags: [SQL, relational-databases, regex]
---

# Regular expressions in SQL

```sql
SELECT name FROM country WHERE name RLIKE '[xy][ai]' ORDER BY name;

Guyana
Mexico
Myanmar
```
