---
categories:
  - Databases
---

# Fundamental database concepts

> A database is a collection of organised data that can be efficiently stored, sorted, and searched.

How the data is organised will often determine the _type_ of database used. There are many different types of database; some examples of the different types are relational, object-orientated, graphical, NoSQL, and distributed.

## ACID principle

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

## Database management system: DBMS

A DBMS is software that can retrieve, add, and alter existing data in a database. MySQL, PostgreSQL, MongoDB, MariaDB are all examples of DBMSs. You can work with them via programming languages like PHP or through graphical clients such as PHPMyAdmin, MicrosoftSQL, Adminer etc. There is also SQLite which runs on the client not the server, so useful for learning and local development. SQLite is also useful when you need a database specific to a single device without networked communication, such as on mobile.

There are also CLI tools for all the major databases.
