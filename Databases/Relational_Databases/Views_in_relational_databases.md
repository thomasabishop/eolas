---
categories:
  - Databases
tags: [relational-databases]
---

# Views in relational databases

A view is a virtual table that is based on the result-set of a query. Although
it doesn't actually exist in the same manner as an actual table it has exactly
the same properties and functionality. Rather than adding the raw data manually,
you derive it from logic applied to existing actual tables.

This is a good way of dynamically generating data and is often employed as a way
of creating mutations without changing the underlying data structure. In SQL,
views can be created by combining `PRIMARY` and `FOREIGN` keys.
