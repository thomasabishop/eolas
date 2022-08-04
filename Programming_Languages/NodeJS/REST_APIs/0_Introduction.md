---
tags:
  - Programming_Languages
  - backend
  - node-js
  - express
  - REST
  - apis
---

# Creating a REST API with Node and Express: Introduction

We are going to use Express to create a [RESTful API](/Databases/RESTful_APIs.md) in Node.js. 

## Request types

Express provides us with methods corresponding to each of the [HTTP request types](/Databases/HTTP_request_types.md):

* `app.get()`
* `app.post()`
* `app.put()`
* `app.delete()`

## Creating an Express instance

````js
const express = require('express')
const app = express()
````

## Our data set

> Typically when you create a RESTful API you are going to be returning data from a database. For simplicity we are just going simulate this with a simple data array so that we can focus on the Express syntax rather than database handling.

We will mainly work with the following array of objects:

````js
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
````