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
[user space](./User_Space.md) cannot directly read or write to the physical
memory. Instead they execute memory operations against virtual memory and the
[kernel](./The_kernel.md) translates these into the actual operations against
the memory hardware.

The main benefits:

- User mode processes do not have to be concerned with the physical memory
  management
- There is a buffer between user mode processes and physical memory, meaning
  that memory cannot be accidentally corrupted by other processes in user space.

Because the physical memory is abstracted, it can be the case that the physical
[memory addresses](./Memory_addresses.md) are non-contiguous or even distributed
accross different hardware components (such as the
[cache](./Register_and_cache_memory.md) and [swap](./Swap_space.md)). Despite
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

## Virtual memory and the kernel

The kernel itself utilises virtual memory.

During the [boot_process](Boot_process.md), it runs in physical memory mode
however it rapidly creates a 1:1 mapping of physical to virtual memory for
itself. This direct mapping allows the kernel to easily access any physical
memory location as needed, whilst retaining the benefits of virtual memory.

With its own virtual memory established, it can then build additional virtual
memory structures for itself and user processes.

While the kernel uses virtual memory it can also access physical memory at any
time wherease user space processes can only ever access virtual memory.

The kernel virtual memory has a different range of virtual addresses to work
with than user space virtual memory.

Unlike user space virtual memory, the kernel has access to everything running in
kernel address space whereas processes in user address space are partitioned
from each other with separate address spaces that cannot interact.

In addition to being able to access its own virtual memory (and physical memory,
as required) the kernel can also access any user processes' virtual address.

This said, the virtual memory space of the kernel and the virtual memory space
of the user processes are distinct. It is not the case that the kernel is
superset of all available virtual memory. It can access user space virtual
memory because it sets up the tables and locations, not because it is a subset
of its own virtual memory.

![Virtual memory diagram](/img/virtual-memory-diagram.jpg)
