---
categories:
  - Computer_Architecture
  - Hardware
tags: [memory, motherboard]
---

# Memory

In essence the memory is just a temporary and volatile storage area for a series of binary digits. Each slot for a 0 or 1 is called a bit:

> This is where the running kernal and processes reside - they're just big collections of bits. A CPU is just an operator on memory. It reads its instructions and data from the memory and writes back out to the memory. (Ward 2021)

Technically, the harddisk is also memory but nonvolatile although we typically distinguish "disk storage" from memory. We can think of memory as active storage that is utilised during runtime and disk memory as dormant storage that only becomes active once it is loaded into memory.

Programs that are executing are loaded into memory because the chips that comprise memory can read and store data much faster than the harddisk. It would be possible to run a program from the harddisk but it would be 500 - 1000 times slower than memory.
## Memory types

### DRAM

When we think of memory we generally think of the _main_ memory: the 8GB or 16GB+ slots of volatile, non-permanent storage that is utilised by the CPU during the runtime of programs. This is DRAM memory: Dynamic Random Access memory. DRAM uses capacitors that lose charge over time due to leaks. As a result DRAM is memory that needs to be refreshed (recharged) frequently. For this reason and because it only uses one transistor and capacitor per bit, DRAM is the less expensive form of volatile memory. 

### SRAM 

SRAM (Static Random Access Memory) is also volatile memory but, in terms of the electronics, it is different in its implementation. In contrast to DRAM it doesn't use capacitors. As a result the transistors do not leak and therefore do not need to be refreshed, hence why SRAM is _static_ and DRAM is _dynamic_. It also uses multiple transistors  per bit. This makes it faster than DRAM but more expensive. DRAM is at least ten times slower than SRAM. SRAM is used as [cache memory](/Hardware/Memory/Role_in_computation.md#the-role-of-the-cache) on the [motherboard](/Hardware/Motherboard.md) of which there are two types: L1 (on the processor chip) and L2 (separate from the processor).
### Relative speeds
The table below details the relative speeds of the different types of memory and those of other types of motherboard storage.

| Storage type | Access speed (clock cycles) | Relative times slower |
|--------------|-----------------------------|-----------------------|
| CPU register | 2                           |                       |
| L1 cache     | 4                           | 2x                    |
| L2 cache     | 6-20                        | 3-10x                 |
| DRAM memory  | 50                          | 25x                   |
| Harddisk     | 2000                        | 1000x                 |


## References

Ward, Brian. 2021. _How Linux works_. No Starch Press.
