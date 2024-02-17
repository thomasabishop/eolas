---
categories:
  - DevOps
tags: [docker]
---

# Docker Compose

- Docker Compose (DC) is a tool for defining and running multi-container
  applications. A typical example would be combining a FE with a BE
  implementation and database as three related but distinct containers.

- DC is a prime example of _infrastructure as code_.

- A YAML file defines all the required configuration and **all services can be
  started with a single command**.

- It provides a consistent configuration accross environments: development,
  test, production

## Composition

Three step process:

1. Define your application image in a Dockerfile
2. Define the services in `docker-compose.yaml` (backend services, networks,
   volumes)
3. Start the entire application with `docker compose up`

### `docker-compose.yml`

- Must always begin with `version`
- Must have `services` map
  - This defines the different components that comprise your application
  - Services can be either an image reference (the one that generates the
    container you want to include) or a build context

Look at the following example. It runs a Python Flask frontend connected to a
Redis key-value pair database for backend.

```yml
# docker-compose.yml

version: "3.9"
services:
  web:
    build: . # here we are using the current directory as the build context
    image: myapp:1.0
    ports:
      - "5050:5000"
    depends_on:
      - redis
  redis:
    image: "redis:alpine"
```

`depends_on` is important - it means this container must be running first before
any others. If this is a DB, it means the data is accessible before the frontend
request start.

## Main commands

```sh
# start the composition:
docker compose up -d

# start a specific service within the composition:
docker compose up -d web
docker compose up -d redis

# view logs for a specific service
docker compose logs --follow web

# view processes by activity
docker compose top
```

## Environment variables

You can define them in the compose file or name them and leave them blank. If
you do this, Docker will look in the host environment for the variable which is
really handy:

```yml
...
services:
  redis:
    ...
    environment:
      ENV1: 'some value'
      ENV2:
```

## See also

[NodeJS and MySQL Docker backend](Node_and_MySQL_db.md)
