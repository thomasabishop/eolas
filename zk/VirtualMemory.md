---
tags:
  - memory
  - Linux
---

# Virtual memory and the Memory Management Unit

## What is virtual memory?

Virtual memory is an abstraction of physical memory capacity and allocation that
is accessible to user space. The kernel handles physical memory allocation and
presents this to user space as a simplified and idealised representation of the
available memory of the system.

The main benefits:

- User mode processes do not have to be concerned with the physical memory
  management
- There is a buffer between user mode processes and physical memory, meaning
  that memory cannot be accidentally corrupted by other processes in user space.

When a process writes or reads from a virtual memory address this does not
directly refer to a hardware memory location. The kernel translates this into a
physical memory address but this is opaque to the user space process. In fact,
the physical memory addresses could be distributed accross multiple
non-contiguous locations such as cache and swap memory, not just DRAM.

Although the physical memory may be distributed and non-contiguous, from the
viewpoint of user space, the available virtual memory is contiguous. Each user
space process is presented with the same range of available memory addresses and
the same total capacity.

Because this is virtual, there is no risk of one process reading or overwriting
the address of another. The same virtual address for multiple programs maps to
different physical addresses.

// Next: more memory offered than is physically available.
![](/img/virtual-memory-diagram.jpg)
