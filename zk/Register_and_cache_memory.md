---
title: Register_and_cache_memory
tags: [memory, CPU]
created: Friday, July 12, 2024
---

# Register and cache memory

The CPU has its own memory devices in the form of registers and cache memory.

[Registers](./CPU_architecture.md#Registers) are a form of memory that are
positioned on the same chip as the CPU. They are very fast but can only store a
small amount of data. They are used to store the results of calculations and the
addresses of the next instructions to be processed.

The cache is SRAM memory that is separate from the DRAM memory which comprises
the main memory. It exists in order to boost perfomance when executing the
read/request cycles of the steps detailed above.

There are two types of cache memory:

- L1 cache
  - Situated on the CPU chip itself
  - Fastest to access but stores less
- L2 cache
  - Situated outside of the CPU on its own chip
  - Slower to access than L1 but can store more data

The L1 cache is the fastest since the data has less distance to travel when
moving to and from the CPU. This said, the L2 cache is still very fast when
compared to the main memory, both because it is SRAM rather than DRAM and
because it is closer to the processor than the main memory.

Cache controllers use complex algorithms to determine what should go into the
cache to facilitate the best performance, but generally they work on the
principle that what has been previously used by the CPU will be requested again
soon. If the CPU has just asked for an instruction at memory location 555 it's
very likely that it will next ask for the one at 556, and after that the one at
557 and so on. The cache's controller circuits therefore go ahead and fetch
these from slow [DRAM to fast SRAM](./DRAM_and_SRAM_memory.md).
