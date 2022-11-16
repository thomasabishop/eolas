---
title: Apollo Client
categories:
  - Databases
tags: [graph-ql, apollo]
---

# Apollo Client

Apollo Client is the client-side counterpart to [Apollo Server](/Databases/GraphQL/Apollo/Apollo_Server.md). We use it for managing queries and mutations from the frontend to our Apollo GraphQL server. It is specifically designed to work with React.

> We will be working with the [schema](/Databases/GraphQL/Apollo/Apollo_Server.md#example-schema) we defined when working on the server

## Initializing the client

We initialise the client and set-up in memory kcaching to reduce network requests:

```js
const client = new ApolloClient({
  uri: "http://localhost:4000",
  cache: new InMemoryCache(),
});
```

> The `uri` property must match the location of our Apollo server.

## Utilising the provider

Apollo Provides a top level application context that we can wrap our React app in. This will provide access to the client object from anywhere within the app, eg:

```jsx
ReactDOM.render(
  <ApolloProvider client={client}>
    <GlobalStyles />
    <Pages />
  </ApolloProvider>,
  document.getElementById("root")
);
```

## Running a query

### Query constants

To run a query against our server we must define a query contant first. We use a `gql` literal again:

```js
import { gql } from "@apollo/client";
const TRACKS = gql`
  query GetTracks {
    tracksForHome {
      id
      title
      thumbnail
      length
      modulesCount
      author {
        name
        photo
      }
    }
  }
`;
```

The convention is to name the query constant in `ALL_CAPS`.

> Note that the name of the query on the client doesn't have to match the query type defined in the schema however it should reference it on the second line (`tracksFormHome)

### `useQuery` hook

The `useQuery` hook provides a straightforward wrapper for sending queries and receiving data back from the server.

When a component renders, `useQuery` returns an object from the Apollo Client that contains loading, error, and data properties.

```jsx
const { loading, error, data } = useQuery(TRACKS);

const Tracks = () => {
  const { loading, error, data } = useQuery(TRACKS);

  if (loading) return "Loading...";

  if (error) return `Error! ${error.message}`;

  return <Layout grid>{JSON.stringify(data)}</Layout>;
};
```

- We destructure the `loading, error, data` variables that are returned from the hook
- We pass in our query constant as an argument.
- In the example we just render the serialized data but we could of course pass the data as a prop and map through it in an embedded child component.
