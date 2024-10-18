---
id: iqh8
tags:
  - binary
  - CPU
  - hardware
  - computer-architecture
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

This 32-bit line of binary has a series of instructions embedded within it. We
partition each part of the sequence below, from left to right, mapping it to the
instruction:

| Binary sequence | Instruction          | Action                                   |
| --------------- | -------------------- | ---------------------------------------- |
| 1110            | condition            | always execute (unconditional)           |
| 00              | --                   | --                                       |
| 1               | immediate            | value is in the last 8 bits              |
| 1101            | opcode               | `mov` : move the value                   |
| 0               | --                   | --                                       |
| 0000            | --                   | --                                       |
| 0111            | destination register | destination is 0111 which means `r7`     |
| 0000            | --                   | --                                       |
| 00000100        | immediate value      | the binary representation of decimal '4' |

- The blank zeros are also instructions, they are just not used in this
  instruction

- The condition sequence tells us the instruction should run in all conditions
  not only under certain circumstances

- The immediate bit (`1`) tells us whether the the value we are accessing is
  contained within the instruction or whether it is stored in a register. In
  this scenario `1` means the value is in the instruction. If it were `0`, the
  register where the value is located would be specified elsewhere in the
  instruction (in one of the currently blank sequences).

- The opcode correspoons to `mov` the value.

- THe destination register details where the value should be moved to (`r7`)

- Finally, the immediate value is equivalent to decimal `4`

## Difficulty

Binary sequences are hard to understand, even if converted to the
[[Hexadecimal_number_system]]. We have a better way of managing operations on
the machine level: [assembly](Assembly.md)
