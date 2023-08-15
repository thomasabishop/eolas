---
categories:
  - Computer Architecture
tags: [memory]
---

# The role of memory in computation

The following steps outline the way in which memory interacts with the processor during computational cycles, once the [bootstrapping](/Operating_Systems/Boot_process.md) process has completed and the OS kernel is itself loaded into memory.

1. A file is loaded from the harddisk into memory.
2. The instruction at the first address is sent to the CPU, travelling accross the data bus part of the [system bus](/Computer_Architecture/Bus.md).
3. The CPU processes this instruction and then sends a request accross the address bus part of the system bus for the next instruction to the memory controller within the [chipset](/Computer_Architecture/Chipset_and_controllers.md).
4. The chipset finds where this instruction is stored within the [DRAM](/Computer_Architecture/Memory/Memory.md#dram) and issues a request to have it read out and send to the CPU over the data bus.

> This is a simplified account; it is not the case that only single requests are passed back and forth. This would be inefficient and time-wasting. The kernel sends to the CPU not just the first instruction in the requested file but also a number of instructions that immediately follow it.

![](/_img/memory-flow.svg)

Every part of the above process - the journey accross the bus, the lookup in the controller, the operations on the DRAM, the journey back accross the bus - takes multiple CPU clock cycles.

## The role of the cache

The cache is SRAM memory that is separate from the DRAM memory which comprises the main memory. It exists in order to boost perfomance when executing the read/request cycles of the steps detailed above.

There are two types of cache memory:

- L1 cache
  - Situated on the CPU chip itself
- L2 cache
  - Situated outside of the CPU on its own chip

The L1 cache is the fastest since the data has less distance to travel when moving to and from the CPU. This said, the L2 cache is still very fast when compared to the main memory, both because it is SRAM rather than DRAM and because it is closer to the processor than the main memory.

Cache controllers use complex algorithms to determine what should go into the cache to facilitate the best performance, but generally they work on the principle that what has been previously used by the CPU will be requested again soon. If the CPU has just asked for an instruction at memory location 555 it's very likely that it will next ask for the one at 556, and after that the one at 557 and so on. The cache's controller circuits therefore go ahead and fetch these from slow DRAM to fast SRAM.

## Relation between cache and buffers

The terms _cache_ and _buffer_ are often used interchangeably because they are both types of temporary storage used to speed up CPU operations. Also they are both mechanisms for avoiding writing data to a storage device in the midst of active computation. They are different however:

- A cache is used to store a subset of data (typically transient in nature) from a more permanent or slower storage location. In the context of the CPU, the L1 is a cache whereas the DRAM is the more permanent storage location.
- A buffer is a temporary storage area for data while it is being transferred from one place to another. It helps with "smoothing out" data transfers, ensuring that the sending and receiving entities (which might operate at different speeds) can handle the data transfer effectively.

Whereas a CPU cache is a **physical** part of the processor a buffer is more of a **logical** concept implemented within the system software. However a buffer does use physical memory - it is portion of RAM set aside for temporary storage.

[Registers](/Computer_Architecture/CPU/CPU_architecture.md#registers) should not be confused with caches. Unlike the caches, registers are a part of the CPU itself. They are much quicker but hold less data than the caches.
