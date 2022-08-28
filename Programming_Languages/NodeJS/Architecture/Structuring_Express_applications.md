---
categories:
  - Programming Languages
tags: [backend, node-js, REST, APIs, mongo-db]
---

# Structuring Express applications

In general, the following application structure works well:

```
\
    routes\
    models\
    middlewear\
    config\
    public\
  index.js

```

- **`routes/`**

  - This should house all our RESTful API endpoints for a given resource which we define as a module. For instance if we are handling API requests to `/api/courses/` we would have a module at `/routes/courses.js`

- **`models/`**
  - Here we define our database schemas: definitions for the structure of the data objects we want to return from the database.
  - In the case of Mongo we would have a file for each of our Mongoose models which will belong to an overall collection of which there are document instances.
  - Our model files should map onto our route modules; there should generally be at least one model file for each module. The model stands as an abstract representation of the data that we will be handling with our request paths in the routes file.
