---
tags:
- Databases
- mongo_db
---

# MongoDB: Introduction

MongoDB is not a relational database system like SQL, instead it is document-based which means you do not neeed to design database tables and schema, you are simply storing data as JSON and there is no transformation of the data. 

Most of the notes on Mongo will introduce it within the context of Node.js backend. We will be sending Javascript objects and arrays to Mongo and returning them as JSON. 

## Setting-up a MongoDB database

First create a directory for the database and set permissions:
```bash
$ mkdir /data/db
$ sudo chown -R `id -un` /data/db
```

Then start the Mongo daemon
```bash
mongod
```
This will run continuously in the terminal and should say somewhere that it is waiting for connections on port `27017`. This command must be executed before you run any backend that interacts with the Mongo database. 
### MongoDB Compass
_Compass_ is a graphical interface for viewing and interacting with the data in your Mongo database. It will automatically load to the default Mongo port: `27017`.

![](/img/mongo-compass.png)

### Arch Linux troublshooting
Most times any problems will be a result of a Mongo process that is already running. Resolve with:

```bash
# Kill running Mongo process...
# Identify PID
sudo lsof -iTCP -sTCP:LISTEN -n -P
sudo kill [pid]
```
Otherwise try the below.

```bash
# Check that the systemd service is runnign for Mongo
sudo systemctl status mongodb

# If not, enable and start service (only need to do this once for machine)
sudo systemctl enable --now mongodb
sudo systemctl start --now mongodb

# If issues with Mongo daemon...
# Remove the current socket
rm /tmp/mongodb-27017.sock
```

## Databases, collections, documents

Although Mongo is not a relational database it has a structure that we can understand in relation to that paradigm. A **database** is obviously the overall structure. It comprises **collections** which are organised sets of data that are analagous to [tables](/Databases/Relational_database_architecture.md#table) in RDBs. Within each collection are a series of **documents** which we can think of as being equivalent to [rows](/Databases/Relational_database_architecture.md) in RDB table: units that comprise the collection.

A document is a container comprising key-value pairs in the manner of an object. 

## Mongoose 

### Connecting to our database
Now that we have installed and configured MongoDB, we need to connect from it via Node.js.Mongoose is a simple API for interacting with a Mongo database via Node.

With this installed we can connect to a database. We don't have any Mongo databases yet beyond the defaults but the following Mongoose connection logic will create and connect to a new database called `playground`:

```js
mongoose
  .connect("mongodb://127.0.0.1/playground")
  .then(() => console.log("Connected to MongoDB"))
  .catch((err) => console.error(err));
```
### Creating collections and documents 

In order start adding collections and documents to our database, we use Mongoose's schema structure. (This is specific to the Mongoose wrapper and is not a structure that is a part of Mongo in general.)

We use a schema to define the shape of documents in a MongoDB collection. To do this we instantiate an instance of the Mongoose `Schema` class and set our properties:

#### Creating a schema

```js
const courseSchema = new mongoose.Schema({
  name: String,
  author: String,
  tags: [String],
  data: {type: Date, default: Date.now}, // if unspecified, entry will default to current date
  isPublished: boolean
});

```
This is just like defining an interace or type within TypeScript.
#### Available data types

The following data types are available:
* `String`
* `Number`
* `Boolean`
* `Array`
* `Date`
* `Buffer`
* `ObjectID` (for UUIDs)

#### Models

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
});
```
![](/img/mongohierarchy.svg)

// TODO: diagram schema - model - object 