---
tags:
- Hardware
- memory
---

# The role of memory in computation

The following steps outline the way in which memory interacts with the processor during computational cycles, once the [bootstrapping](/Operating_Systems/Boot_process.md) process has completed and the OS kernel is itself loaded into memory. 

1. A file is loaded from the harddisk into memory.
2. The instruction at the first address is sent to the CPU, travelling accross the data bus part of the [system bus](/Hardware/Bus.md#system-bus).
3. The CPU processes this instruction and then sends a request accross the address bus part of the system bus for the next instruction to the memory controller within the [chipset](/Hardware/Chipset_and_controllers.md).
4. The chipset finds where this instruction is stored within the [DRAM](/Hardware/Memory/RAM_types.md#dram) and issues a request to have it read out and send to the CPU over the data bus. 