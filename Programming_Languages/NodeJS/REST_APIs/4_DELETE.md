---
categories:
  - Programming Languages
tags: [backend, node-js, REST, APIs]
---

# RESTful API with Node, Express and MongoDB: `DELETE` requests

```js
router.delete('/:id', (req, res) => {
  const course = courses.find((c) => c.id === parseInt(req.params.id));
  if (!course) return res.status(404).send('A course with the given ID was not found');

  courses.indexOf(course);
  courses.splice(index, 1);
  res.send(course);
});
```
