---
tags:
  - docker
  - SQL
  - node-js
  - databases
---

# Docker example: NodeJS backend with MySQL database

We will utilise [Docker Compose](Docker_Compose.md) to combine
two containers:

- A container for the NodeJS backend
- A container for the MySQL database

We will only create a Dockerfile for the NodeJS part since the existing `mysql`
image is sufficient for most needs and does not require a specific
configuration.

Each of the files listed below would be saved to the same source directory which
would then form the basis of the
[build context](Creating_a_Docker_image.md#creating-a-docker-image).

## Docker Compose file

```yml
# docker-compose.yml
version: "3.8"
services:
  db:
    image: mysql:8.0
    container_name: mysql_container
    environment:
      MYSQL_ROOT_PASSWORD: your_root_password
      MYSQL_DATABASE: your_database_name
      MYSQL_USER: your_database_user
      MYSQL_PASSWORD: your_database_password
    volumes:
      - mysql-data:/var/lib/mysql
    ports:
      - "3306:3306"
  app:
    build: .
    container_name: node_app
    volumes:
      - .:/usr/src/app
    environment:
      MYSQL_HOST: db
      MYSQL_USER: your_database_user
      MYSQL_PASSWORD: your_database_password
      MYSQL_DB: your_database_name
    depends_on:
      - db
    ports:
      - "3000:3000"

volumes:
  mysql-data:
```

## Dockerfile for the NodeJS backend

```Dockerfile
# Dockerfile
FROM node:14

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD [ "node", "app.js" ]
```

## NodeJS project setup

```json
// package.json
{
  "name": "node-mysql-docker",
  "version": "1.0.0",
  "description": "Node.js and MySQL with Docker",
  "main": "app.js",
  "scripts": {
    "start": "node app.js"
  },
  "dependencies": {
    "express": "^4.17.1",
    "mysql2": "^2.3.2"
  }
}
```

```js
// app.js
const express = require("express");
const mysql = require("mysql2/promise");

const app = express();

const { MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DB } = process.env;

const createConnection = async () => {
  return await mysql.createConnection({
    host: MYSQL_HOST,
    user: MYSQL_USER,
    password: MYSQL_PASSWORD,
    database: MYSQL_DB,
  });
};

app.get("/", async (req, res) => {
  const connection = await createConnection();
  const [rows] = await connection.query("SELECT 1 + 1 AS solution");
  res.send(`Hello World! The solution is ${rows[0].solution}`);
});

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
```

To start up the environment you would then run:

```
docker-compose -up
```

## Environments

In the example, the database connection information in the Node source is coming
from the
[`process.env`](Managing_environments.md)
object, which itself is sourcing the values `MYSQL_HOST`, `MYSQL_PASSWORD` etc
from the Docker compose file. Therefore these values are hardcoded there.

This is not good practice as it exposes sensitive information and make managing
different deployment environments (development, stage, test etc.) difficult.

To get around this we would create an `.env` file in the project directory that
is Git ignored:

```sh
# .env
MYSQL_ROOT_PASSWORD=your_root_password
MYSQL_DATABASE=your_database_name
MYSQL_USER=your_database_user
MYSQL_PASSWORD=your_database_password
```

Then the `docker-compose.yml` file can be updated to use these variables:

```yml
version: "3.8"
services:
  db:
    image: mysql:8.0
    container_name: mysql_container
    environment:
      MYSQL_ROOT_PASSWORD: ${MYSQL_ROOT_PASSWORD}
      MYSQL_DATABASE: ${MYSQL_DATABASE}
      MYSQL_USER: ${MYSQL_USER}
      MYSQL_PASSWORD: ${MYSQL_PASSWORD}
    volumes:
      - mysql-data:/var/lib/mysql
    ports:
      - "3306:3306"
  app:
    build: .
    container_name: node_app
    volumes:
      - .:/usr/src/app
    environment:
      MYSQL_HOST: db
      MYSQL_USER: ${MYSQL_USER}
      MYSQL_PASSWORD: ${MYSQL_PASSWORD}
      MYSQL_DB: ${MYSQL_DATABASE}
    depends_on:
      - db
    ports:
      - "3000:3000"

volumes:
  mysql-data:
```

`${VARIABLE_NAME}` syntax is used to reference environment variables from the
.env file in the `docker-compose.yml` file. Docker Compose will automatically
load the variables from the .env file when starting the services.

### Development, staging, production environments

To specify different connection details for different environments you would
create different `.env` files for each:

- `.env.development`
- `.env.staging`
- `.env.production`

Each file will contain **environment-specific variables**, such as database
credentials, API keys, and other configuration details.

For example, development and production:

```yml
# docker-compose.development.yml
version: '3.8'
services:
  db:
    ...
  app:
    ...
    environment:
      MYSQL_HOST: db
      MYSQL_USER: ${MYSQL_USER}
      MYSQL_PASSWORD: ${MYSQL_PASSWORD}
      MYSQL_DB: ${MYSQL_DATABASE}
      NODE_ENV: development

```

```yml
# docker-compose.production.yml
version: '3.8'
services:
  db:
    ...
  app:
    ...
    environment:
      MYSQL_HOST: db
      MYSQL_USER: ${MYSQL_USER}
      MYSQL_PASSWORD: ${MYSQL_PASSWORD}
      MYSQL_DB: ${MYSQL_DATABASE}
      NODE_ENV: production
`
```

Then you would select the specific environment with your run command:

```
docker-compose -f docker-compose.development.yml up -d
```

Docker won't know by default which `.env` file to use from that command however.
Assuming all the files are in the same directory you can use Bash substitution
to specify the source of the environment specific variables:

```sh
export $(cat .env.development | xargs) && docker-compose -f docker-compose.development.yml up -d
```
