---
tags:
  - memory
  - Linux
  - kernel
---

# Virtual memory

Virtual memory is an abstracted and idealised representation of the physical
memory capacity of a machine that is presented to user space for its memory
operations.

When an OS implements virtual memory, [processes](./Processes.md) in
[user space](./User_Space.md) cannot directly read or write to the actual
memory. Instead they execute memory operations against virtual memory and the
kernel translates these into the actual operations against the memory hardware.

The main benefits:

- User mode processes do not have to be concerned with the physical memory
  management
- There is a buffer between user mode processes and physical memory, meaning
  that memory cannot be accidentally corrupted by other processes in user space.

Because the physical memory is abstracted, it can be the case that the physical
[memory addresses](./Memory_addresses.md) are non-contiguous or even distributed
accross different hardware components (such as the cache and swap). Despite
this, the memory addresses will appear contiguous in virtual memory. Each user
space process is presented with the same range of available memory addresses and
the same total capacity.

It is also possible for the kernel to present user space with an available
virtual memory capcacity that exceeds the current physical capacity of the
machine:

> _It's possible for the kernel and all running processes to request more bytes
> of virtual memory than the total size of RAM. In that situation, the OS can
> move move bytes of memory to secondary storage to make room in RAM for newly
> requested memory._

_How Computers Really Work_ (2021) p.206

Furthermore the kernel itself utilises virtual memory. The difference with
kernel virtual memory is that it has a different range of virtual addresses to
work with than user space virtual memory.

Also, unlike user address space, the kernel has access to everything running in
kernel address space. Processes in user address space are partitioned from each
other with separate address spaces that cannot interact.

// Next: the kernel also uses virtual memory however isn't also responsible for
the appportioning of virtual memory. Confused.

![](/img/virtual-memory-diagram.jpg)
