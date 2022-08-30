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
const Course = new mongoose.model('Course', courseSchema);

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
