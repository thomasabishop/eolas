---
categories:
  - Computer Architecture
tags: [CPU]
---


# Fetch, decode, execute, store

*Fetch, decode, execute* is the operating cycle of the CPU. We will run through how this works with reference to the [CPU architecture](/Hardware/CPU/CPU_architecture.md). 

## Fetch

### Overview
First, instructions and data are fetched from outside of the CPU chip (usually from the DRAM). In some cases, the data used by an instruction will be included with it. In other instance the instruction will reference the location where the data are held as an address.

### Specifics
* The Program Counter register needs to keep track and sequence the different instructions that the CPU will work on. The first place it will look for an instruction is at the DRAM address `0000`, equivalent to 0 in the Program Counter register: the starting point. This is address therefore copied to the Memory Address Register for future reference.
* This memory-storing event constitutes an instruction so it is copied to the Instruction Register.
* As the first instruction has been fetched, the system reaches the end of the first cycle. Thus the Program counter increments by 1 to log this.
* The next fetch cycle begins.

## Decode
### Overview 
Once the CPU has received the instruction, the CPU controller chip analyses it to determine which of its circuits should be used for processing. 
### Specifics 


* Now that the instruction is fetched and stored in the RAM it needs to be decoded. It is therefore sent from the RAM to the Control Unit of the CPU. There are two parts to the instruction:
  1. The operation code ("op code"): the command that the computer will carry out.
    1. The operand: an address in RAM where the data will be read and written to as part of the execution
* The Control Unit converts the operation code and operand into an instruction that is fed to the next stage in the cycle: execution. For example, for an add function, `add` would be the op code and `address x` and `address y` would be the operands, thus the instruction would be: `add` the value in `address x` to the value in `address y`.

## Execute 

Now the command will be executed. The operand is copied to the Memory Address Register and then passed to the Memory Data Register and the command is carried out by the ALU.
The activities of ALU are covered in [CPU Architecture](/Hardware/CPU/CPU_architecture.md#arithmetic-logic-unit) and the notes on [Logic Gates](/Hardware/Logic_Gates/Logic_gates.md).
## Store
### Overview
As well as telling the CPU what operation to perform, the instructions must specify where to store the result.

### Specifics
* Data is stored differently depending on the instruction.
* If the instruction is iterative (e.g. adding two numbers and then multiplying by another number), the instruction will tell the CPU to store the interim first value in the CPU's [registers](/Hardware/CPU/CPU_architecture.md#registers). As these are part of the CPU, the data can be retrieved more readily. If the value is not expected to be used again immediately, it goes to the DRAM or harddisk. 