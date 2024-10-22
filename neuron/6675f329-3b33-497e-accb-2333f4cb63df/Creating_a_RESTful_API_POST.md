---
tags:
  - node-js
  - REST
  - APIs
---

# Creating a RESTful API: `POST` requests

To demonstrate the handling of POST requests, we will create a handler that add
a new element to the array of courses.

```js
router.post("/", (req, res) => {
  const course = {
    id: courses.length + 1,
    name: req.body.name,
  };
  courses.push(course);
  res.send(course);
});
```

Here we use the body that is sent from the client and isolate the field `name`.
This presupposes that the client is sending us data with the following shape as
the body:

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

The `id` is added by the server, not the client. Having created the new value we
add it to our `courses` array. (In reality we would be creating a new entry in a
database.) Then we follow the convention of returning the new value back to the
client.

## Validation

We should accept alterations to the database that are not first validated. We
can use the
[Joi validator](Validation_in_NodeJS.md) to vet
the request:

```js
function validateCourse(course) {
  const schema = Joi.object({
    name: Joi.string().min(3).required(),
  });

  const { error } = schema.validate(course);
  return error;
}
```

We can then add the validation as part of our general error handling:

```js
router.post("/", (req, res) => {
  const course = {
    id: courses.length + 1,
    name: req.body.name,
  };
  const { error } = schema.validate(req.body);
  if (error)
    return error.details.map((joiErr) => res.status(400).send(joiErr.message));

  courses.push(course);
  res.send(course);
});
```
