---
tags: [docker, containerization]
---

# Docker: general overview

> Docker is an ecosystem of tools for creating, running and transporting
> containers.

The main product of the Docker company is Docker Desktop - a UI for running
containers however the actual `docker` software is free and open source.

Docker standardised the use of containers set up the open-source Open Container
Initiative which is a convention agreed upon by the major tech companies. It
codifies the following:

- Docker runtime specification
- Docker image specification
- Docker registry specification

## Main components

- **Docker Engine**
  - The core component
  - Exposes the Docker API and manages the entire workflow around creating,
    running and deploying containers
- **Docker Client**
  - The Docker CLI
  - The primary means of interacting with the Docker Engine
  - Provides commands for managing images, containers and other Docker objects
- **Docker Compose**
  - A tool for defining and running multi-container applications
  - Define the configuration for all of the containers that make up the
    application in a single YAML file
- **Docker Images**
  - See below
- **Docker Containers**
  - See below
- **Docker Registry**
  - A centralised location where Docker iamges can be stored and shared
  - DockerHub is the registry provided by Docker
  - Organisations can set up their own private registries

## Docker images

An image is a blueprint that contains the instructions to build a container.
It's an immutable snapshot of the file system and configuration of an
application. Images can be easily shared between developers.

They are runnable packages that contain everything needed to run an application
including the binaries, libraries, resources and other dependencies.

It does not contain an operating sytem but may include a particular Linux
distribution.

## Docker containers

A container is a runnign instance of a Docker image. Multiple, identical
containers can be launched from the same, single image.

## Docker architectural overview

See [Docker architecture](Docker_architecture.md).
