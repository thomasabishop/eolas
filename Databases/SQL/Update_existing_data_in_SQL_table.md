---
categories:
  - Databases
  - Programming Languages
tags: [SQL]
---

# Update existing data with the SQL `UPDATE` command

We use `UPDATE` to modify existing records in our table.

## Schematic syntax

```sql
UPDATE [table_name]
SET [field]
WHERE [conditional expression/filter]
```

## Example

```sql
UPDATE manufacturer
SET url = '<http://www.hp.co.uk>'
WHERE manufacturer_id = 4; --typically this will be the primary key as you are updating and existing record and need to identify it uniquely
```

## Update multiple fields

```sql
UPDATE manufacturer
SET url = '<http://www.apple.co.uk>',
    year_founded = 1977
WHERE manufacturer_id = 2;
```
