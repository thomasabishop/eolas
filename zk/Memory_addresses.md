---
title: Memory_addresses
tags: [memory]
created: Friday, July 12, 2024
---

# Memory addresses

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
given number of addresses. We can do this with a [logarithm](Logarithms.md).

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
[hexadecimal numbers](Hexadecimal_number_system.md) to represent the addresses:

| Memory address (as hex) | Data (as binary) |
| ----------------------- | ---------------- |
| 0x0000                  | 1010101010101010 |
| 0x0001                  | 0010001001001011 |
| 0x0002                  | 0010001001001010 |

By itself, the the data is meaningless but we know from
[binary encoding](Binary_encoding.md) that the binary data will correspond to
some meaningful data, such as a character or a colour, depending on the encoding
scheme used. The above table could correspond to the characters for 'A', 'B' and
'C' in the ASCII encoding scheme:

| Memory address (as hex) | Data (as binary) | Data (as ASCII) |
| ----------------------- | ---------------- | --------------- |
| 0x0000                  | 1010101010101010 | A               |
| 0x0001                  | 0010001001001011 | B               |
| 0x0002                  | 0010001001001010 | C               |
