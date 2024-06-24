---
tags: [graphql, REST, APIs]
---

# Apollo Server

> Apollo Server is the part of the Apollo suite that we use to create the
> backend of a GraphQL project: a GraphQL server.

It is able to do the following:

- Receive an incoming GraphQL query from a client
- Validate that query against the server schema
- Populate the queried schema fields
- Return the fields as a JSON response object

## Example schema

We will use the following schema in the examples.

```js
// schema.js

const typeDefs = gql`
  " Our schema types will be nested here
`;
module.exports = typeDefs;
```

```js
type Query {
  tracksForHome: [Track!]!
}

type Track {
  id: ID!
    author: Author!
  thumbnail: String
  length: Int
  modulesCount: Int
}

type Author {
  id: ID!
  name: String!
  photo: String
}
```

## Setting up the server

We instantiate an `ApolloServer` instance and pass our schema to it. We then
subscribe to it with a
[listener](Node_JS_events_module.md#extending-the-eventemitter-class).

```js
// index.js

const { ApolloServer } = require("apollo-server");
const typeDefs = require("./schema");
const server = new ApolloServer({ typeDefs });

server.listen().then(() => {
  console.log(`
        Server is running!
        Listening on port 4000
        Query at http://localhost:4000
  `);
});
```

When we access the local URL we are able to access the Apollo server using the
Explorer GUI. This automatically loads our schema and is basically a more fancy
version of GraphiQL:

![](/img/apollo-explorer.png)

It makes it easy to read descriptions of the dataypes and to construct queries
by clicking to insert fields.

### Adding some mock data

We are not connected to a database yet but we can create a mock that will enable
us to run test queries.

We do this just by updating the Apollo Server options. We can either use generic
dummy data or provide our own mock.

#### Generic mock

```js
const server = new ApolloServer({ typeDefs, mocks: true });
```

#### Custom mock

```js
const mocks = {
  Track: () => ({
    id: () => "track_01",
        author: () => {
      return {
        name: "Grumpy Cat",
        photo:
          "https://res.cloudinary.com/dety84pbu/image/upload/v1606816219/kitty-veyron-sm_mctf3c.jpg",
      };
    },
    thumbnail: () =>
      "https://res.cloudinary.com/dety84pbu/image/upload/v1598465568/nebula_cat_djkt9r.jpg",
    length: () => 1210,
    modulesCount: () => 6,
  }),
};

const server = new ApolloServer({ typeDefs, mocks });
```

We can now
[run queries](Apollo_Client.md#running-a-query)
against our server.

## Implementing resolvers

A resolver is a [function](Creating_a_GraphQL_server.md#resolvers) that
populates data for a given query. It should have **the same name as the field
for the query**. So far we have one query in our schema: `tracksForHome` which
returns the tracks to be listed on the home page. We must therefore also name
our resolver for this query `tracksForHome`.

It can fetch data from a single data source or multiple data sources (other
servers, databases, REST APIs) and present this as a single integrated resource
to the client, matching the shape requested.

As per the [generic example](Creating_a_GraphQL_server.md#resolvers), you
write write your resolvers as keys on a `resolvers` object, e.g:

```js
const resolvers = {};
```

The `resolvers` object's keys will correspond to the schema's types and fields.
You distinguish resolvers which directly correspond to a query in the schema from
other resolver types by wraping them in `Query {}`.

```js
const resolvers = {
  Query: {
    tracksForHome: () => {},
  },
};
```

### Resolver parameters

Each resolver function has the same standard parameters that you can invoke when
implementing the resolution: `resolverFunction(parent, args, context, info)`.

- `parent`
  - Used with
    [resolver chains](Using_arguments_with_Apollo_Client.md#resolver-chains)
    ---add example
- `args`
  - an object comprising arguments provided for the given field by the client.
    For instance if the client requests a field with an accompanying `id`
    argument, `id` can be parsed via the `args` object
- `context`
  - shared state between different resolvers that contains essential connection
    parameters such as authentication, a database connection, or a
    `RESTDataSource` (see below). This will be typically instantiated via a
    class which is then invoked within the `ApolloServer` instance under the
    `dataSources` key.
- `info`
  - not used so frequently but employed as part of caching

Typically you won't use every parameter with every resolver. You can ommit them
with `_, __`; the number of dashes indicating the argument placement.

### `RESTDataSource`

A resolver can return data from multiple sources. One of the most common sources
is a RESTful endpoint. Apollo provides a specific class for handling REST
endpoints in your resolvers: `RESTDataSource`.

REST APIs fall victim to the "n + 1" problem: say you want to get an array of
one resource type, then for each element returned you need to send another
request using one of its properties to fetch a related resource.

This is implicit in the case of the `Track` type in the schema. Each `Track` has
an `author` key but the `Author` type isn't embedded in `Track` it has to be
fetched using an `id`. In a REST API, this would require a request to a separate
end point for each `Track` returned, increasing the time complexity of the
request.

Here is an example of `RESTDataSource` being used. It is just a class that can
be extended and which provides inbuilt methods for running fetches against a
REST API:

```js
const { RESTDataSource } = require("apollo-datasource-rest");

class TrackAPI extends RESTDataSource {
  constructor() {
    super();
    this.baseURL = "https://odyssey-lift-off-rest-api.herokuapp.com/";
  }

  getTracksForHome() {
    return this.get("tracks");
  }

  getAuthor(authorId) {
    return this.get(`author/${authorId}`);
  }
}
```

### Using our `RESTDataSource` in our resolver

As our GraphQL server is sourcing data from a REST API, we can now integrate the
`RESTDataSource` class with our resolver.

First thing, we need to instantiate an instance of our `TrackApi` class,
otherwise we won't be able to use any of its methods in the resolver.

We will create an instance of this class and pass it into `ApolloServer` object
we established at the beginning. We will pass it to the `dataSources` key.
**This will allow us to access it from within the `context` parameter in our
resolver function**

We can also get rid of the `mocks` object since we don't need it any more. We
will replace it with our `resolvers` constant:

```diff
const server = new ApolloServer({
  typeDefs,
-  mocks,
+  resolvers,
+  dataSources: () => {
+  return {
+    trackApi: new TrackApi()
+  }
  }
})
```

Now we can complete our resolver:

```js
const resolvers = {
  Query: {
    tracksForHome: (_, __, {dataSources}) => {},
      return dataSources.trackApi.getTracksForHome()
  },
};
```

So we destructure the `dataSources` object from the parent Apollo Server
instance (in the place of the `context` parameter) which gives us access to our
`trackApi` class. This resolver will now make the API request and return the
tracks.

The `tracksForHome` query returns `Track` objects and these have a required
`author` key that returns an `Author` type. So we are also going to need a
resolver that can return the author data that will be populated along with
`Track`.

We already have this functionality in our class: `getAuthor` so we just need to
integrate it:

```js
const resolvers = {
  Query: {
    tracksForHome: (_, __, { dataSources }) => {
      return dataSources.trackApi.getTracksForHome();
    },
  },
  Track: {
    author: ({ authorId }, _, { dataSources }) => {
      return dataSources.trackApi.getAuthor(authorId);
    },
  },
};
```

- Just as we nest the `tracksForHome` resolver under `Query`, we must nest
  `author` under `Track` to match the structure of the schema. This resolver
  doesn't respond to a query that is exposed to the client so it shouldn't go
  under `Query`.

* We invoke the `context` again when we destructure `dataSources` from the
  `ApolloServer` instance.
* This time we utilise the `args` parameter in the resolver since an `id` will
  be provided as a client-side
  [argument](Using_arguments_with_Apollo_Client.md) to
  return a specific author.

## The `useMutation` hook

We invoke the `useMutation` hook to issue mutations from the client-side.

As with queries and
[query constants](Apollo_Client.md#query-constants)
