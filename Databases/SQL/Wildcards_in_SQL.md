---
categories:
  - Databases
  - Programming Languages
tags: [SQL, relational-databases]
---

# Wildcards in SQL

SQL does not use Regex. Instead it has a simpler glob-like syntax for carrying out string matching.

In order to signal that you wish to compare by a wildcard and not a value, you have to use the `LIKE` keyword. The actual wildcard operator is `%` .

In an SQL statement, the `%` wild card will match any number of occurrences of any character.
Any characters can appear before or after ‘MacBook’ and the record will still be returned:

```sql
SELECT name, cores, release_date
FROM model
WHERE name LIKE '%MacBook%';
```

This wildcard only filters characters that come after `Raspberry` :

```sql
SELECT name, cores, release_date
FROM model
WHERE name LIKE 'Raspberry%';
```
