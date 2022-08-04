---
tags:
  - Programming_Languages
  - backend
  - node-js
  - express
  - REST
  - apis
---

# Creating a REST API with Node and Express: GET requests

With our GET request we will simply return the array of course objects.

We create an [event emitter](Events%20module.md#event-emitters) and listener that listens for GET requests on a specified port and sends data in response to requests. 

```js
// Return a value as response from specified URI
app.get('/api/courses', (req, res) => {
 res.send(courses)
})

app.listen(3000, () => console.log('Listening on port 30000...'))
```

Our server is now set up:

![](/img/server-listening.png)


> When creating our API this structure of creating handlers for specific routes will be iterated. Every endpoint will be specified with `[app].[http_request_type]` and followed by a callback.

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
  { id: 1, name: 'First course' },
  { id: 2, name: 'Second course' },
  { id: 3, name: 'Third course' }
]
```

## Parameters

The previous example serves the entire set of our data. But we will also need to retrieve specific values, we do this by adapting the GET callback to accept parameters. These parameters will correspond to the specific entry in our main data array. 

````js
app.get("/api/courses/:id", (req, res) => {
  res.send(req.params.id);
});
````

We use the `:` symbol in the URI to indicate that we looking to parse for a specific value in the data. Now if we call `/api/courses/2`, we will get the second item in the array.

Here is a more detailed example (with a more complex dummy dataset), this time with more than one parameter 