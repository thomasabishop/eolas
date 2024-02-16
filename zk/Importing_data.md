---
categories:
  - Databases
tags: [mongo-db, node-js]
---

# Importing data to MongoDB

We can use the command line to import data into a Mongo database. We can also
combine the importing of data with the creation of a database:

```bash
mongoimport --db [preexisting_or_new_database name] --collection [collection_name] --file sourcedata.json --jsonArray
```

We use `--jsonArray` to indicate the format of the data we are importing.

Once this has executed, the data will be visible in Compass.
