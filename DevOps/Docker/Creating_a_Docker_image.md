---
categories:
  - DevOps
tags: [docker]
---

# Creating a Docker image

We create a new image with `docker build...`

The key components of a build:

- A Dockerfile
- An asset directory (the **build context**) containing the Dockerfile and all
  resources needed for the build.

## Syntax

Here is an example of a Dockerfile that builds a container for running a Python
app:

```Dockerfile
# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]

```

### Main syntax explained

| Keyword   | Role                                                                                                                                                                                                                                                                   |
| --------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| #         | Lines starting with '#' are comments, providing explanations or context for the Dockerfile.                                                                                                                                                                            |
| `FROM`    | Specifies the base image used to build the new image. In this case, it's using the official Python 3.8 slim image.                                                                                                                                                     |
| `WORKDIR` | Sets the working directory for any subsequent instructions in the Dockerfile. Here, it's set to '/app'. Everything after a `WORKDIR` line, all instructions will be executed in this directory. If it doesn't exist, Docker will create it. Can have multiple.         |
| `COPY`    | Copies files or directories from the source (in this case, the current directory) to the destination (in this case, '/app') within the Docker image. The source is the build context. We are copying from the build context to the container when we use this keyword. |
| `ADD`     | Same as `COPY` but can be passed a tarball or a URL                                                                                                                                                                                                                    |
| `RUN`     | Executes a command and commits the result as a new layer in the image. In this example, it installs packages specified in the 'requirements.txt' file using pip.                                                                                                       |
| `EXPOSE`  | Informs Docker that the container listens on the specified network ports at runtime. In this case, port 80.                                                                                                                                                            |
| `ENV`     | Sets an environment variable in the image. In this example, the variable 'NAME' is set to 'World'.                                                                                                                                                                     |
| `CMD`     | Specifies the command to run when the container starts. Here, it runs 'app.py' using Python. Note that there can only be one CMD instruction in a Dockerfile.                                                                                                          |
| `USER`    | The default user will be `root`. This is not good for security. Have to choose a distribution image that allows you to change user. For example: `USER: nobody:nogroup`. Ubuntu allows for this.                                                                       |
| `LABEL`   | Metadata that you want to add to the image to be viewable when image is inspected, e.g. `LABEL maintainer=tactonbishop@gmail.com`                                                                                                                                      |

### Another example

The following Dockerfile creates a frontend React application:

```Dockerfile
# Use the official Node.js image as the base image
FROM node:14-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy the rest of the application code
COPY . .

# Expose the port the app will run on
EXPOSE 3000

# Start the React development server
CMD ["npm", "start"]
```

### Two modes of `RUN`: shell and exec

The RUN command in a Dockerfile has two forms: the "exec" form and the "shell"
form. Both forms are used to execute commands during the build process, but they
have different syntax and behavior.

Exec form is written as `RUN ["executable", "param1", "param2", ...]`. This form
executes the command directly without invoking a shell. As a result, shell
processing features like environment variable substitution, pipes, and redirects
are not available. It is the preferred form when you need to run a command
without relying on shell behavior or when you want to avoid shell-related
issues, such as variable substitution or command injection.

Shell form is written as `RUN command param1 param2 ....` This form executes the
command within a shell, which is /bin/sh -c on Linux and cmd /S /C on Windows.
It allows for shell processing, enabling environment variable substitution,
pipes, redirects, and other shell features. This form is preferred when you need
to use shell features or when you want to chain multiple commands together.

## Environmental variables

> ENV instructions in a Dockerfile are used to define environment variables that
> can be accessed by the processes running inside the container. These variables
> can be used to configure the behavior of the application, pass parameters, or
> store sensitive information like API keys.

```Dockerfile
# Use an official Node.js runtime as a parent image
FROM node:14-alpine

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json into the container
COPY package*.json ./

# Install any needed packages specified in package.json
RUN npm ci

# Copy the rest of the application code
COPY . .

# Set environment variables
ENV PORT=8000
ENV API_KEY=my_secret_key

# Expose the port the app will run on
EXPOSE 8000

# Run the app
CMD ["npm", "start"]
```

In this example, two environment variables are defined: PORT and API_KEY. These
variables can be accessed in the application code using process.env.PORT and
process.env.API_KEY in Node.js, for example.

To override the environment variables defined in the Dockerfile when running the
container, you can use the -e flag followed by the variable name and its new
value in the docker run command:

```sh
docker run -e PORT=8080 -e API_KEY=new_secret_key -p 8080:8000 <image_name>
```
