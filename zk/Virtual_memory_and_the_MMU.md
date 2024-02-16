---
categories:
  - Computer Architecture
  - Hardware
tags: [memory]
---

# Virtual memory and the Memory Management Unit

## What is virtual memory?

Virtual memory is implemented at the level of the operating system and is an
abstraction on top of 'real', physical memory (i.e the charges stored within the
actual DRAM component.).

When virtual memory is used, the CPU handles physical memory allocation and
presents this to the kernel as an idealised representation. This means that the
kernel and, by extension, programs and processes do not need to think about
accessing the real memory blocks. This reduces complexity because often memory
will be allocated in places that are non-contiguous with similar running
processes or be located in the cache or swap memory on the disk.

![](/img/virtual-memory-diagram.jpg)

It would require considerable processing work for the kernel to be tracing these
disparate memory sources at every instance. By working on an idealised
(contiguous, unlimited) memory set the kernel can focus on task management and
CPU sequencing as its primary task.

The memory is idealised in that all locations are represented virtually as being
contiguous (even when this is not physically the case). Secondly, quantities of
available memory can be presented as much larger than is actually the case and
which often exceed the physical memory limits of the device. This is achieved
through paging, handled by the MMU.

## The Memory Management Unit (MMU)

Without an MMU, when the CPU accesses RAM, the actual RAM locations never
change. The memory address is always the same physical location within the RAM.
The MMU is a chip that sits between the CPU and RAM recalculating the actual
memory address from the virtual memory location requested by the kernel.

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

## Resources

[Virtual memory](https://www.cs.uic.edu/~jbell/CourseNotes/OperatingSystems/9_VirtualMemory.html#:~:text=Virtual%20memory%20also%20allows%20the,to%20more%20than%20one%20process)
