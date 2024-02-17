---
tags: [graphql]
---

# Schema Definition Language

SDL is the formal name for the syntax of GraphQL schemas.

## Types

A schema is a collection of object types that contain fields. Each field has a
type of its own. A field's type can be a primitive/scalar value (such as an
`Int` or a `String`), or it can be another object type (just like a custom type
in TS).

A schema's type can be non-nullable which is to say, a required field. We
indicate this with `!`.

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

## Queries

A query is also a schema type but of a special sort.

> The fields of this type are entry points into the rest of the schema. These
> are the top-level fields that the client can query for.

For example if we had this type:

```graphql
type Track {
  id: ID!
    author: Author!
  thumbnail: String
  length: Int
  modulesCount: Int
}
```

We could define a type to access a give `Track` as follows:

```graphql
type Query {
  tracksForHomePage: [Track!]!
}
```

Then use this type as the basis for a query:

```

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
