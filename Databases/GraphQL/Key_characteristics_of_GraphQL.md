---
title: Key characteristics of GraphQL
categories:
  - Databases
tags: [graph-ql]
---

# Key characteristics of GraphQL

> In a nutshell, GraphQL is all about optimizing data communication between a client and a server. This includes the client asking for needed data and communicating that need to the server, and the server preparing a fulfillment for that need and communicating the fulfillment back to the client. GraphQL allows clients to ask for the exact data they need and makes it easier for servers to aggregate data from multiple data storage resources.

- GraphQL is a **query language** from which you can build APIs. It exists as an abstraction layer between a client that issues requests and a backend comprising any number of databases that responds to queries.

- Crucially, with applications that utilise GraphQL, both the backend and the frontend use the same GraphQL syntax. They speak the same language. This means that neither needs to take account of the way in which the other is implemented. For example, a client could request data from both a relational database and an object database without knowing there is any difference from its point of view. Conversely, client requests could be made through JavaScript or Python and the structure of the request received by the backend would be the same.
- The main benefit is its interoperability and its network economy when compared to REST APIs: you ask only for what you want and you get only that; there is no surplus data, increasing efficiency, reducing the number of network requests and reducing the size of the payload.

> The best way to think of GraphQL architecturally is to think of it as a different technique for instantiating the _uniform interface_, _client/server decoupling_, and _layered-system architecture_ contraints of traditional [REST APIs](/Databases/REST/RESTful_APIs.md#rest). However, instead of making GET or POST requests to a REST endpoint URL and passing parameters, you send a structured query object.

## Architecture

From the point of view of the frontend, GraphQL is a query language that may be used via wrappers for the given frontend framework or language (JavaScript, React, .NET etc). You can make direct `fetch` requests to a GraphQL server or use a third-party dedicated client like Apollo (specifically designed for React).

From the point of view of the backend, GraphQL is a **runtime** that provides a structure for servers to describe the data to be exposed in their APIs. We call this structure the **schema**. For example, the GraphQL server might translate the query into SQL statements for a relational database then take what the storage engine responds with, translate it into JSON and send it back to the client application.

Client requests are sent over HTTPS and the data is typically returned in the form of JSON:

![](/img/graphql-architecture.png)

## Implementation overview

### Queries, mutations, subscriptions

Queries can be used for **both** reading and modifying data.

- When you need to read data with GraphQL you use **queries**
- When you need to modify data, you use **mutations**

So, for comparison, a query would be akin to a `READ` instruction in SQL or a `GET` request send to a REST API. A mutation would be akin to `WRITE` then `READ` instruction in SQL or a `POST` request to a REST API.

There is a third request type called a **subscription**. This is used for real-time data monitoring requests, like a data stream, similar to a continuous `READ` process. Mutations typically trigger events that can be subscribed to.

### Structure and behaviour

We define the structure of a GraphQL API through the schema. A schema is strongly typed and is basically a graph of fields that have types, e.g

```graphql
{
  name: String
}
```

We implement the behaviour of the API through functions called **resolver functions**. Each field in a GraphQL schema is backed by a resolver function. A resolver function defines what data to fetch for its field.

> A resolver function represents the instructions on how and where to access raw data. For example, a resolver function might issue a SQL statement to a relational database, read a file’s data directly from the operating system, or update some cached data in a document database. A resolver function is directly related to a field in a GraphQL request, and it can represent a single primitive value, an object, or a list of values or objects.
