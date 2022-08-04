---
tags:
  - memory
  - bits
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

SRAM (Static Random Access Memory) is also volatile memory but, in terms of the electronics, it is different in its implementation. In contrast to DRAM it doesn't use capacitors. As a result the transistors do not leak and therefore do not need to be refreshed, hence why SRAM is _static_ and DRAM is _dynamic_. It also uses multiple transistors  per bit. This makes it faster than DRAM but more expensive. DRAM is at least ten times slower than SRAM.

## References

Ward, Brian. 2021. _How Linux works_. No Starch Press.
