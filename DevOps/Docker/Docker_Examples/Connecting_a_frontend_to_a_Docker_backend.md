---
categories:
  - DevOps
  - Databases
tags: [docker, SQL, node-js]
---

# Connecting a frontend to a Docker backend

Building on from [NodeJS backend with MySQL database](/DevOps/Docker/Docker_Examples/Node_and_MySQL_db.md) we can add a frontend by adapting the existing [Docker Compose](/DevOps/Docker/Docker_Compose.md) files (one for each environment) to accept an additional dependency.

We won't create a container for the frontend as this is not necessary.

We would add the following to the `services` section of the compose file:

```yml
services:
  ...
  frontend:
    build: ./frontend
    container_name: frontend_app
    ports:
      - "3000:3000"
    environment:
      - REACT_APP_API_URL=http://localhost:3001
    depends_on:
      - app
```

The `REACT_APP_API_URL` environment variable tells the frontend application where to find the backend API. This will then be accessbile via `process.env` and can be used directly in the frontend, e.g:

```js
fetch(`${process.env.REACT_APP_API_URL}/api/data`)
  .then((response) => response.json())
  .then((data) => {
    // Process the data from the backend API
  });
```
