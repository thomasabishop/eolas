---
title: DRAM_and_SRAM_memory
tags: [memory, hardware]
created: Friday, July 12, 2024
---

# DRAM_and_SRAM_memory

There are two types of RAM memory: [SRAM and DRAM](./DRAM_and_SRAM_memory.md).

### DRAM

DRAM uses capacitors to create the memory cell:

> a **capacitor** is an electronic component that stores electrical energy in an
> electrical field. A device which can accumulate and release electrical charge.

In a DRAM cell, each bit of data is stored as a charge in a capacitor. The
presence of charge represents a '1' bit and the absence of charge represents a
'0' bit. Each of these cells is paired with a [transistor](Transistors.md) that
controls the reading and writing of data.

However capacitors lose [charge](Current.md) over time due to leaks. As a result
DRAM is memory that needs to be refreshed (recharged) frequently. For this
reason and because it only uses one transistor and capacitor per bit, DRAM is
the less expensive form of volatile memory.

### SRAM

SRAM (Static Random Access Memory) is also volatile memory but its electronical
implementation is different. Unlike DRAM it doesn't use capacitors. Consequently
the transistors do not leak or need to be refreshed, hence why SRAM is _static_
and DRAM is _dynamic_.

SRAM uses [flip flops](Flip_flops.md) to store the bits. It also uses multiple
transistors per bit. This makes it faster than DRAM but more expensive. DRAM is
at least ten times slower than SRAM.
