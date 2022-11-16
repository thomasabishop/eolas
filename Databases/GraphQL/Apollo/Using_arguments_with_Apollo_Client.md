---
title: Using arguments with Apollo Client
categories:
  - Databases
tags: [graph-ql, apollo]
---

# Using arguments with Apollo Client

In order to demonstrate arguments we need to expand the [original schema](/Databases/GraphQL/Apollo/Apollo_Server.md#example-schema).

Remember a Track is a group of Modules that teaches about a specific topic. We are going to add:

- `description` and `numberOfViews` fields to the original `Track` type
- A new `Module` type
- A field `modules` to the `Track` type that will be an array of type `Module`

## Updated schema

```js
type Track {
    id: ID!
    title: String!
    author: Author!
    thumbnail: String
    length: Int
    modulesCount: Int
    description: String
    numberOfViews: Int
    modules: [Module!]!
}

type Module {
    id: ID!
    title: String!
    length: Int
}

type Author {
    id: ID!
    name: String!
    photo: String
    }
```
