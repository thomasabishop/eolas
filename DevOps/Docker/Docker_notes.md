# Unit 1

A (shipping) container is a standard unit of shipping.

Standardisd modular unit to transport goods from one location to another. Ships, trains, back of lorries.

Beforehand, shipping world was chaotic: inefficient, complex, frictional.

With containers, friction reduced driving down cost and increasing speeds of transport. Also led to automation.

Analogy is with software containers. Compare differences between local machine and production environment, test environment etc. Friction removed by containers.

> Linux containers are technologies that allow you to package and isolate applications with their entire runtime environment. This makes it easy to move the contained application between environments (dev, test, production, etc.) while retaining full functionality.

> Containers as a technology are distinct from Docker. You don't need Docker to create and run a container. Docker just makes the process much easier and standardises it.

> Containers are _Linux_ technology and are part of the Linux kernel. Running Linux containers do not require Docker.

There are Windows containers and Linux containers. You cannot run either on the other. (Windows uses Docker to run containers. Linux can do it natively.)

## How containers work

Using `cgroups` (control groups) feature of Linux, group bunch of processes together and constrain their resource usage (e.g. CPU and memory). Originally called "process containers" for this reason.

Use namespaces to provide _process isolation_ -> groups of processes are isolated so that they cannot access other processes on the system.

Containerisation = resource control + process isolation

TODO: Add diagrams from slides

In standard user space, applications and processes share the **same** processor, memory and file system resources. This means there can be resource challenges, dependency challenges and security challenges.

One application could fill up the hard drive preventing other applications from storing to it. One application can "bring down" another application.

In enterprise environment most of system administration was managing these resources to avoid resource expenditure (before containers) and security challenges.

Containers demarcate resource-constrained sub-sections of the user space that are ignorant of each other and the broader user space.

Docker exploited the capacity of the Linux kernel to create containers and simplified the setup and deployment of them.

> An image is a blueprint that contains the instructions to build a container. It's an immutable snapshot of the file system and configuration of an application. Images can be easily shared between developers.

> A container is a executable package that contains everything needed to run an application. It will always run the same, regardless of infrastructure, in a sandboxed environment. It is a running instance of an image.

## Difference with virtual machines

VMs require an OS. Containers do not. A VM contains a complete installation of a guest OS. Also provides isolation of resources (because you have an entirely separate OS).

The different OSs are managed by a hypervisor.

// TODO: Comparison table.

VMs are more heavyweight than a container runtime, slower and consume more resources.

The container runtime doesn't add overhead. It just starts up the container but after that, it is done since container handling is native to Linux. The kernel handles the rest.

## What is Docker ?

> Docker is an ecosystem of tools for creating, running and shipping containers.

Main product is Docker Desktop, a UI for running containers but the actual `docker` software is free and open source.

Docker standardised the use of containers and set up the open source Open Container Initiative, handing over its processs. The OCI is comprised of the major tech companies.

The OCI standardises the follwoing:

- Docker runtime specification
- Docker image specification
- Docker registry specification

Docker company used to offer a platform for companies to run docker containers but they eventually sold this and focused solely on Docker desktop (local running of images for development).

## Why use containers?

- portability
- scalability
- efficiency
- isolation
- DevOps agility

# Unit 2

Main components of Docker:

- docker engine
  - daemon that exposes the Docker API.
  - manages entire workflow aroung creating ,running and deploying containers.
- docker client
  - The CLI through which you interact with the docker engine
  - use it to manage images, containers and other docker objects
- docker compose
  - Sends REST requests to the engine. Two communicate over REST API principles
  - tool for running multi-container applications
  - run multiple containers for an application through a single YAML file (`docker compose`)
  - docker image
    - contain everything needed to run an application
    - can be exchanged and run on multiple systems
    - includes application binaries, libraries, resources
    - no OS but may include a particular distro
  - container
    - simply a running image instance
    - multiple identical containers can be launched from a single image
  - registry

// TODO: Add diagram of architecture

