---
id: zadl
title: Threads
tags: [operating-systems]
created: Wednesday, June 26, 2024
---

# Threads

A ![process](Processes.md) is a running instance of a given program. A program
runs sequentially handling one task at a time, however we may need to run
certain tasks in parallel.

Think of a program that is downloading a resource from the internet and wants to
update the UI at the same time to show the download process.

If the program is strictly sequential, once the program starts the download, the
UI is neglected since the CPU time dedicated to the process must be focused
elsewhere.

We need the UI update and the download to execute in parallel. This is achieved
via operating system **threads of execution**.

> A thread is a schedulable unit of execution within a process. It runs within a
> process, shares its memory address and can execute any program code loaded
> within it.

## Related notes

![Processes](Processes.md)
