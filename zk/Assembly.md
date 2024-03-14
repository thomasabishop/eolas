---
id: 2v5c
title: Assembly
tags: [CPU]
created: Tuesday, March 12, 2024
---

# Assembly

## Summary

- Assembly is one level up from machine code and provides a more human-friendly
  abstraction layer

- An assembly instruction is a _mneumonic_ that comprises an "op code" plus
  operands

## Detail

### Example instruction

We can translate the machine instruction `e3a07004` into the assembly
instruction `mov r7, #4`. This translates to: _move the value number 4 to the
register r7_.

### Assemblers

Although assembly is useful for humans, computers still work at the level of
machine code. Therefore you need an **assembler** to translate the assembly code
to machine code. An assembly language text file is fed into an assembler and a
binary object file containing machine code is returned.

## Relation to instruction set architectures

## Applications

## Related notes

[[Hexadecimal_number_system]], [[Instruction_set_architectures]]

Summary, My Insight, Applications, Related Not
