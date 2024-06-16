---
tags: [docker, containerization, Linux]
---

# Containerizaton

> In this entry we look at containerization as a general technology that is
> distinct from its particular implementation by Docker.

We can understand the role and significance of containers and containerization
by analogy with shipping containers. Before the invention of shipping containers
as a **standardised modular unit** for transporting goods, shipping and supply
chains were chaotic: inefficient, complex, frictional. With the advent of the
shipping container, the same artefact could be used for transportation via
ships, trains, lorries etc.

With containers we can share and transport software via a single standardised
unit that works regardless of the host operating system or server. We can also
iterate different software environments easily: local, production, test etc. As
with the shipping of goods, standardisation has driven down running costs and
increased the speed of transport.

## Containers and software

- Containers are a technology that allow you to package and isolate applications
  with their entire runtime environment. This makes it easy to move the
  contained application between various environments whilst retaining full
  functionality.

- The technology of containerization is distinct from _Docker_. Docker is a
  particular implementation of containerization that simplifies the process and
  bases it on a standardised specification.

- Containers are native to the Linux [kernal](The_kernel.md)
  and are key part of how it works. Thus when you run containers on Linux, you
  are using native capability. When you use containers on Windows or Mac you
  have to run a virtual version of Linux in order to exploit the capabilities of
  that kernel. (Docker provides this)

## How containers work

A key feature of the Linux kernal is the existence of **cgroups** (control
groups).

> Containerization = resource control + process isolation

- A cgroup **groups a series of processes together and contrains their access to
  system resources (CPU, memory, disk)**
- Cgroups use namespaces to provide **process isolation**: groups of processes
  are isolated so that they cannot access other processes on the system. For
  example a container is ignorant of the underlying operating system and
  network, by default.

In ordinary [user space](User_Space.md) applications share
the _same_ processor, memory and file system resources. This increases the
likelihood of resourcing challenges, dependency conflicts and security threats.
Without modularisation and the titration of resources, you are opened up to much
greater possibility of failure.

For example one application could fill up the harddrive preventing other
applications from writing to it. One application can "bring down" another
applicaton.

Prior to containerization, in an enterprise environment most of the system
administration consisted in managing resouces to avoid excessive resource
expenditure and security challenges.

_Standard userspace_

![](/img/standard-userspace.png)

_Userspace with containerization_

![](/img/containers-in-userspace.png)

## Differences with virtual machines

Containers are similar in many regards to VMs. They both offer a virtualized
environment in which to run software and they both provide isolation of
resources. (When you start up a VM you specify the available RAM and disk
space.)

The central difference is that VMs require the existence of a full operating
system. Containers can run without an OS although it is often convenient to run
them with stripped-down Linux distributions.

A VM contains a complete installation of a guest OS and requires a hypervisor on
the host OS to manage the different operating environments. This makes them
slower and consume more resources.

A containerized system radically reduces this overhead. It just starts up the
container and after that it's job is done since the Linux kernel handles the
rest as it would any other process on the OS.

| Virtual Machine                             | Container                               |
| ------------------------------------------- | --------------------------------------- |
| Isolation of resources and operating system | Isolation of resources only             |
| Require a hypervisor to run                 | Require a container runtime to run      |
| Slower due to additional abstraction        | Faster due to less overhead             |
| Less portable                               | More portable                           |
| Slower and more difficult to run            | Scale rapidly due to lightweight nature |

![](/img/container-versus-vm.png)

## Why use containers?

- portability
- scalability
- efficiency
- isolation
- DevOps agility
