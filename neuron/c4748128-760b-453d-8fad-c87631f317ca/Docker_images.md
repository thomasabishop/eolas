---
tags: [docker]
---

# Docker images

Docker needs an image to run a container. Images are stored in the local
registry. If it can't find it, it will try and pull it from Docker Hub.

## View your local images

```
docker images
```

```sh
REPOSITORY                     TAG       IMAGE ID       CREATED         SIZE
debian                         latest    e6d9c9c3e100   12 days ago     118MB
ubuntu                         latest    bab8ce5c00ca   6 weeks ago     69.2MB
cda/mysql-5.7                  latest    312ce2a6cea5   3 months ago    495MB
cda/node-16                    latest    b26e54c8fa11   3 months ago    1.44GB
bitnami/minio                  latest    ef6d14df2158   3 months ago    229MB
opensearchproject/opensearch   1.3.7     0f8ef57c3629   4 months ago    831MB
hello-world                    latest    46331d942d63   13 months ago   9.14kB
```

## Repository, registry, tag

When you specify the name of an image, you are referring to the image's
repository. The registry is the list of repositories available on the Docker
Hub. Each repository has a tag, indicating the current production branch.

For example:

```
docker run -it ubuntu:18:04 /bin/bash
```

- `ubuntu` is the image repository
- `18.04` is the image tag

> The Image ID distinguishes the image globally and is not local to you.

To get detailed info on an image:

```
docker image inspect debian
```

## "Dangling" images

A "dangling" image is an unused image - one that is not associated with a
container. Re move dangling images with

```
docker image prune
```

## Anatomy of a Docker image: layering

The process of constructing a Docker image involves creating a series of
intermediate layers, each representing a change or addition to the filesystem.
These layers are stacked on top of one another, forming the final image. This
approach is called layering.

Layering in Docker images offers several benefits:

1. Reusability: Common layers can be shared between multiple images, reducing
   disk space usage and build time. For example, if multiple images use the same
   base operating system, they can all share the same base layer.

2. Caching: During the build process, Docker caches layers that have already
   been built. If a layer hasn't changed, Docker will reuse it in subsequent
   builds, speeding up the build process.

3. Incremental updates: When updating an image, only the layers that have
   changed need to be updated and redistributed. This reduces the size of
   updates and makes the process more efficient.

Each instruction in the Dockerfile creates a new layer in the image. Some common
instructions include:

- `FROM`: Specifies the base image to start with (e.g., an operating system or
  an existing image).

- `RUN`: Executes a command, often used for installing packages or configuring
  the system.

- `COPY`: Copies files or directories from the host machine to the image.

- `ADD`: Similar to COPY but can also handle URLs and automatic extraction of
  archives.

- `ENV`: Sets environment variables that will be available inside the container.

- `CMD`: Specifies the default command to run when a container is started from
  the image.

- `ENTRYPOINT` : Similar to CMD, but allows the container to be run as an
  executable, with additional arguments.

When building an image, Docker starts with the base image specified in the FROM
instruction and applies each subsequent instruction, creating a new layer for
each step. The final result is a layered image that contains the application and
its dependencies, ready to be run as a container.

### The read-write layer

The final layer at the "top" of the image is a thin read-write layer. In
contrast to the intermediate layers it can execute read-write functionality and
is not read-only.

Files in the intermediate layer cannot be modified, only the read-write layer
can be modified. Files are copied over from intermediate layers when requested
by the read-write layer, rather being modified themselves.

Tip for writing build files:

Things that change less should be higher up (earlier). Things that change more
should be twoardds the end. This allows for better layer caching. Particularly
bear this in mind with the commands: RUN, COPY, ADD.
