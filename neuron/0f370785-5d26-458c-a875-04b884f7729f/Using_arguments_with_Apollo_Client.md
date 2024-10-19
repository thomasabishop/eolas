---
tags: [graphql]
---

# Using arguments with Apollo Client

## What are arguments?

- An argument is a value you provide for a particular field in a query.
- The schema must define the arguments that a field accepts (if any)
- The resolver invokes a field's provided arguments to determine how to return
  specific data
- Some example use cases of arguments:
  - retrieve specific objects
  - filter through a set of objects
  - transform a field's returned value

## Updated schema

In order to demonstrate arguments we need to expand the
[original schema](Apollo_Server.md#example-schema).

Remember a Track is a group of modules that teaches about a specific topic. We
are going to add:

- `description` and `numberOfViews` fields to the original `Track` type
- A new `Module` type
- A field `modules` to the `Track` type that will be an array of type `Module`

```js
type Query {
  tracksForHome: [Track!]!
}

type Track {
    id: ID!
        authorId: String! // They added this on the sly
    thumbnail: String
    length: Int
    modulesCount: Int
    description: String
    numberOfViews: Int
    modules: [Module!]!
}

type Module {
    id: ID!
        length: Int
}

type Author {
    id: ID!
    name: String!
    photo: String
}
```

## Adding additional query

> Currently we only have one query in the schema (`tracksForHome`) and this
> returns an array of all the tracks. To demonstrate arguments we want to return
> a specific track by its `id`. We are going to add a query that enables this.

```js
type Query {
    track(id: ID!):  Track
}
```

This query will take an `id` as an argument and the resolver will match the `id`
to a given track and return that `Track`.

To define an argument for a field in the schema we add parentheses after the
field name. In the parentheses we write the name of the argument and its type.
If we have more than one argument we can separate them with commas.

## Create resolver for new query

Now we have to create a resolver for our new `track` query. We will quickly run
through the [server-side process](Apollo_Server.md).

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

With the server changes complete, we can now issue a query with an argument from
the client:

```js
query track(id: 'xyz'){
  title
}
```

This will return the `title` field from the track with the specific id. This
query complies with the schema since the `Track` type has the field `title`

### Resolver chains

What about the following query:

```js
query track(id: 'xyz'){
  title
  author {
    name
  }
}
```

It's not obvious how the resolver should respond to the nested query here since
author name is not a field on `Track`, it is a field on `Author`:

```js
type Track {
  id: ID!
    authorId: String!
  thumbnail: String
  length: Int
  modulesCount: Int
  description: String
  numberOfViews: Int
  modules: [Module!]!
}

type Author {
  id: ID!
  name: String!
  photo: String
}
```

This is where we use a **resolver chain**. Because `authorId` exists on `Track`
we can use this to get the `name` part of the query. We already have a resolver
for `author` under the `Track` resolver:

```js
Track: {
    author: ({ authorId }, _, { dataSources }) => {
      return dataSources.trackApi.getAuthor(authorId);
    },
  },
```

Notice that `authorId` is used in the place of the `parent` parameter. It
already exists on the `Track` type that wraps the resolver. So this can be
invoked to fulfill `author` and thereby access the author name from the graph.

This process is also required for our extended schema. The `Track` type now has
a `modules` field that comprises an array of the `Module` type.

Here's a reminder of the `Module` type:

```js
type Module {
    id: ID!
        length: Int
}
```

The modules for a `Track` can be sourced from the track `id`. So we can again
add a resolver chain function to the resolvers file:

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
    modules: ({ id }, _, { dataSources }) => {
      return dataSources.trackAPI.getTrackModules(id);
    },
  },
};
```

Once again we are using a property on the parent `Track` type to use as a
parameter in the resolver function.

This setup would enables like the following to be run:

```js
query track(id: 'xyz'){
  title
  modules
}
```

The `id` parameter would be used by the `modules` resolver to return the array
of the `Modules` type.

## Variables in arguments

Instead of writing the following within our query constants on the client-side:

```js
query GetTrack {
  track(id: 'xyz'){
    title
  }
}
```

We can make the code more reusable by using variables instead of the hardcoded
`id` argument:

```js
query GetTrack($trackId: ID!) {
  track(id: $trackId){
    title
  }
}
```

This way we do not need to write a new query constant every time we want to
return a specific track.

## Send query with arguments using Apollo `useQuery`

We can now write a proper query using the
[useQuery hook](Apollo_Client.md#usequery-hook) from
Apollo Client, with variables.

First define our query constant:

```js
export const GET_TRACK = gql`
  query GetTrack($trackId: ID!) {
    track(id: $trackId) {
      id
      title
      author {
        name
      }
      description
      modules {
        id
        title
        length
      }
    }
  }
`;
```

Then to employ in React:

```jsx
const trackId = "xyz";

const { loading, error, data } = useQuery(GET_TRACK, {
  variables: {
    id: trackId,
  },
});
```

Note that in contrast to the
[simple example](Apollo_Client.md#query-constants)
because we are using variables, we have to pass-in an additional options object
with the query constant that specifies our variables.
