---
categories:
  - Programming Languages
  - Databases
tags: [backend, node-js, REST, APIs, mongo-db]
---

# Creating a RESTful API: Integrating the database

So far we have set up the application and an `/api/courses` route which handles requests for RESTful API operations on a local array of course objects. We now want to have the endpoints operate on a MongoDB `courses` collection rather than the array.
