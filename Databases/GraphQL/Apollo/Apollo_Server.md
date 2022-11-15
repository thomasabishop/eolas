---
title: Apollo Server
categories:
  - Databases
tags: [graph-ql, apollo]
---

# Apollo Server

> Apollo Server is the part of the Apollo suite that we use to create the backend of a GraphQL project; a GraphQL server.

It is able to do the following:

- Receive an incoming GraphQL query from a client
- Validate that query against the server schema
- Populate the queried schema fields
- Return the fields as a response

## Example schema

We will use the following schema in the examples

```js
const typeDefs = gql`
  type Query {
    "Get tracks array for homepage grid"
    tracksForHome: [Track!]!
  }

  "A track is a group of Modules that teaches about a specific topic"
  type Track {
    id: ID!
    "The track's title"
    title: String!
    "The track's main author"
    author: Author!
    "The track's main illustration to display in track card or track page detail"
    thumbnail: String
    "The track's approximate length to complete, in minutes"
    length: Int
    "The number of modules this track contains"
    modulesCount: Int
  }

  "Author of a complete Track"
  type Author {
    id: ID!
    "Author's first and last name"
    name: String!
    "Author's profile picture url"
    photo: String
  }
`;
module.exports = typeDefs;
```

## Setting up the server

```js
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

When we access the local URL we are able to access the Apollo server using the Explorer GUI. This automatically loads our schema and is basically a more fancy version of GraphiQL:

![](/img/apollo-explorer.png)

It makes it easy to read descriptions of the dataypes and to construct queries by clicking to insert fields.

### Adding some mock data

We are not connected to a database yet but we can create a mock that will enable us to run test queries.

We do this just by updating the Apollo Server options. We can either use generic dummy data or provide our own mock.

#### Generic mock

```js
const server = new ApolloServer({ typeDefs, mocks: true });
```

#### Custom mock

```js
const mocks = {
  Track: () => ({
    id: () => "track_01",
    title: () => "Astro Kitty, Space Explorer",
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
We can now [run queries](/Databases/GraphQL/Apollo/Apollo_Client.md#running-a-query) against our server. 

## Implementing resolvers
A resolver is a [function](/Databases/GraphQL/Creating_a_GraphQL_server.md#resolvers)


### `RESTDataSource`

This is something you can apply to your server to improve the efficiency of working with REST APIs in your resolvers. 

REST APIs fall victim to the "n + 1" problem: say you want to get one resource, then for each element returned of this resource you need to send another request using a property of this resource to get another resource. For each of the first requests you need to send another request once they resolve. 

Here is an example of `RESTDataSource` being used. It is just a class that can be extended and which provides inbuilt methods for running fetches against a REST API:

```js
const {RESTDataSource} = require('apollo-datasource-rest');

class TrackAPI extends RESTDataSource {
  constructor() {
    super();
    this.baseURL = 'https://odyssey-lift-off-rest-api.herokuapp.com/';
  }

  getTracksForHome() {
    return this.get('tracks');
  }

  getAuthor(authorId) {
    return this.get(`author/${authorId}`);
  }
}
```