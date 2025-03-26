---
tags: [CPU]
---

# The Little Man Computer

The [Little Man Computer]() is a simplified computer that works on Von Neuman
principles. It has all the CPU components we have detailed above. It is
programmed in machine code but for simplicity it uses the denary rather than the
binary number system.

![LMC_5.gif](static/LMC_5.gif)

On the left is the instruction set. Each number constitutes and execution
routine and the `xx` stand for the address in RAM that the execution will work
on.

Each row of the RAM has a denary address, 1 through to 99. Each address can hold
three digits.

- So the instruction `560` would mean _load the number at address 60._
- The instruction `340` would mean _store a datum at address 40_

### Working through a basic computation

We are going to add two numbers together as a basic example.

1. First we need to place the two numbers in RAM we are going to use `5` and `3`
   - At address `60` we will put the number `5` and at address `61` we will put
     the number `3`
   - We are going to start at address `0` in the top left of the RAM grid
1. The first instruction will be _load address 60_ which in the assembly will be
   `560` . We put this in address `0`, our starting point.
1. This first instruction is now stored in the accumulator.
1. Now we want to _add this number (in the accumulator) to the number in address
   61_
1. This second instruction is `161` . We write this in address `1`
1. Finally we want to store the output of the calculation in the RAM, let's say
   at address `62`
1. So we store the command `362` at address `2`
