---
categories:
  - DevOps
  - Backend
tags: [AWS, docker]
---

# Local AWS development with SAM

We can run a local instance of our SAM stack for a given application without sending requests to the cloud. This is implemented through Docker.

The SAM CLI handles all the Docker-related tasks, such as pulling the required Lambda runtime images, creating containers, mounting your code and dependencies, and running your Lambda functions inside those containers.

## Basic set up

Enter your project directory.

First build your SAM application:

```sh
sam build
```

We then run:

```sh
sam local start-api
```

You should see the following:

![](/_img/local-sam-docker.png)
