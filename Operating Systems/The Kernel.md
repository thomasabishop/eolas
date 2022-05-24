---
tags:
  - Operating_Systems
  - Linux
---

# The Kernel

The kernel acts as the primary mediator between the hardware (CPU, memory) and user processes. Let's look at each of its responsibilities in greater depth:
* process management
* memory management
* device drivers
* system calls 

## Process management

> A process is just another name for a running program. Process management is the starting, pausing, resuming, scheduling and terminating of processes.

On modern computers it appears that multiple processes can run simultaneously at once. This is only because the processor is so fast that we do not detect changes. In fact access to the CPU is always sequential. The sequence in which multiple programs are allowed to access the CPU is managed by the kernel. 

> Consider a system with a one-core CPU. Many processes may be _able_ to use the CPU, but only one process can actually use the CPU at any given time...Each process uses the CPU for a fraction of a second, then pauses, then another process uses it for a fraction of a second and so on... (_How Linux Works: Third Edition_, Brian Ward 2021) 

This process of the CPU shuffling between multiple processes is called _context switching_. 

The role of the kernel in facilitating this, is as follows:
1. CPU runs process for a time slice based on its internal time. Then hands control back to the kernel (kernel mode)
2. Kernel records current state of CPU and memory. This is necessary in order to resume the progress that was just interupted.
3. The kernel executes any tasks that arose in the last timeslice executed by the CPU (e.g. collecting data from I/0)
4. Kernel then analyses the list of processes that are ready to run next and chooses one.
5. Kernel prepares memory for this new process and prepares the CPU.
6. Kernel tells CPU how long the time slice for the new process will last.
7. Kernel switches the CPU into user mode and hands control of CPU to the process.
