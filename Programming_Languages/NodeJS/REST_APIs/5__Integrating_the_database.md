---
categories:
  - Programming Languages
  - Databases
tags: [backend, node-js, REST, APIs, mongo-db]
---

# Creating a RESTful API: Integrating the database

So far we have set up the application and an `/api/courses` route which handles requests for RESTful API operations on a local array of course objects. We now want to have the endpoints operate on a MongoDB `courses` collection rather than the array.

## Set-up

We will follow the routine for establishing a MongoDB instance as detailed in [my notes](/Databases/MongoDB/Connect_to_database.md) on Mongo:

- [Create MongoDB database](/Databases/MongoDB/Create_database.md)
- [Connect to MongoDB database](/Databases/MongoDB/Connect_to_database.md)

Our `index.js` now looks like the following:

```js
// index.js

// Connect to database
mongoose
  .connect("mongodb://127.0.0.1/playground")
  .then(() => console.log("Connected to MongoDB"))
  .catch((err) => console.error(err));

app.use(express.json());

// Link to `courses` route which contains our REST request handlers for this part of the API
app.use("/api/courses", courses);
```

## Integrating Mongo with our our `courses` module

### Create the schema

Now we go the router module for `courses` and start to use Mongoose, defining our `Course` schema:

```diff
// index.js

// Connect to database
mongoose
  .connect("mongodb://127.0.0.1/playground")
  .then(() => console.log("Connected to MongoDB"))
  .catch((err) => console.error(err));

app.use(express.json());

// Link to `courses` route which contains our REST request handlers for this part of the API
app.use("/api/courses", courses);

+ const courseSchema = new mongoose.Schema({
+  name: {type: String, required: true, minlength: 5, maxlength: 255},
+  author: String,
+  tags: [String],
+  data: {type: Date, default: Date.now}, // if unspecified, entry will default to current date
+  isPublished: Boolean,
+ });

```

### Create a model

```diff
const courseSchema = new mongoose.Schema({
  name: {type: String, required: true, minlength: 5, maxlength: 255},
  author: String,
  tags: [String],
  data: {type: Date, default: Date.now}, // if unspecified, entry will default to current date
  isPublished: Boolean,
 });

+ const Course = new mongoose.model('Course', courseSchema);
```

With this established we can remove our local array as we are ready to start getting our data from the database:

```diff
const Course = mongoose.model('Course', courseSchema);

- const courses = [
-  {
-    id: 1,
-    name: "First course",
-  },
-  ...
-];
```

## Rewriting the REST handlers

Now we need to rewrite our RESTful request handlers so that the data is sourced from and added to the database. We will mainly be using the Mongo syntax defined at [Querying a collection](/Databases/MongoDB/Querying_a_collection.md) and [Adding documents to a collection](/Databases/MongoDB/Adding_documents_to_a_collection.md).

### GET

Instead of simply returning the array, we use the Mongoose `find` method.

```diff
- router.get("/", (req, res) => {
-  res.send(courses);
 });

+ router.get("/", async (res, res) => {
+  const courses = await Courses.find();
  res.send(courses)
})
```

### POST

Now we make our new course an instance of the `Courses` model:

```js
// Original formulation

router.post("/", (req, res) => {
-  const course = {
-    id: courses.length + 1,
-    name: req.body.name,
-  };
  courses.push(course);
  res.send(course);
});
```

```diff
router.post("/", async (req, res) => {
+  let course = new Course({ // make new course instance of Course model
-   id: courses.length + 1, // not needed as DB automatically adds an id
    name: req.body.name,
  });
- courses.push(course); // not pushing to the array anymore
+ await course.save() // save to Mongo
  res.send(course);
});

```

### PUT

When updating a value in the database we are going to use the [query-first](/Databases/MongoDB/Update_document.md#query-first-document-update) approach to updating a Mongo document.

```js
router.put("/:id", (req, res) => {
  const course = courses.find((c) => c.id === parseInt(req.params.id));

  if (!course)
    return res.status(404).send("A course with the given ID was not found");

  const { error } = validateCourse(req.body);
  if (error)
    return error.details.map((joiErr) => res.status(400).send(joiErr.message));

  course.name = req.body.name;
  res.send(course);
});
```

```diff
router.put("/:id", async (req, res) => {
- const course = courses.find((c) => c.id === parseInt(req.params.id));
 const { error } = validateCourse(req.body);
 if (!course) return res.status(404).send("A course with the given ID was not found");
+ const updatedCourse = await Course.findByIdAndUpdate(req.params.id,
+  { name: req.body.name },
+  { new: true}
+ )

-   if (error)
-   return error.details.map((joiErr) => res.status(400).send(joiErr.message));
- })

- course.name = req.body.name;
  res.send(course);
```

### DELETE

```js
router.delete("/:id", (req, res) => {
  const course = courses.find((c) => c.id === parseInt(req.params.id));
  if (!course)
    return res.status(404).send("A course with the given ID was not found");

  courses.indexOf(course);
  courses.splice(index, 1);
  res.send(course);
});
```

```diff

router.delete("/:id", async (req, res) => {
 const courseToDelete = await Course.findByIdAndRemove(req.params.id)

 if (!course) return res.status(404).send("A course with the given ID was not found");

- courses.indexOf(course);
- courses.splice(index, 1);

res.send(course);
})
```
