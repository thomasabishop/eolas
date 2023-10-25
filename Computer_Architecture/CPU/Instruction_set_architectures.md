---
categories:
  - Computer Architecture
tags: [CPU]
---

# instruction set architectures

We know that the [ALU](/Computer_Architecture/CPU/Arithmetic_Logic_Unit.md) is responsible for the "execute" stage of the [fetch, decode, execute](/Computer_Architecture/CPU/Fetch_decode_execute.md) cycle, implementing the most basic binary operations such as adding two numbers.

Accross different machines and CPU types there can be differences in how the given instruction, say "add", is implemented. Not all computers will execute the instruction in the same way.

A family of CPUs that do implement the core instructions of the ALU in the same way are said to share an **instruction set architecture** (ISA). Software that is built for a certain ISA works on any CPU that implements that ISA.

> Note that this is a logical architecture rather than a physical architecture. Like ISA processors may work very differently on the hardware level whilst still adhering to the same ISA

## ARM and x86

The two main processor architectures are ARM and x86. x86 processors were first introduced by Intel but are also made by AMD.

### x86

The name stems from Intel's internal naming conventions - every new processor they introduced would have numerical designation ending with "86". Later they would adopt names such as "Pentium", "Celeron" etc. Regardless, these processors still fall under the "x86" family.

Over time, new instructions have been added to the x86 architecture but they all maintain backwards compatibility with preceding generations.

There have been different, successive generations of x86 corresponding to their [word-size](/Electronics_and_Hardware/Binary/Signed_and_unsigned_numbers.md): 16-bit, 32-bit, 64-bit. Word size here just means how many bits the processor can work with at a time.

A 34-bit processor can operate on values that are 32 bits in length. This means it has 32bit registers, a 32-bit data bus, a 32-bit address bus and so on.

AMD introduced the first 64-bit processor, not Intel but they later caught up. A 64-bit x86 processor is often referred to as _x64_ or _x86-64_.

### ARM

Whilst x86 processors dominate the personal computer and server space, on mobile a different instruction set architecture predominates: ARM. The ARM company develops the architecture and standard which it licenses it to other companies to implment.

They are preferred on mobile because they have reduced power consumption and lower costs compared to x86.

With ARM processors the processor is on a single chip that contains the CPU as well as memory and other hardware.
