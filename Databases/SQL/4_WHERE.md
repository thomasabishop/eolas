---
categories:
  - Databases
  - Programming Languages
tags: [SQL]
---

# SQL: The WHERE clause and compound statements

Within the `SELECT` statement, the `WHERE` clause specifies the search criterion. The `WHERE` clause should always be last in the syntax. The clauses are always written in this order: `FROM` followed by `WHERE`.

`SELECT name, cores, release_date FROM model WHERE CORES="4";`:

```
name                    cores       release_date
----------------------  ----------  ------------
Raspberry Pi 2 Model B  4           2015-02-01
Raspberry Pi 3 Model B  4           2016-02-01
Raspberry Pi 3 Model B  4           2018-03-14
Raspberry Pi 3 Model A  4           2018-11-01
Raspberry Pi 4 Model B  4           2019-06-24
Raspberry Pi 4 Model B  4           2019-06-24
Raspberry Pi 4 Model B  4           2019-06-24
Apple iMac              4           2019-03-19
```

## Compound statements

Compound statements allow you to apply more filters to your clauses within an SQL statement. SQL allows you to build complex, combinatorial `WHERE` clauses by using Boolean and mathematical operators (i.e `AND` , `OR` , `>` , `<` , `!=` , `<=` ...)

Multiple clauses:

```sql
SELECT name, ram, release_date
FROM model
WHERE release_date > '2018-01-01' AND ram > 512;
```

More complex logic achieve with parentheses:

```sql
SELECT name, cores, release_date
FROM model
WHERE (manufacturer_id = 1 OR manufacturer_id = 2) AND cores >= 2;
```

## Wildcards

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
