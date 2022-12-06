---
categories:
  - Databases
  - Programming Languages
tags: [SQL]
---

# SQL: Language structure

The structure or syntax of SQL is composite and mirrors that of a natural or logical language. There are overall statements (queries) which subdivide hierarchially into clauses, predicates, and expressions.

## Query

- A statement that updates or retrieves data from a table based on passed-in criteria
- The highest level in the syntax tree, equivalent to a sentence in natural language
- Examples:
  - `SELECT`
  - `UPDATE`
  - `DELETE`
- Applied example:
  - `SELECT name FROM model`

## Clause

- Typically provides parameters for a given query
- For example running a query against a specific table (`FROM`) that satisfies certain conditions (`WHERE`)

## Predicates

- A logical or numerical condition which is passed to a given clause.
- For example `WHERE` a given condition obtains

### Expression

- The lowest level of the hierarchy: field, row names etc
