---
tags: [docker, containerization]
---

# Docker architecture

## Overview

![](/img/dock-architecture.png)

- The Docker Client is a thin API for making
  [REST API](RESTful_APIs.md) to the Docker Server. Any CLI
  command beginning `docker...` is an API request to the server.
- The internal process name for the server is `dockerd`.
- On `docker run...`, `dockerd` calls `containerd`. This process starts the
  container runtimes and configures container-level storage and networking.
- This then spawns `container-shim` procecesses which takes any output from you
  container and puts it in a logfile. (A redirection of `stdout` and `stderr`)
  One shim is spawned for each container.
- The shim then launches a container runtime called `runc`. The `runc` performs
  all the complex configuration of cgroups and namespaces to create the
  container environment.
- `containerd` is purely a bootstrapper. Once it has fulfilled its function by
  initiating `runc`, the Docker instance is up and running and the kernel takes
  it from there. It is like a launch scaffold that can be discarded.

> If you are running Docker desktop on Mac or Windows, Docker creates a Linux
> virtual machine, since it cannot run natively on Windows or Mac. In these
> cases the the Docker Server runs inside this VM adding an additional layer of
> abstraction.

> Docker server also creates an internal virtual network and assigns IP
> addresses to the containers. (This can be used to get containers to
> communicate to each other over TCP/IP, since they are isolated by default.)

## Images

Containers are created from images stored in a registry (either the public
Docker Hub or privately). `containerd` uses the image to tell `runc` how to
construct and build the image.

```sh
docker run [image_name]
```

The images you have pulled from the registry are stored in a local registry on
your machine.

When you run `docker run`, Docker will look first for the image in your local
registry. If it cannot find it there, it will attempt to pull it from the remote
registry.

This assumes you are using a third-party image. You can also create your own
images by writing a Dockerfile:

```sh
docker build [docker_file]
docker run [resulting_image]
```
