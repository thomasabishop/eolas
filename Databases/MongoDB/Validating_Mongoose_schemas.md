---
categories:
  - Databases
tags: [mongo_db, node-js, mongoose]
---

# Validating Mongoose schemas

Let's say we have the following schema:

```js
const courseSchema = new mongoose.Schema({
  name: { type: String, required: true, minlength: 5, maxlength: 255 },
  author: String,
  tags: [String],
  data: { type: Date, default: Date.now }, // if unspecified, entry will default to current date
  isPublished: Boolean,
});
```

We set our validation criteria as the second property for each schema value. If it does not obtain, an exception will be thrown when we attempt to modify the database. This will most likely take the form of a Promise rejection.

Note that this validation only occurs at the level of Mongoose. There is no mechanism for running the validation within the database itself. This is one of the ways that Mongo differs from an SQL database where you would be able to set the property of `required` for a cell in the table. If we didn't set any validation via Mongoose, Mongo would accept whatever we sent to it.

What is the relationship between this Mongoose validation and the [Joi](/Programming_Languages/NodeJS/REST_APIs/Validation.md) validation that we use when validating API requests in Node/Express? They complement each other. We use Joi to validate the client request to the API. If this is valid, the process would then move onto the next stage which would be transforming the data from a REST request to a database request implemented through Mongoose, where a second layer of validation would appy. We would also have validation on the client-side.

## Validator functions

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

## Enum validators

An enum validator enables us to ensure that whatever value is passed when instantiating a document that is of a given schema type, it must be one of a finite set of values:

```js
const anotherSchema = new mongoose.Schema({
  sex: {
    type: String,
    enum: ["male", "female"],
  },
});
```
