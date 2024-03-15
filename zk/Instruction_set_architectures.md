---
tags: [CPU]
---

# Instruction Set Architectures

## Summary

- Computers with different hardware execute machine code instructions (e.g
  _add_) in different ways. They have different _instruction set architectures_
  (ISAs).

- A family of CPUs that implement the core instructions of the
  [[Arithmetic_Logic_Unit]] in the same way share an ISA. Any software built for
  that ISA will work on any CPU that implements the ISA

- The two main CPU architectures are ARM and x86

## Detail

## Architecture is logical not physical

The "architecture" of an ISA is logical rather than physical, i.e processors
that share an ISA may work very differently on the hardware level whilst still
adhering to the same instruction set.

## ARM and x86

The two main processor architectures are ARM and x86. x86 processors were first
introduced by Intel but are also made by AMD.

### x86

- First introduced by Intel but also made by AMD.

- Name stems from Intel's internal naming conventions - every new processor they
  introduced would have a letter designation ending with "86". Later they would
  adopt names such as "Pentium", "Celeron" etc. Regardless, these processors
  still fall under the "x86" family.

- Over time, new instructions have been added to the x86 architecture but they
  all maintain backwards compatibility with preceding generations.

- There have been different, successive generations of x86 corresponding to
  their [word-size](Signed_and_unsigned_numbers.md): 16-bit, 32-bit, 64-bit.
  Word size here just means how many bits the processor can work with at a time.
  A 34-bit processor can operate on values that are 32 bits in length. This
  means it has 32bit [[CPU_architecture#registers|registers]], a 32-bit data
  [[Bus|bus]], a 32-bit address bus and so on.

- AMD introduced the first 64-bit processor, not Intel but they later caught up.
  A 64-bit x86 processor is often referred to as _x64_ or _x86-64_.

### ARM

- x86 processors dominate the personal computer and server space

- On movile devices ARM ISA predominates

- The ARM company develops the architecture and standard which it licenses it to
  other companies to implement.

- Preferred on mobile because they have reduced power consumption and lower
  costs compared to x86.

- The processor is on a single chip that contains the CPU as well as memory and
  other hardware.
