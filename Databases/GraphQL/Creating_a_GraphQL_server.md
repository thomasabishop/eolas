---
title: Creating a GraphQL server
categories:
  - Databases
tags: [graph-ql]
---

# Creating a GraphQL server

> We will use Node.js to create a basic GraphQL server that will serve data from a product database.

Our server will allow us to add products to a database through a mutatation and to query the products that we have added. We will use a JS object instead of a real database.

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

Next we introduce GraphQL as a piece of Node.js [middlewear](/Programming_Languages/Node/Architecture/Middleware.md), with the `app.use()` method.

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

- `schema` is a reference to our GraphQL schema - the structure of the fields that define our server. This is not yet defined.
- `rootValue` is a reference to our resolvers. This is not yet defined.
- `graphiql` is the GUI tool that will be served from the GraphQL endpoint at `localhost:8080/graphql`. This tool enables us to interrogate our data using the defined schema and see what data we would get back from frontend queries.

## Resolvers


We will specify our resolvers in a dedicate resolver file. In GraphQL you need to define resolvers for both your queries and your mutations.

To achieve this we will have a dummy object as the database containing our products and a class working as a generator function that will create a product object with certain properties, individuated by an id. We will invoke this class to create new products for the database and to retrieve existing products from the database.

First we create the product class and the database object:

```js
// resolvers.js

const productDb = {};

class Product {
  constructor(id, { name, description, price, soldout, stores }) {
    this.id = id;
    this.name = name;
    this.description = description;
    this.price = price;
    this.soldout = soldout;
    this.stores = stores;
  }
}
```

Next we define a resolver for read operations. This will receive a product id and return the corresponding product back from the database as an instance of `Product`.

```js
// resolvers.js

const resolvers = {
  getProducts: ({ id }) => {
    return new Product(id, productDb[id]);
  },
};
```

Next we declare a resolver that will handle our mutation: adding new products to the database.

> Mutations in GraphQL are the equivalent of `POST`, `PUT`, and `DELETE` in REST APIs. In other words, they are the means by which we update the data that the GraphQL Server exposes.

```js
// resolvers.js

const resolvers = {
  getProducts: ({ id }) => {
    return new Product(id, productDb[id]);
  },
  createProduct: ({ input }) => {
    let id = guid; // imagine a hash function here
    productDatabase[id] = input;
    return new Product(id, input);
  },
};
```

## Schema

This handles the backend mechanics of reading from and writing to the database, but we need still need to integrate it with the GraphQL middlewear. We do this through the GraphQL server's schema file.

The GraphQL Schema, defined on the backend, describes the shape of queries that can be run against the GraphQL Server. A schema is a series of fields matched to a type specification. Writing a schema is just like defining a type or interface in TypeScript or a schema in Mongoose.

### Define `Product` type

First we will define a schema entry for products:

```js
// schema.js
import { buildSchema } from "graphql";

const schema = buildSchema(`
type Product {
  id: ID
  name: String
  description: String
  price: Float
  soldout: Boolean
  stores: [Store]!
}

type Store {
  store: String
}
`);
```

> Note that here we define a **custom** `Store` type that integrates with the the `Product` type as an array of stores. This is a required field, indicated by the `!`. Also the `ID` type is special ...

// TODO: Explain why the ID type is in caps. Is it the equivalent of the primary key?

### Define `Query` method

So far we have established the types necessary to service our `getProduct` resolver but we have not provided a declared means of querying. We do this by declaring a `Query` type that will invoke the `getProduct` resolver we defined earlier. Now the server knows that when a `Query` is run, it must use that resolver:

```js
const schema = buildSchema(`
...

type Query {
  getProducts(id: ID)
}

`);
```

### Define `Mutation`

So far we have defined the fields necessary to query the GraphQL server using the `getProduct` resolver but we have not yet provided a way to mutate the data by adding new products. We need to integrate our `createProduct` resolver.

We do this by defining a `Mutation` type that references the `createProduct` resolver. And we type its paramter and return value:

```js
const schema = buildSchema(`
...

type Mutation {
  createProduct(input: ProductInput): Product
}

input ProductInput {
  id: ID
  name: String
  description: String
  price: Float
  solout: Boolean
  stores: [StoreInput]!
}

type StoreInput {
  store: String
}

`);
```

> Note that the `input` parameter to the mutation and the `input` keyword are closely coupled. Note also that although `ProductInput` / `Product` and `Store` / `StoreInput` are identical in terms of their shape, we must still create dedicated new types. We cannot mix the types from the different resolvers.

## Using the server

Our server is now complete and will allow us to send and receive data of the following shape:

```json
{
  "id": 1234,
  "name": "Product A",
  "description": "This is Product A",
  "price": 34.99,
  "soldout": false,
  "stores": [
    {
      "store": "London"
    },
    {
      "store": "Sheffield"
    },
    {
      "store": "Lincoln"
    }
  ]
}
```

We will now switch to the client-side and see how we can go about adding and querying products.

### Adding new products through a mutation

We can invoke our mutation resolver by sending the following query to the server:

```graphql
mutation {
  createProduct(
    input: {
      name: "Widget4"
      description: "Lorem ipsum"
      price: 39.99
      soldout: false
      stores: [{ store: "London" }]
    }
  ) {
    price
    name
    soldout
  }
}
```

This is represented in GraphiQL as follows:

![](/img/graphql3.png)

We should always return something, even if we are applying  mutation, hence we add the properties at the bottom as the ones we want to return.

### Returning a product through a query

```graphql


```

// Add new image of this working in GraphiQL
