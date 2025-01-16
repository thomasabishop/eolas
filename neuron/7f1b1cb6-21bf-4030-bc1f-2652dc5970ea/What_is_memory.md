---
tags: [memory]
created: Friday, July 12, 2024
---

# What is memory ?

> A CPU is just an operator on memory. It reads its instructions and data from
> the memory and writes back out to the memory. (Ward 2021)

When a [CPU](CPU_architecture.md) executes a program, it needs a place to store
the program's **instructions** and **related data**. This is the role of memory.

The data that comprises a program is a series of bits. The basic unit of memory
storage is a **memory cell**: a circuit that can store a single bit.

[RAM](DRAM_and_SRAM_memory.md) memory is _volatile_ : the memory is only
retained whilst the computer has a power supply and is wiped when the computer
is rebooted. This contrasts with the memory of the harddisk which is
non-volatile and is retained after a reboot.

Programs that are executing are loaded into memory because the chips that
comprise memory can read and store data much faster than the harddisk. It would
be possible to run a program from the harddisk but it would be 500 - 1000 times
slower than memory.
