---
categories:
  - Programming Languages
tags: [backend, node-js, REST, APIs, validation]
---

# Creating a RESTful API: Validation

We can provide server-side validation for our projects by using a **schema validator**. This is a program that declaratively parses the JSON values received as requests from the client. This makes it easy to systematically validate the data that we receive from any HTTP requests where the client sends a body to the endpoint.

One of the most popular schema validators for NodeJS is [joi](https://www.npmjs.com/package/joi).

## Demonstration

Let's say we have a POST request that expects a single field as the body that must be a string and greater than two characters long. First we define our schema:

```js
const schema = Joi.object({
  name: Joi.string().min(3).required(),
});

const { error } = schema.validate(req.body);
```

The `schema` variable is an object whose keys should match those of the intended request body. Instead of actual values we provide Joi's in-built validators, concatenated as necessary. We then store the results of the validation in a variable.

Next we add handling in the case of errors:

```js
if (error) {
  error.details.map((joiErr) => res.status(400).send(joiErr.message));
  return;
}
```

We loop through the error array and return 400s as the response if they are found. If there are no errors, the Joi object will return `undefined`.
