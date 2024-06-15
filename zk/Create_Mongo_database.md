---
tags:
  - mongo-db
  - node-js
  - mongoose
  - databases
---

# Creating a MongoDB database

First create a directory for the database and set permissions:

```bash
$ mkdir /data/db
$ sudo chown -R `id -un` /data/db
```

Then start the Mongo daemon

```bash
mongod
```

This will run continuously in the terminal and should say somewhere that it is
waiting for connections on port `27017`. This command must be executed before
you run any backend that interacts with the Mongo database.

## MongoDB Compass

_Compass_ is a graphical interface for viewing and interacting with the data in
your Mongo database. It will automatically load to the default Mongo port:
`27017`.

![](/img/mongo-compass.png)
