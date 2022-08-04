---
tags:
  - Programming_Languages
  - backend
  - node-js
  - express
  - REST
  - apis
---

# Creating a REST API with Node and Express: DELETE requests

```js
app.delete("/api/course/:id", (req, res) => {
  const course = courses.find((c) => c.id === parseInt(req.params.id));
  if (!course)
    return res.status(404).send("A course with the given ID was not found");

  courses.indexOf(course);
  courses.splice(index, 1);
  res.send(course);
});

```