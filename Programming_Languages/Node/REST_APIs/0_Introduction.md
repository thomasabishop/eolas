---
categories:
  - Programming Languages
tags: [backend, node-js, REST, APIs]
---

# Creating a RESTful API: Introduction

We are going to use Express to create a [RESTful API](/Databases/RESTful_APIs.md) in Node.js.

## Request types

Express provides us with methods corresponding to each of the [HTTP request types](/Databases/HTTP_request_types.md):

- `.get()`
- `.post()`
- `.put()`
- `.delete()`

## Our data set

> Typically when you create a RESTful API you are going to be returning data from a database. For simplicity we are just going simulate this with a simple data array so that we can focus on the Express syntax rather than database handling. Later we will integrate this with a [MongoDB database](/Programming_Languages/NodeJS/REST_APIs/05_%20Integrating_the_database.md).

We will mainly work with the following array of objects:

```js
const courses = [
  {
    id: 1,
    name: "First course",
  },
  {
    id: 2,
    name: "Second course",
  },
  {
    id: 3,
    name: "Third course",
  },
];
```

## Creating an Express instance

We first create an instance of Express within `index.js`. This will be the main coordinating file and we will aim to minimise the amount of business logic we have in this file. It should really just be for initialization and managing [middleware](/Programming_Languages/NodeJS/Architecture/Middleware.md).

```js
const express = require("express");
const app = express();
```

## Routing

We are going to receive all our HTTP requests at the path `/api/courses` and we will place all code related to this route in a dedicated Node module (`routes/courses.js`) rather than within `index.js` which should remain as uncluttered as possible.

First we need to declare this in `index.js`:

```js
const courses = require("./routes/courses");
app.use("/api/courses", courses);
```

Then within `courses.js` we instantiate an express router that `app.js` will route to:

```js
const router = express.Router();
```

Our REST requests will all follow the following pattern:

```js
router.get("/", (req, res) => {
  res.send(courses);
});
```

We target the `Router` instance we created and all paths will be expressed as `/` since the app will route by default to `/courses/api` from `index.js`

## Create listener

With the routing established and the Express instance created we can now listen for requests:

```js
app.listen(3000, () => console.log("Listening on port 30000..."));
```

## REST endpoints

We can now proceed to set up our RESTful endpoints:

[GET requests](/Programming_Languages/NodeJS/REST_APIs/1_GET.md)

[POST requests](/Programming_Languages/NodeJS/REST_APIs/2_POST.md)

[PUT requests](/Programming_Languages/NodeJS/REST_APIs/3_PUT.md)

[DELETE requests](/Programming_Languages/NodeJS/REST_APIs/4_DELETE.md)
