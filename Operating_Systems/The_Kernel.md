---
tags:
  - Operating_Systems
  - Linux
  - processes
---

# The Kernel

The kernel acts as the primary mediator between the hardware (CPU, memory) and user [processes](../Programming_Languages/Shell_Scripting/Processes.md). Let's look at each of its responsibilities in greater depth:
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

## Memory management
During the context switch from CPU to user space, the kernel allocates memory. It has the following jobs to manage:
* Keeping its own private area in memory for itself that user processes cannot access
* Assigning each user process its own section of memory 
* Managing shared memory between processes and ensuring the private memory of processes is not accessed by others
* Managing read-only memory 
* Allowing for the use of disk space as auxiliary memory 

> Modern CPUs include a memory management unit which provides the kernel with **virtual** memory. In this scenario, memory isn't directly accessed by the process instead it works on the assumption that is has access to the entire memory of the machine and this is then translated into a map that is applied to the real memory and managed by the kernel.

## Device drivers

Devices are managed by the kernal and are not accessible directly via user space, since improper usage could crash the whole machine. There is little uniformity between devices and as a result drivers are needed. Thes are kernl code that enable different OS kernels to access and control the devices.

## System calls 
Syscalls are what enable programs to start and are required for the acts of opening, reading and writing files. System calls in Linux are typically managed via C. 

In Linux there are two particularly important system calls:

* `fork()`
  * When a process calls fork, the kernel creates a nearly identical copy of this running process
* `exec()`
  * When a process calls exec it passes a program name as a parameter. Then the kernel loads and starts this program, replacing the current process.

Example with a terminal program like `ls`: 
> When you enter `ls` into the terminal window, the shell that's running inside the terminal window calls `fork()` to create a copy of the shell, and then the new copy of the shell calls `exec(ls)` to run `ls`.  (_Ibid._)

## Controlling processes
In Linux we can view, kill, pause and resume processes using [ps](../Programming_Languages/Shell_Scripting/Processes.md).