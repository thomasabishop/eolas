---
categories:
  - Databases
tags: [mongo_db, node_js, mongoose]
---

# Create collections and documents with Mongoose

## Collections and documents

In order start adding collections and documents to our database, we use Mongoose's schema structure. This is specific to Mongoose and is not a structure that is a part of Mongo in general.

We use a schema to define the shape of documents in a MongoDB collection. To do this we instantiate an instance of the Mongoose `Schema` class and set our properties:

### Creating a schema

```js
const courseSchema = new mongoose.Schema({
  name: {type: String, required: true, minlength: 5, maxlength: 255},
  author: String,
  tags: [String],
  data: {type: Date, default: Date.now}, // if unspecified, entry will default to current date
  isPublished: Boolean,
});
```

> This is similar to declaring a type or interface in TypeScript

// TODO: Add printout of what the rejection will look like in the console.

#### Available data types

The following data types are available:

- `String`
- `Number`
- `Boolean`
- `Array`
- `Date`
- `Buffer`
- `ObjectID` (for UUIDs)

### Validating a schema

Note that we set our validation criteria as the second property for each schema value. If it does not obtain, an exception will be thrown when we attempt to modify the database. This will most likely take the form of a Promise rejection.

Note that this validation only occurs at the level of Mongoose. There is no mechanism for running the validation within the database itself. This is one of the ways that Mongo differs from an SQL database where you would be able to set the property of `required` for a cell in the table. If we didn't set any validation via Mongoose, Mongo would accept whatever we sent to it.

What is the relationship between this Mongoose validation and the [Joi](/Programming_Languages/NodeJS/REST_APIs/Validation.md) validation that we use when validating API requests in Node/Express? They complement each other. We use Joi to validate the client request to the API. If this is valid, the process would then move onto the next stage which would be transforming the data from a REST request to a database request implemented through Mongoose, where a second layer of validation would appy. We would also have validation on the client-side.

#### Validator functions

Instead of simply applying a built-in validator like `required`, we can instead pass a function that validates agains the validation status of another property in the schema. For instance: make the `price` property required only if the entry has `true` for `isPublished`:

```js
const courseSchema = new mongoose.Schema({
  ...
  isPublished: Boolean,
  price: {
    type: Number,
    required: function() {return this.isPublished}
  }
});
```

#### Enum validators

An enum validator enables us to ensure that whatever value is passed when instantiating a document that is of a given schema type, it must be one of a finite set of values:

```js
const anotherSchema = new mongoose.Schema({
  sex: {
    type: String,
    enum: ['male', 'female'],
  },
});
```

### Models

Once we have established our schema we can then create a **model** of it. A model is basically a class representation of the interface we define in the schema:

```js
const Course = mongoose.model('Course', courseSchema);
```

With this in place, we can then create instances of the model. This stands in relation to the model as an object does to a class:

```js
const course = new Course({
  name: 'Node.js Course',
  author: 'Ozzy Osbourne',
  tags: ['node', 'backend'],
  isPublished: true,
});
```

![](/img/mongoose-hierarchy.svg)

Having created a database, connected to it with Mongoose, and created a model we will see our collection reflected in Compass:

![](img/../../../img/mongo-collection.png)

### Adding a document

We have our database (`playground`) and collection (`courses`) established. We now need to add documents to our collection. We will move our previous code into a function since this will be an asynchronous process:

```js
const pythonCourse = new Course({
  name: 'Python Course',
  author: 'Terry Ogleton',
  tags: ['python', 'backend'],
  isPublished: true,
});

async function addCourseDocToDb(courseDocument) {
  try {
    const result = await courseDocument.save();
    console.log(result);
  } catch (err) {
    console.error(err.message);
  }
}

addCourseDocToDb(nodeCourse);
```

When we run this, we call the `save` method on the Mongoose schema. We will then have the Mongo document outputted to the console:

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