Distinguish Docker CLient from Docker Server

Client is thin API for making REST API calls to the server
Eg: (docker pull, docker build, docker run)

Server comprises `dockerd` - the docker engine, long-lived daemon process running continuously

On `docker run`, `dockerd` calls `containerd` which starts container runtimes and configuring container-level networking and storage. That's all it does. Another daemon process. It is a container _supervisor_

This spawns `containerd-shim` processes.

A shim takes any output from your container and puts it in a log file. This launches the runtime `runc` which handles cgroups and namespaces.

Once `runc` has created container, it's done and the container is self-standing in the kernel. It's like a launch scaffold that can be discarded. It is of course blind to the rest of the OS

Containers are created from images stored in a registry. Have local and remote registry. Locals are pulled from remote.

`containerd` then uses image to tell `runc` how to construct and build the image.

```
docker run  [image name]
```

This assumes you are using remote images. You can also create your own local images by writing your own Dockerfile. If local:

```
docker build [docker-file]
docker run [resulting-image]
```

Local images can then be distributed to remote registries.

Docker server also creates an internal virtual network and assigns IP addresses to the containers. (This can be used to get containers to communicate to each other over TCP/IP, since they are isolated by default.)

If you are running Docker desktop on Mac or Windows, Docker creates a Linux virtual machine, since it cannot run natively on Windows or Mac. In these cases the the Docker Server runs inside this VM adding an additional layer of abstraction.

## Basic usage

docker run hello-world

First time won't have the image to run container, will fetch from Docker Hub

See running processes (add `-a` flag for historic):

```
docker ps -a
```

````
CONTAINER ID   IMAGE                                COMMAND                  CREATED              STATUS                        PORTS                                                                NAMES
64d92f77c12f   hello-world                          "/hello"                 About a minute ago   Exited (0) 19 seconds ago                                                                          frosty_moser
d6c54f7801fe   cda/node-16                          "docker-entrypoint.s…"   3 months ago         Exited (255) 50 minutes ago   0.0.0.0:3000->3000/tcp, 0.0.0.0:3002->3002/tcp                       cda-node-16
ddb15b93b47e   cda/mysql-5.7                        "docker-entrypoint.s…"   3 months ago         Exited (255) 50 minutes ago   33060/tcp, 0.0.0.0:33066->3306/tcp                                   cda-mysql-5-7
567f35be3762   cda/mysql-5.7                        "docker-entrypoint.s…"   3 months ago         Exited (255) 50 minutes ago   33060/tcp, 0.0.0.0:33067->3306/tcp                                   cda-mysql-5-7-testing
dc8dca198f07   bitnami/minio:latest                 "/opt/bitnami/script…"   3 months ago         Exited (255) 50 minutes ago   0.0.0.0:9000-9001->9000-9001/tcp                                     cda-minio
9397d4c72679   opensearchproject/opensearch:1.3.7   "./opensearch-docker…"   3 months ago         Exited (255) 50 minutes ago   0.0.0.0:9200->9200/tcp, 9300/tcp, 0.0.0.0:9600->9600/tcp, 9650/tcp   cda-opensearch
``` 

Each container will be designated with a GUID and a random name for ease of reference
````

First lab:

https://docs.noomedia.com/labs/essential-docker/b/9AA25158-CDC5-412A-9590-2226F4ED81E9/Lab-01.-Introduction-to-Docker-Deskt

Key learnings:

Give custom name

```
docker run --name my-custom-name hello-world
```

Remove all containers

```
docker container prune
```

A "dangling" image is an unused image - one that is not associated with a container. Remove dangling images with

```
docker image prune
```

# Unit 3: Containers in depth

`docker run` implicitly means run within container but you can specify networks and other docker objects.

```
docker run debian /bin/echo "Hello, world"
```

Creates and runs a container from an image called `debian` and executes /bin/echo inside of it.

Once you have run this. If successful it will exit. The container will stop running (exit) but the container will still be in memory.

When `run` is used it grabs the image and constructs and starts a container using it.

It's actually combining two commands:

```
docker create --name my_container hello-world
docker start my_container
```

You can also run a container as a daemon. The container will run in the background and detaches it from the console:

```
docker run -d debian /bin/sh -c /bin/sh -c "while true; do echo 'Hello!'; sleep 1; done"
```

This will log every second

What will acutally be output is the container ID:

```
2749d796cbd64e9cf57307329e792587c39d8244f2377e62d78f3f3f77eecdb4
```

```
docker log 2749
hello
hello
hello

