---
tags: [memory, Linux]
created: Monday, July 08, 2024
---

# Memory Management Unit (MMU)

The MMU is the bridge between the physical memory devices of the machine and the
virtual memory space. It is a chip that sits between the CPU and the RAM and
determines the physical location of the memory requested by the kernel as
virtual memory.

![Virtual memory diagram](/img/virtual-memory-diagram.jpg)

## Pages

We use the term **pages** to denote blocks of virtual memory and to distinguish
them from **addresses** as physical blocks. The MMU possesses a **page table**
which is registry logging which pages correspond to which physical blocks.

## Shared pages

Virtual memory allows the sharing of files and memory by multiple processes.
Crucially the shared data doesn't have to be within the address of each process,
instead there is a reference in the page table that each process has access to
the shared data.

## Page faults

There are two kinds of error that can occur with relation to paged memory:

- minor page faults
  - The desired page is in main memory but the MMU doesn't currently know where
    it is
- major page faults
  - The desired page is not in main memory at all. Therefore the kernel must
    fetch it from disk

Minor page faults are very common and are to be expected; they resolve quickly.
On the other hand too many major page faults can slow the system down both
because of the time-costly process of fetching data from disk and because it
demands more kernel resources to locate the missing page, which puts other
processes on hold.
