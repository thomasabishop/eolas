---
categories:
  - Databases
tags: [mongo-db]
---

# MongoDB: Introduction

MongoDB is not a relational database system like SQL, instead it is
document-based which means you do not neeed to design database tables and
schema, you are simply storing data as JSON and there is no transformation of
the data.

Most of the notes on Mongo will introduce it within the context of Node.js
backend. We will be sending Javascript objects and arrays to Mongo and returning
them as JSON.

## Databases, collections, documents

Although Mongo is not a relational database it has a structure that we can
understand in relation to that paradigm. A **database** is obviously the overall
structure. It comprises **collections** which are organised sets of data that
are analagous to [tables](/Databases/Relational_database_architecture.md#table)
in RDBs. Within each collection are a series of **documents** which we can think
of as being equivalent to [rows](/Databases/Relational_database_architecture.md)
in RDB table: units that comprise the collection.

A document is a container comprising key-value pairs in the manner of an object.

![](/_img/mongo-db-structure.svg)
