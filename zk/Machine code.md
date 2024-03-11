---
id: iqh8
title: Machine_code
tags: [binary, CPU]
created: Monday, March 11, 2024
---

# Machine code

No matter how a program was originally written, it eventually needs to execute
on a [[CPU_architecture|CPU]] as a series of machine language instructions.

## Example machine instruction

The following machine instruction is an instruction that would be understood by
an [[Instruction_set_architectures| ARM ISA]]. It moves the number `4` into the
`r7` register:

```
11100011101000000111000000000100
```

This 32bit line of binary has a series of instructions embedded within it. We
partition each part of the sequence below, from left to right, mapping it to the
instruction:

| Binary sequence | Instruction | Action |
| --------------- | ----------- | ------ |
| 1110            |             |        |
| 00              |             |        |
| 1101            |             |        |
