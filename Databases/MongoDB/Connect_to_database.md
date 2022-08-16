---
categories:
  - Databases
tags: [Databases, mongo_db, node_js, mongoose]
---

# Connect to a database with Mongoose

Now that we have installed and configured MongoDB, we need to connect to it via Node.js. Mongoose is a simple API for interacting with a Mongo database via Node.

With Mongoose installed we can connect to a database. We don't have any Mongo databases yet beyond the defaults but the following Mongoose connection logic will create and connect to a new database called `playground`:

Providing the Mongo server is running (execture `mongod`), we will see the confirmation message in the console.

```js
mongoose
  .connect('mongodb://127.0.0.1/playground')
  .then(() => console.log('Connected to MongoDB'))
  .catch((err) => console.error(err));
```
