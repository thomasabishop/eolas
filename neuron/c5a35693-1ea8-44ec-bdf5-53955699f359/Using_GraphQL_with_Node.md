---
tags: [graphql, node-js]
---

# Using GraphQL with Node.js

## Create a basic Express server

First we create a basic server in Node using Express:

```js
import express from "express";

app.get("/", (req, res) => {
  res.send("Graph QL test project");
});

app.listen(8080, () =>
  console.log("Running server on port localhost:8080/graphql")
);
```

## Add GraphQL as middlewear

Next we introduce GraphQL as a piece of Node.js
[middlewear](Middleware_in_NodeJS.md), with the
`app.use()` method.

```js
import { graphqlHTTP } from "express-graphql";

app.use(
  "/graphql",
  graphqlHTTP({
    schema: schema,
    rootValue: resolvers,
    graphiql: true,
  })
);
```

- `schema` is a reference to our GraphQL schema - the structure of the fields
  that define our server.
- `rootValue` is a reference to our resolvers.
- `graphiql` is the GUI tool that will be served from the GraphQL endpoint at
  `localhost:8080/graphql`. This tool enables us to interrogate our data using
  the defined schema and see what data we would get back from frontend queries.
