---
tags:
  - Programming_Languages
  - backend
  - node-js
  - express
  - REST
  - apis
---

# Creating a REST API with Node and Express: POST requests

To demonstrate the handling of POST requests, we will create a handler that add a new element to the array of courses.

```js
app.post('/api/courses', (req, res) => {
	const course = {
		id: courses.length + 1,
		name: req.body.name
	}
	courses.push(course);
	res.send(course)

})
```

Here we use the body that is sent from the client and isolate the field `name`. This presupposes that the client is sending us data with the following shape as the body:

```json
{
	"name": "Biology and Life Sciences"
}	
```

To execute the PUT request from the frontend:

```js
const addCourse = async (newCourse) => {
  try {
    const resp = await axios.post("http://localhost:3000/api/courses", {
      name: newCourse,
    });
    console.log(resp.data);
  } catch (err) {
    console.error(err);
  }
};

addCourse("Biology and Life Sciences");
```

Which returns: 

```js
{ id: 4, name: 'Biology and Life Sciences' }
```

The `id` is added by the server, not the client. Having created the new value we add it to our `courses` array. (In reality we would be creating a new entry in a database.) Then we follow the convention of returning the new value back to the client. 