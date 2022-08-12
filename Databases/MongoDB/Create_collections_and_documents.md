---
tags:
- Databases
- mongo_db
- node-js
- mongoose
---

# Create collections and documents with Mongoose

## Collections and documents
In order start adding collections and documents to our database, we use Mongoose's schema structure. This is specific to Mongoose and is not a structure that is a part of Mongo in general.

We use a schema to define the shape of documents in a MongoDB collection. To do this we instantiate an instance of the Mongoose `Schema` class and set our properties:

### Creating a schema

```js
const courseSchema = new mongoose.Schema({
  name: String,
  author: String,
  tags: [String],
  data: {type: Date, default: Date.now}, // if unspecified, entry will default to current date
  isPublished: Boolean
});

```
This is just like defining an inteface or type within TypeScript.
#### Available data types

The following data types are available:
* `String`
* `Number`
* `Boolean`
* `Array`
* `Date`
* `Buffer`
* `ObjectID` (for UUIDs)

### Models

Once we have established our schema we can then create a **model** of it. A model is basically a class representation of the interface we define in the schema:

```js
const Course = mongoose.model("Course", courseSchema);
```
With this in place, we can then create instances of the model. This stands in relation to the model as an object does to a class:

```js
const course = new Course({
  name: "Node.js Course",
  author: "Ozzy Osbourne",
  tags: ["node", "backend"],
  isPublished: true 
});
```
![](/img/mongoose-hierarchy.svg)

Having created a database, connected to it with Mongoose, and created a model we will see our collection reflected in Compass:

![](img/../../../img/mongo-collection.png)

### Adding a document
We have our database (`playground`) and collection (`courses`) established. We now need to add documents to our collection. We will move our previous code into a function since this will be an asynchronous process:

```js
const pythonCourse = new Course({
  name: "Python Course",
  author: "Terry Ogleton",
  tags: ["python", "backend"],
  isPublished: true,
});

async function addCourseDocToDb(courseDocument) {
  const result = await courseDocument.save();
  console.log(result);
}

addCourseDocToDb(nodeCourse);
```

When we run this, we call the `save` method on the Mongoose schema.  We will then have the Mongo document outputted to the console:
```
{
  name: 'Python Course',
  author: 'Terry Ogleton',
  tags: [ 'python' ],
  isPublished: true,
  _id: new ObjectId("62f4ac989d2fec2f01596b9b"),
  date: 2022-08-11T07:15:36.978Z,
  __v: 0
}
```

This will also be reflected in Compass:

![](/img/mongo-doc-added.png)
