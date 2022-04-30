---
tags:
  - Programming_Languages
  - backend
  - node-js
  - express
  - REST
  - apis
---

## Core Express methods

The following Express methods correspond to the main [HTTP request types](../../Databases/HTTP%20request%20types.md):

* `app.get()`
* `app.post()`
* `app.put()`
* `app.delete()`

## Instantiate instance of Express

````js
const express = require('express')
const app = express()

````

## Nodemon

We don't want to have to restart the server every time we make a change to our files. We can use `nodemon` instead of `node` when running our index file so that file-changes are immediately registered without the need for a restart. It's a good idea to set your NPM start script to `nodemon index.js`.

## Creating GET requests

We are going return the following array in the GET examples:

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

### Basic GET without params

We create an [event emitter](Events%20module.md#event-emitters) and listener that listens for GET requests on a specified port and sends data in response to requests. 

````js

// Return a value as response from specified URI
app.get('/api/courses', (req, res) => {
 res.send(courses)
})

app.listen(3000, () => console.log('Listening on port 30000...'))
````

When creating our API this structure of creating handlers for specific routes will be iterated. Every endpoint will be specified with the `[app].[http_request_type]` syntax.

### GET with parameters and queries

The previous example just serves an array. This corresponds to the entire set of our data. But we will also need to retrieve specific values, we do this by adding (and allowing for) parameters in our requests.

#### Parameters

We will create a GET path that accepts parameters, these parameters will correspond to the specific entry in our main data array. 

````js
app.get("/api/courses/:id", (req, res) => {
  res.send(req.params.id);
});
````

We use the `:` symbol in the URI to indicate that we looking to parse for a specific value in the data.Now if we call `/api/courses/2`, we will get the second item in the array.

Here is a more detailed example, this time with more than one parameter 

````js
app.get("/api/posts/:year/:month", (req, res) => {
  res.send(req.params);
})[]();
````

If we navigate to a URL that uses this structure such as `/api/2021/1` we would receive a JSON object corresponding to the parameters passed:

````json
{
	"year":"2021",
	"month":"1"
}
````

This shows us how parameters are represented by Node internally but we need to provide a way for these parameters to actually be met and for the values that match them to be returned to the client. And also handle errors if no match is found:

Let's say that we want to return a course by its ID:

````js

app.get("/api/courses/:id", (req, res) => {
  const course = courses.find((c) => c.id === parseInt(req.params.id));
  if (!course) res.status(404).send("A course with the given ID was not found");
  res.send(course);
});
````

### Queries

Whereas parameters return specific data points, queries don't get data they aggregate or present the data that is returned in a certain way, such as for instance applying a search function. We indicate queries with a `?` in our URI.
For example: `/api/posts/2018/1?sortBy=name`.
To facilitate a request like  this we have to create a GET path that allows for it:

````js
app.get("/api/posts/:year/:month", (req, res) => {
  res.send(req.query);
})[]();
````

We would get the following back:

````json
{
	"sortBy": "name"
}
````

Again a JSON object with key-value pairs is returned.

## Creating POST requests

Some examples of validating the data we receive as the `req` using the Joi schema validator:

````js



````

In our example we are going to demonstrate how to allow for POST requests in an API with the scenario of adding a new course to our array. 

````js
app.post('/api/courses', (req, res) => {
	const course = {
		id: courses.length + 1,
		name: req.body.name
	}
	courses.push(course);
	res.send(course)

})

````

Here we use the body that is sent from the client and isolate the field `name`. This presupposes that the client is sending us data with the following shape as the body:

````json
{
	name: 'some string'
}	

````

The id is added by the server, not the client. Having created the new value we add it to our `courses` array. (In reality we would be creating a new entry in a database.) Then we follow the convention of returning the new value back to the client. 

### Validation

We would also typically use a JSON [schema validator](Validation.md) to simplify the process of checking that the `req` body is valid before anything is sent to the database. 

## Creating PUT requests

````js
app.put("/api/courses/:id", (req, res) => {
  const course = courses.find((c) => c.id === parseInt(req.params.id));

  if (!course)
    return res.status(404).send("A course with the given ID was not found");
  const { error } = validateCourse(req.body);

  if (error)
    return error.details.map((joiErr) => res.status(400).send(joiErr.message));

  course.name = req.body.name;
  res.send(course);
});

````

## Creating DELETE requests

````js
app.delete("/api/course/:id", (req, res) => {
  const course = courses.find((c) => c.id === parseInt(req.params.id));
  if (!course)
    return res.status(404).send("A course with the given ID was not found");

  courses.indexOf(course);
  courses.splice(index, 1);

  res.send(course);
});

````
