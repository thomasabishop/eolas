---
categories:
  - Computer Architecture
  - Hardware
tags: [memory, motherboard]
---

# Memory

## Why do we need memory?

> A CPU is just an operator on memory. It reads its instructions and data from
> the memory and writes back out to the memory. (Ward 2021)

When a [CPU](/Computer_Architecture/CPU/CPU_architecture.md) executes a program,
it needs a place to store the program's **instructions** and **related data**.
This is the role of memory.

## What is memory?

The data that comprises a program is a series of bits. The basic unit of memory
storage is a **memory cell**: a circuit that can store a single bit.

## Memory types

There are two types of memory: SRAM and DRAM. Both types of RAM memory are
_volatile_ : the memory is only retained whilst the computer has a power supply
and is wiped when the computer is rebooted. This contrasts with the memory of
the harddisk which is non-volatile and is retained after a reboot.

Programs that are executing are loaded into memory because the chips that
comprise memory can read and store data much faster than the harddisk. It would
be possible to run a program from the harddisk but it would be 500 - 1000 times
slower than memory.

#### DRAM

DRAM uses capacitors to create the memory cell:

> a **capacitor** is an electronic component that stores electrical energy in an
> electrical field. A device which can accumulate and release electrical charge.

In a DRAM cell, each bit of data is stored as a charge in a capacitor. The
presence of charge represents a '1' bit and the absence of charge represents a
'0' bit. Each of these cells is paired with a
[transistor](/Electronics_and_Hardware/Digital_circuits/Transistors.md) that
controls the reading and writing of data.

However capacitors lose
[charge](/Electronics_and_Hardware/Analogue_circuits/Current.md) over time due
to leaks. As a result DRAM is memory that needs to be refreshed (recharged)
frequently. For this reason and because it only uses one transistor and
capacitor per bit, DRAM is the less expensive form of volatile memory.

#### SRAM

SRAM (Static Random Access Memory) is also volatile memory but its electronical
implementation is different. Unlike DRAM it doesn't use capacitors. Consequently
the transistors do not leak or need to be refreshed, hence why SRAM is _static_
and DRAM is _dynamic_.

SRAM uses [flip flops](/Electronics_and_Hardware/Digital_circuits/Flip_flops.md)
to store the bits. It also uses multiple transistors per bit. This makes it
faster than DRAM but more expensive. DRAM is at least ten times slower than
SRAM.

## The role of memory in computation

The following steps outline the way in which memory interacts with the processor
during computational cycles, once the
[bootstrapping](/Operating_Systems/Boot_process.md) process has completed and
the OS kernel is itself loaded into memory.

1. A file is loaded from the harddisk into memory.
2. The instruction at the first address is sent to the CPU, travelling accross
   the data bus part of the [system bus](/Computer_Architecture/Bus.md).
3. The CPU processes this instruction and then sends a request accross the
   address bus part of the system bus for the next instruction to the memory
   controller within the
   [chipset](/Computer_Architecture/Chipset_and_controllers.md).
4. The chipset finds where this instruction is stored within the
   [DRAM](/Computer_Architecture/Memory/Memory.md#dram) and issues a request to
   have it read out and send to the CPU over the data bus.

> This is a simplified account; it is not the case that only single requests are
> passed back and forth. This would be inefficient and time-wasting. The kernel
> sends to the CPU not just the first instruction in the requested file but also
> a number of instructions that immediately follow it.

![](/_img/memory-flow.svg)

Every part of the above process - the journey accross the bus, the lookup in the
controller, the operations on the DRAM, the journey back accross the bus - takes
multiple CPU clock cycles.

## CPU register and cache memory

As partly indicated in the diagram above, the CPU has its own memory in the form
of registers and cache memory.

Registers are a form of memory that are positioned on the same chip as the CPU.
They are very fast but can only store a small amount of data. They are used to
store the results of calculations and the addresses of the next instructions to
be processed.

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
these from slow DRAM to fast SRAM.

## The memory hierarchy

The diagram below compares the different forms of memory within a computing
device in terms of speed, monetary cost and capacity:

![](/_img/Memory-Hierarchy.jpg)

## Memory addresses

> Computers assign numeric addresses to bytes of memory and the CPU can read or
> write to those addresses

We can think of the internals of RAM as grids of memory cells.

Each single-bit cell in the grid can be identified using two dimensional
coordinates, like in a graph. The coordinates are the location of that cell in
the grid.

Handling one bit at a time isn't very efficient so RAM accesses **multiple
grids** of 1-bit memory cells in parallel. This allows for reads or writes of
multiple bits at once, such as a whole byte.

The location of a set of bits in memory is known as a **memory address**.

### Demonstration

Let's imagine we have a computer system that can address up to 64KB of memory
and our system is byte addressable. This means there are
$64 \cdot 1024 = 65,536$ bytes of memory because 1KB = 1024 bytes.

We therefore have 65,536 addresses and each address can store one byte. So our
addresses go from 0 to 65, 535.

We now need to consider how many bits we need to uniquely represent an address
on this system.

What does this mean? Although there are approximately 64 thousand bytes of
memory, to refer to each byte we can't just use 1, 2, 3... because computers use
binary numbers. We need a binary number to refer to a given byte in the the 64KB
of memory. The question we are asking is: how long does this binary number need
to be to be able to represent each of the 64 thousand bytes?

1 bit can represent two addresses: 0 and 1. 2 bits can represent four addresses:
00, 01, 10, 11. The formula is as follows: number of addresses = $2^n$ where $n$
is the number of bits.

We need to reverse this formula to find out how many bits we need to represent a
given number of addresses. We can do this with a
[logarithm](/Mathematics/Algebra/Logarithms.md).

We can reverse the formula as follows: number of bits = $\log_2$(number of
addresses).

In our case we have 65,536 addresses so we need $\log_2(65,536)$ bits to
represent each address. This is approximately 16 bits. Thus a 16 bit memory
address is needed to address 65, 546 bytes.

Using memory addresses we end up with tables like the following:

| Memory address   | Data             |
| ---------------- | ---------------- |
| 0000000000000000 | 1010101010101010 |
| 0000000000000001 | 0010001001001011 |
| 0000000000000010 | 0010001001001010 |

This is hard to parse so we can instead use
[hexadecimal numbers](/Electronics_and_Hardware/Binary/Hexadecimal_number_system.md)
to represent the addresses:

| Memory address (as hex) | Data (as binary) |
| ----------------------- | ---------------- |
| 0x0000                  | 1010101010101010 |
| 0x0001                  | 0010001001001011 |
| 0x0002                  | 0010001001001010 |

By itself, the the data is meaningless but we know from
[binary encoding](/Electronics_and_Hardware/Binary/Binary_encoding.md) that the
binary data will correspond to some meaningful data, such as a character or a
colour, depending on the encoding scheme used. The above table could correspond
to the characters for 'A', 'B' and 'C' in the ASCII encoding scheme:

| Memory address (as hex) | Data (as binary) | Data (as ASCII) |
| ----------------------- | ---------------- | --------------- |
| 0x0000                  | 1010101010101010 | A               |
| 0x0001                  | 0010001001001011 | B               |
| 0x0002                  | 0010001001001010 | C               |
