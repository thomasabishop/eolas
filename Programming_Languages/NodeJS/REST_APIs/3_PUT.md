---
categories:
  - Programming Languages
tags: [backend, node-js, REST, APIs]
---

# RESTful API with Node, Express and MongoDB: `PUT` requests

To demonstrate the handling of PUT requests, we will create a handler that updates an element in the course array, based on its `id` and return the updated entry:

```js
router.put('/:id', (req, res) => {
  const course = courses.find((c) => c.id === parseInt(req.params.id));

  if (!course) return res.status(404).send('A course with the given ID was not found');
  const {error} = validateCourse(req.body);

  if (error) return error.details.map((joiErr) => res.status(400).send(joiErr.message));

  course.name = req.body.name;
  res.send(course);
});
```

Our request:

```js
const updateCourse = async (courseChange) => {
  try {
    const resp = await axios.put('http://localhost:3000/api/courses/1', {
      name: courseChange.name,
    });
    console.log(resp.data);
  } catch (err) {
    console.error(err);
  }
};

updateCourse({name: 'A new course'});
```

Returns:

```js
{ id: 1, name: 'A new course' }
```
