---
categories:
  - Databases
tags: [relational-database]
---

# ACID principle

> A database is a collection of organised data that can be efficiently stored, sorted, and searched.

How the data is organised will often determine the _type_ of database used. There are many different types of database; some examples of the different types are relational, object-orientated, graphical, NoSQL, and distributed. All should meet the principles of ACID.

To ensure the integrity of a database, each change or transaction must conform to a set of rules known as ACID:

- **atomicity**
  - when changing data within a database, if any part of the change fails, the whole change will fail and the data will remain as it was before the change was made; this is a safeguard that prevents partial records being created.
- **consistency**
  - before data can be changed in a database, it must be validated against a set of rules
- **isolation**
  - databases allow multiple changes at the same time, but each change is isolated from others
- **durability**
  - once a change has been made, the data is safe, even in the event of system failure

> Databases will have mechanisms for **backup**, **distribution**, and **redundancy**, to ensure data is not lost.
