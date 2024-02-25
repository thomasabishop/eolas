---
id:
tags:
  - AWS
  - vm
created: Monday, February 19, 2024 | 18:58
last_modified: Monday, February 19, 2024 | 18:58
since: just now
title: Elastic Compute Cloud (EC2)
---

# Elastic Compute Cloud (EC2)

- Cloud-based or virtual server (virtual machine), basically a hypervisor
  (compare [[zk/Docker_architecture]])
- It is virtual because you are not responsible for its physical implementation
- Still needs considerable configuration compared to a serverless
  [[zk/Lambda_programming_model]]
- Like lambdas has the benefit of easy scaling: you can add compute capacity on
  demand (elasticity)

The following needs to be considered:

- Naming
- Application and OS image (known as "Amazon Machine Image"):
  - Which OS you want to use (Linux distribution, Windows, etc)
  - Applications you want pre-installed
  - Block device mapping
- Instance type an size (basically the type of processor and how powerful you
  want it to be)
- An encrypted key-pair for login
- Your network (typically managed via Amazon VPC (Virtual Private Cloud)) and
  network security
- Storage: size and type (eg. GP3)
- Location and latency

> EC2 is more expensive copared to serverless options. Accordingly it is better
> to run smaller servers (in terms of processor and memory) at higher capacity
> than larger servers under-capacity.
