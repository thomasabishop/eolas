---
tags: [memory]
created: Friday, July 12, 2024
---

# The role of memory in computation

The following steps outline the way in which memory interacts with the processor
during computational cycles, once the [bootstrapping](Boot_process.md) process
has completed and the OS kernel is itself loaded into memory.

1. A file is loaded from the harddisk into memory.
2. The instruction at the first address is sent to the CPU, travelling accross
   the data bus part of the [system bus](Bus.md).
3. The CPU processes this instruction and then sends a request accross the
   address bus part of the system bus for the next instruction to the memory
   controller within the [chipset](Chipset_and_controllers.md).
4. The chipset finds where this instruction is stored within the
   [DRAM](Memory.md#dram) and issues a request to have it read out and send to
   the CPU over the data bus.

> This is a simplified account; it is not the case that only single requests are
> passed back and forth. This would be inefficient and time-wasting. The kernel
> sends to the CPU not just the first instruction in the requested file but also
> a number of instructions that immediately follow it.

![Memory flow diagram](/static/memory-flow.svg)

Every part of the above process - the journey accross the bus, the lookup in the
controller, the operations on the DRAM, the journey back accross the bus - takes
multiple CPU clock cycles.
