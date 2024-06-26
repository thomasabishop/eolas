---
id: t70u
title: Processes
tags: [operating-systems]
created: Friday, June 21, 2024
---

# Processes

Programs are sequences of machine instructions stored in a file. However they do
not work by themselves. Something needs to load the file's intructions into
memory, direct the CPU to run the program and manage it during runtime. The OS
does this via processes.

A process **is a running instance of a given program**. It can be thought of as
a container in which a program runs. This container includes:

- a copy of the program code loaded into memory
- a memory address
- other information about the state of the process

Other than the `init` process started by the kernel (PID1) (see
![systemd](systemd.md)), every process has a parent process that started it.
This parent-child relationship creates a tree of processes.

It is possible that a parent process will terminate before one of its child
processes. In this instance the child becomes an orphan. When this occurs in
#Linux, the orphan process is adopted by `init`.

Below, I have used the `pstree` utility to list all the running processes on my
machine hierarchically.

![diagram of `pstree` output](../img/ps-tree.png)

Children are represented vertically and horizontally.

```
├─terminator─┬─zsh───tmux: client
│            ├─zsh───pstree
│            └─6*[{terminator}]

```

For instance here, `terminator` is a child of `init`, as are `zsh` and `tmux`
but they are also children of `terminator`.`pstree` is a child of `zsh` and
therefore also a child (grandchild) of `terminator`.

Each process has a unique identifier called a _process identifier_, a
_processID_ or just _PID_.

## Related notes

![systemd](./systemd.md)

![ps](./ps.md)

![Monitoring processes and resources](Monitoring_processes_and_resources.md)
