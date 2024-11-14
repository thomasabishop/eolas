---
id: zadl
tags: [operating-systems]
created: Wednesday, June 26, 2024
---

# Threads

A ![process](static/Processes.md) is a running instance of a given program. A program
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

Each thread has an identifier called a _thread ID_ (TID).

Both procesess in [user space](User_Space.md) and the [kernel](The_kernel.md)
utilise threads.

## Hardware considerations

Each [processor core](CPU_architecture.md) can only run one thread at a time so
the number of cores that a device's CPU has deterimines how many threads can run
at once. In practice, then, the CPU shuffles between multiple threads in
[clock segments](Clock_signals.md). This is known as scheduling and is managed
by the process that the thread belongs to.

## Related notes

![Processes](static/Processes.md)
