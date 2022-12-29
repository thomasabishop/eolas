---
categories:
  - Databases
tags: [mongo-db, node-js, mongoose]
---

# Creating a schema and model

## Schema

In order start adding [collections and documents](/Databases/MongoDB/Introduction.md) to our database, we use Mongoose's **schema** structure. (This is specific to Mongoose and is not a structure that is a part of Mongo in general.)

We use a schema to define the shape of documents in a MongoDB collection. To do this we instantiate an instance of the Mongoose `Schema` class and set our properties:

### Creating a schema

```js
const courseSchema = new mongoose.Schema({
  name: { type: String, required: true, minlength: 5, maxlength: 255 },
  author: String,
  tags: [String],
  data: { type: Date, default: Date.now }, // if unspecified, entry will default to current date
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

> Note that we set our validation criteria as the second property for each schema value. There is more info info on validation in a [separate entry](/Databases/MongoDB/Validating_Mongoose_schemas.md);

## Models

Once we have established our schema we can then create a **model** of it. A model is basically a class representation of the interface we define in the schema:

```js
const Course = mongoose.model("Course", courseSchema);
```

Now we can start adding specific courses as documents to our collection. We do this by referring to the model, i.e.

```js
const course = new Course({
  name: "Node.js Course",
  author: "Ozzy Osbourne",
  tags: ["node", "backend"],
  isPublished: true,
});
```

![](/_img/mongoose-hierarchy.svg)

## Outcome

Having created a database, connected to it with Mongoose, and created a model we will see our collection reflected in Compass:

![](img/../../../_img/mongo-collection.png)
