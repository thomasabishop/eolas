---
tags:
  - node-js
  - REST
  - APIs
---

# Creating a RESTful API: `GET` requests

With our GET request we will simply return the array of course objects.

We create an [event emitter](Events%20module.md#event-emitters) and listener
that listens for GET requests on a specified port and sends data in response to
requests.

```js
// Return a value as response from specified URI
router.get("/", (req, res) => {
  res.send(courses);
});
```

Our server is now set up:

![](/img/server-listening.png)

> When creating our API this structure of creating handlers for specific routes
> will be iterated. Every endpoint will be specified with
> `[app].[http_request_type]` and followed by a callback.

We can now call the endpoint:

```js
const getAllCourses = async () => {
  try {
    const resp = await axios.get("http://localhost:3000/api/courses");
    console.log(resp.data);
  } catch (err) {
    console.error(err);
  }
};

getAllCourses();
```

Returns:

```js
[
  { id: 1, name: "First course" },
  { id: 2, name: "Second course" },
  { id: 3, name: "Third course" },
];
```

## Parameters

The previous example serves the entire set of our data. But we will also need to
retrieve specific values, we do this by adapting the GET callback to accept
parameters. These parameters will correspond to the specific entry in our main
data array.

```js
router.get("/:id", (req, res) => {
  res.send(req.params.id);
});
```

We use the `:` symbol in the URI to indicate that we looking to parse for a
specific value in the data. Now if we call `/api/courses/2`, we will get the
second item in the array.

The block above is the most basic format but we would want to add some kind of
error handling, for example:

```js
router.get("/:id", (req, res) => {
  const course = courses.find((c) => c.id === parseInt(req.params.id));
  if (!course) res.status(404).send("A course with the given ID was not found");
  res.send(course);
});
```

## Queries

Whereas parameters return specific data points, queries don't get data they
aggregate or present the data that is returned in a certain way, such as for
instance applying a search function. We indicate queries with a `?` in our URI.
For example: `/api/posts/2018/1?sortBy=name`. To facilitate a request like this
we have to create a GET path that allows for it:

```js
router.get("/:year/:month", (req, res) => {
  res.send(req.query);
})[]();
```

We would get the following back:

```json
{
  "sortBy": "name"
}
```

Again a JSON object with key-value pairs is returned.
