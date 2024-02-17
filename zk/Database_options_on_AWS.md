---
tags: [AWS]
---

# Database options

Amazon offers numerous database options however they are often named differently
or are Amazon's own implementation of a certain database type:

- **Relational databases**

  - Amazon offers two core RDSs: **Amazon Aurora** and **Amazon RDS**. Both
    allow you to use MySQL and PostgreSQL as the management implementation. The
    differences come down to which management implmentations are supported,
    number of backups and throughput. For instance Aurora has higher
    performance, more logging and fail-safes.

- **NoSQL**
  - Document-based databases
    - The obvious candidate for this kind of database is MongoDB. Amazon doesn't
      offer MongoDB it offers its own implementation which is almost identical
      and compatible with Mongo: **Amazon DocumentDB**. (There is some bitching
      about this from Mongo but they are competitors.)
  - Key-value database
    - A key-value database is basically a hash-table or a map
    - The Amazon implementation of this is **DynamoDB**
    - Confusingly, for NoSQL, a DynamoDB instance comprises "tables" which are
      groupings of keys and values. I guess "table" here is meant in terms of
      "hash table"
    - A cool feature is that you can subscribe to a DynamoDB table and run a
      lambda when a value changes.
