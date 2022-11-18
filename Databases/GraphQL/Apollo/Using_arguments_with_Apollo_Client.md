---
title: Using arguments with Apollo Client
categories:
  - Databases
tags: [graph-ql, apollo]
---

# Using arguments with Apollo Client

## What are arguments?

- An argument is a value you provide for a particular field in a query.
- The schema must define the arguments that a field accepts (if any)
- The resolver invokes a field's provided arguments to determine how to return specific data
- Some example use cases of arguments:
  - retrieve specific objects
  - filter through a set of objects
  - transform a field's returned value

## Updated schema

In order to demonstrate arguments we need to expand the [original schema](/Databases/GraphQL/Apollo/Apollo_Server.md#example-schema).

Remember a Track is a group of modules that teaches about a specific topic. We are going to add:

- `description` and `numberOfViews` fields to the original `Track` type
- A new `Module` type
- A field `modules` to the `Track` type that will be an array of type `Module`

```js
type Query {
  tracksForHome: [Track!]!
}

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

## Adding additional query

> Currently we only have one query in the schema (`tracksForHome`) and this returns an array of all the tracks. To demonstrate arguments we want to return a specific track by its `id`. We are going to add a query that enables this.

```js
type Query {
    track(id: ID!):  Track
}
```

This query will take an `id` as an argument and the resolver will match the `id` to a given track and return that `Track`.

To define an argument for a field in the schema we add parentheses after the field name. In the parentheses we write the name of the argument and its type. If we have more than one argument we can separate them with commas.

## Create resolver for new query

Now we have to create a resolver for our new `track` query. We will quickly run through the [server-side process](/Databases/GraphQL/Apollo/Apollo_Server.md).

### Update our `RESTDataSource`

```js
class TrackAPI extends RESTDataSource {
  constructor() {...}
  getTracksForHome() {...}
  getAuthor(authorId) {...}

  getTrack(trackId){
    return this.get(`track/${trackId}`);
  }
}

```

### Add resolver to `resolvers.js`

```js
const resolvers = {
  Query: {
    tracksForHome: (_, __, { dataSources }) => {
      return dataSources.trackApi.getTracksForHome();
    },
    track: (_, { id }, { dataSources }) => {
      return dataSources.trackAPI.getTrack(id);
    },
  },
  Track: {
    author: ({ authorId }, _, { dataSources }) => {
      return dataSources.trackApi.getAuthor(authorId);
    },
  },
};
```

### Making a query

With the server changes complete, we can now issue a query with an argument from the client:

```gql
query track(id: 'xyz'){
  title
}
```

This will return the `title` field from the track with the specific id. This query complies with the schema since the `Track` type has the field `title`

### Resolver chains

What about the following query:

```gql
query track(id: 'xyz'){
  title
  author {
    name
  }
}
```
