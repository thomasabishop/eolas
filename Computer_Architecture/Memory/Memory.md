---
categories:
  - Computer Architecture
  - Hardware
tags: [memory, motherboard]
---

# Memory

## Why do we need memory?

> A CPU is just an operator on memory. It reads its instructions and data from the memory and writes back out to the memory. (Ward 2021)

When a [CPU](/Computer_Architecture/CPU/CPU_architecture.md) executes a program, it needs a place to store the program's **instructions** and **related data**. This is the role of memory.

## What is memory?

The data that comprises a program is a series of bits. The basic unit of memory storage is a **memory cell**: a circuit that can store a single bit.

## Memory types

There are two types of memory: SRAM and DRAM. Both types of RAM memory are _volatile_ : the memory is only retained whilst the computer has a power supply and is wiped when the computer is rebooted. This contrasts with the memory of the harddisk which is non-volatile and is retained after a reboot.

Programs that are executing are loaded into memory because the chips that comprise memory can read and store data much faster than the harddisk. It would be possible to run a program from the harddisk but it would be 500 - 1000 times slower than memory.

#### DRAM

DRAM uses capacitors to create the memory cell:

> a **capacitor** is an electronic component that stores electrical energy in an electrical field. A device which can accumulate and release electrical charge.

In a DRAM cell, each bit of data is stored as a charge in a capacitor. The presence of charge represents a '1' bit and the absence of charge represents a '0' bit. Each of these cells is paired with a [transistor](/Electronics_and_Hardware/Digital_circuits/Transistors.md) that controls the reading and writing of data.

However capacitors lose [charge](/Electronics_and_Hardware/Analogue_circuits/Current.md) over time due to leaks. As a result DRAM is memory that needs to be refreshed (recharged) frequently. For this reason and because it only uses one transistor and capacitor per bit, DRAM is the less expensive form of volatile memory.

#### SRAM

SRAM (Static Random Access Memory) is also volatile memory but its electronical implementation is different. Unlike DRAM it doesn't use capacitors. Consequently the transistors do not leak or need to be refreshed, hence why SRAM is _static_ and DRAM is _dynamic_.

SRAM uses [flip flops](/Electronics_and_Hardware/Digital_circuits/Flip_flops.md) to store the bits. It also uses multiple transistors per bit. This makes it faster than DRAM but more expensive. DRAM is at least ten times slower than SRAM.

## Memory addresses

> Computers assign numeric addresses to bytes of memory and the CPU can read or write to those addresses

We can think of the internals of RAM as grids of memory cells.

Each single-bit cell in the grid can be identified using two dimensional coordinates, like in a graph. The coordinates are the location of that cell in the grid.

Handling one bit at a time isn't very efficient so RAM accesses **multiple grids** of 1-bit memory cells in parallel. This allows for reads or writes of multiple bits at once, such as a whole byte.

The location of a set of bits in memory is known as a **memory address**.

### Demonstration

Let's imagine we have a computer system that can address up to 64KB of memory and our system is byte addressable. This means there are $64 \cdot 1024 = 65,536$ bytes of memory because 1KB = 1024 bytes.

We therefore have 65,536 addresses and each address can store one byte. So our addresses go from 0 to 65, 535.

We now need to consider how many bits we need to represent an address on this system.

ChatGPT account: https://chat.openai.com/c/921e1415-4965-4fc4-af11-58db5dcef0f1
