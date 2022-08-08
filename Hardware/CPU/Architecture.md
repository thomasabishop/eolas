---
tags:
  - Hardware
  - cpu
  - von_neumann
---

# CPU architecture


At the core of a computer sits the Central Processing Unit. This is the assembly of chips that execute all computation. Instructions are passed to the CPU along the data bus part of the system bus from the memory. The [kernel](/Operating_Systems/The_Kernel.md), also residing in memory sequences and schedules the sending of data to the CPU and manages requests from the CPU for data in memory.

The CPU comprises three core components:

* Registers (a form of memory that are positioned on the same chip as the CPU )
* the Arithmetic Logic Unit (ALU)
* the Control Unit (CU)

 > This method of putting together a computer is known as the **Von Neumann Architecture**. It was devised by John von Neumann in about 1945, well before any of the components that would be needed to produce it had actually been invented.
 
ontrollers.md). It takes the instructions in binary form from RAM memory (s
## Registers

This is the part of the CPU that stores data. The memory cells that comprise it do not have capacitors (unlike RAM) so they cannot store very much data but they work faster, which is what is important.

In terms of speed, registers sit at the top part of the overall memory hierarchy...


There are five main types of register in the CPU:

| Register type           | What it stores                                              |
|-------------------------|-------------------------------------------------------------|
| Accumulator             | The results of calculations                                 |
| Instruction Register    | The DRAM address of the **instruction** to be processed     |
| Memory Address Register | The DRAM address of the **data** to be processed            |
| Memory Data Register    | The store of the data that is currently being processed     |
| Program Counter         | The RAM address of the **next instruction** to be processed |
## Arithmetic Logic Unit

This is the hub of the CPU, where the binary calculations occur. It comprises [logic gates](/Hardware/Logic_Gates/Logic_gates.md) that execute the instructions passed from memory. This is where the data stored by the registers is acted upon..

It can execute arithmetic on binary numbers and logical operations.

This is the heart of the CPU; all the other components on the CPU chip are appendanges to the execution that occures within the ALU. It is also what is meant by the  **core** processor that is referred to in hardware specs of computers, for instance *dual-core*, *quad core* etc.

// TODO: More info on cores etc


Below is a schematic of a series of logical circuits within the CPU core: 

![74181aluschematic.png](/img/74181aluschematic.png)


### Processor cores

The vast majority of general purpose computers are multi-core. This means that the CPU contains more than one processing unit. They are best thought of as mini-CPUs within the main CPU since they each have the same overall Von Neumann architecture.

With Intel processors the two main consumer processors are the i5 and i7. The latter has more cores than the former. Consequently it has faster clock speeds and greater concurrency due to increased threads. 
## Control Unit

The CPU's [controller](/Hardware/Chipset_and_controllers.md). It takes the instructions in binary form from RAM memory (separate from the CPU, but connected) and then signals to the to ALU and memory registers what it is supposed to do to execute the instructions. Think of it as the overseer that gets the ALU and registers to work together to run program instructions.

## Fetch, decode, execute

*Fetch, decode, execute* is the operating cycle of the CPU. We will run through how this works with reference to the CPU architecture. 

### Fetch

1. The Program Counter register needs to keep track and sequence the different instructions that the CPU will work on. The first place it will look for an instruction is at the DRAM address `0000`, equivalent to 0 in the Program Counter register: the starting point. This is address therefore copied to the Memory Address Register for future reference.
2. This memory-storing event constitutes an instruction so it is copied to the Instruction Register.
3. As the first instruction has been fetched, the system reaches the end of the first cycle. Thus the Program counter increments by 1 to log this.
4. The next fetch cycle begins.



### Decode

1. Now that the instruction is fetched and stored in the RAM it needs to be decoded. It is therefore sent from the RAM to the Control Unit of the CPU. There are two parts to the instruction:
    1. The operation code ("op code"): the command that the computer will carry out.
    2. The operand: an address in RAM where the data will be read and written to as part of the execution
2. The Control Unit converts the operation code and operand into an instruction that is fed to the next stage in the cycle: execution 

### Execute 

Now the command will be executed. The operand is copied to the Memory Address Register and then passed to the Memory Data Register and the command is carried out by the ALU.

## The Clock 

// TODO: Explain the above cycle in relation to the system clock. Explain Hertz and cycles per second drawing on notes on buses and kernel actions. 