```

This will keep running in an infinite loop until:

```
docker stop 274
```

There will be a delay because it shuts down gracefully. It sends a SIGINT to the process in the container with PID 1 (i.e the root or parent process for the container)

stop keeps it in memory so it can be restarted and you can examine the logs.

if you use `docker rm 274`, it cannot be becovered and the logs are deleted.

We can tell Docker to immediately remove a container after it exits:

```
docker run --rm [container]
```

## Container lifecycle

//TODO : Add diagram of lifecycle.

## Interacting with containers

In the examples so far the container is a closed box. You don't have a terminal through which you can interact with the container as you would with an OS.

For images that have an OS we can use `-i -t` to launch a terminal in interactive mode.

```sh
docker run -i -t debian /bin/bash
root@0022da12f2f2:/# ls
bin  boot  dev	etc  home  lib	media  mnt  opt  proc  root  run  sbin	srv  sys  tmp  usr  var
root@0022da12f2f2:/# whoami
root
root@0022da12f2f2:/# ls usr/
bin  games  include  lib  libexec  local  sbin	share  src
```

Note that it defaults to the root user.

> Containers are lightweight and should only contain the minium environment needed to run an application.

Many programs and processes will not be there by default for this reason. Although you could install a package manager and install the commands you need.

If the container is already running, you can access it via the `exec` command.

```
docker exec -i -t my_container bash
```

If a container is running in detached mode we can attach to the main process with `docker attach`

```
docker attach my_container
```

## Container troubleshooting

Lots of diagnostic output:

```
docker inspect container_name
```

List processes (from outside):

```
docker top container_name
```

View logs

```
docker logs container_name

```

# Resources

https://www.taniarascia.com/continuous-integration-pipeline-docker/

# Unit 4: Docker images

Docker needs an image to run a container.
Images are stored in the local registry. If it can't find it, it will try and pull it from Docker Hub.

List images:

```
docker images
```

```sh
docker images
REPOSITORY                     TAG       IMAGE ID       CREATED         SIZE
debian                         latest    e6d9c9c3e100   12 days ago     118MB
ubuntu                         latest    bab8ce5c00ca   6 weeks ago     69.2MB
cda/mysql-5.7                  latest    312ce2a6cea5   3 months ago    495MB
cda/node-16                    latest    b26e54c8fa11   3 months ago    1.44GB
bitnami/minio                  latest    ef6d14df2158   3 months ago    229MB
opensearchproject/opensearch   1.3.7     0f8ef57c3629   4 months ago    831MB
hello-world                    latest    46331d942d63   13 months ago   9.14kB
```

When you specify the name of an image, you are referring to the repository. The registry is the list of repositories available on the Docker Hub.

Eg:

```
docker run -it ubuntu:18:04 /bin/bash
```

- `ubuntu` is the image repository
- `18.04` is the image tag

Without specifying a tag, Docker will default to `latest`.

Docker images also support different platforms, e.g. `arm64`, `amd64`

Docker will try to pull the image for your platform.

Linux-based Intel processors are represented by `amd64`

Examine image details:

```
docker image inspect
```

Remove an image:

```
docker rmi
```

## Anatomy of an image

An image is not a single file but a series of read-only layers like an onion.
When you pull an image, you will see multiple GUIDs listed in the terminal. Each one of these is a layer.

Each layer represents an incremental change to the previous layer. The first layer is the base layer and the layers on top are called intermediary layers. Each layer is hashed as a digest. This proves that the layer has not been manipulated.
