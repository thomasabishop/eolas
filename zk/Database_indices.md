---
tags: [relational-databases]
---

# database indices

A database index is best understood by analogy with physical data. Imagine
needing to find information about a specific topic in a very long book. Without
being able to turn to the back and consult the index we would need to scan every
page of the book looking for information on the topic we are seeking.

Similarly with a database if we are looking for a specific value in a very long
table it can be computationally costly and slow to iterate through every row
looking for a specific value (this is known as a "full table scan").

For this reason we use indexes. In a database an index is like a shortcut or
quick reference guide. However instead of page numbers as in the book analogy,
the database index has pointers to the actual location of the rows in the table.
If an index is applied to a given column, when an element in that column is
requested, the database will not scan every row, instead it will go straight to
the element using the index.

Say we are looking for the surname "Bishop" in a table that consists of
`lastName` and `phoneNumber` . If we apply an index to the `lastName` column,
the database will have a direct reference to the row that "Bishop" is in and
thus can return the `phoneNumber` value more quickly.

Although the programmer can explicitly create indexes, the way the database
utilises it is largely abstracted from view. Most RDMSs will automatically
decide which index to use for query optimisation however the programmer can also
use hints to force the use of a specific index.

The main thing is to think about data points that would benefit from an index,
for instance for the most heavily used queries or those that run against the
longest tables.

While indices make lookups more performant, they should be used judiciously as
they increase the storage space the database requires and can incresae the
execution time of queries that insert or update records. (This makes sense, as
any update to a row, requires a reindexation of the table.)

The best use case for an index is for data retrieval that utilises `WHERE`
clauses.

## SQL syntax

```sql
CREATE INDEX index_name ON table_name(column_name)
```
