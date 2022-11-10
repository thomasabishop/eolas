---
categories:
  - Databases
tags: [graph-ql]
---

# Schema Definition Language

SDL is the formal name for the syntax of GraphQL schemas.

A schema is a collection of object types that contain fields. Each field has a type of its own. A field's type can be a primitive/scalar value (such as an Int or a String), or it can be another object type (just like a custom type in TS).

A schema's type can be non-nullable which is to say, a required field. We indicate this with `!`.

A type for a field can be a collection/array of a given type.

The following example indicates these properties:

```gql
type Person {
  age: Int
  name: String
  pets: [Pet]!
}

type Pet {
  species: String
  name: String
  age: Int
}
```

## Descriptions

Descriptions are comments that allow you to document your Schema

Single line:

```gql
"Single line comment"
```

```gql
"""
Multi
line
comment
"""
```
