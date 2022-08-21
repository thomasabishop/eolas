---
categories:
  - Computer Architecture
tags: [CPU]
---

# CPU architecture

The CPU comprises three core components:

* Registers (a form of memory that are positioned on the same chip as the CPU )
* the Arithmetic Logic Unit (ALU)
* the Control Unit (CU)

 > This method of putting together a computer is known as the **Von Neumann Architecture**. It was devised by John von Neumann in about 1945, well before any of the components that would be needed to produce it had actually been invented.
 
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


Below is a schematic of a series of logical circuits within the CPU core: 

![74181aluschematic.png](/img/74181aluschematic.png)

### Processor cores

The vast majority of general purpose computers are multi-core. This means that the CPU contains more than one processing unit. They are best thought of as mini-CPUs within the main CPU since they each have the same overall Von Neumann architecture.

With Intel processors the two main consumer processors are the i5 and i7. The latter has more cores than the former. Consequently it has faster clock speeds and greater concurrency due to increased threads. 
## Control Unit

The CPU's [controller](/Hardware/Chipset_and_controllers.md). It takes the instructions in binary form from RAM memory (separate from the CPU, but connected) and then signals to the to ALU and memory registers what it is supposed to do to execute the instructions. Think of it as the overseer that gets the ALU and registers to work together to run program instructions.

## Fetch, decode, execute


## The system clock 

Whilst modern CPUs and threading make it appears as though the CPU is capable of running multiple processes at once, access to the CPU is in fact sequential. The illusion of simultaneous computation is due to the fact the processor is so fast that we do not detect the sequential changes. For this to happen, the CPU needs to have a means of scheduling and sequencing processes. This is made possible through the system clock, hence when talking about the speed of the CPU we do so with reference to *clock speeds* and the _clock cycle_. 

The clock's circuitry is based on a quartz crystal system like that used in watches. At precisely timed intervals, the clock sends out pulses of electricity that cause bits to move from place to place within [logic gates](/Hardware/Logic_Gates/Logic_gates.md) or between logic gates and [registers](/Hardware/CPU/Architecture.md#registers). 

Simple instructions such as add can often be executed in just one clock cycle, whilst complex operations such as divide will require a number of smaller steps, each using one cycle.

We measure the speed of a chip process within the CPU in **Hertz (Hz)**. One Hertz is equivalent to _1 cycle per second_ where a "cycle" is equivalent to a single clock **tick**. Thus a tick covers a period of 1 second. 

A speed of 2GHz for example means two billion cycles per second. This would mean that the clock was completing two billion cycles at each tick. 

## Electromagnetism: broader scientific context 

Hertz was the scientist who detected electromagentic waves and more broadly in science, we use Hertz to measure the number of electromatic waves (cycles) in a signal. 

![](/img/hertz_wave_freq.gif)

As the diagram above shows, a cycle is equal to one ascending and one descending crest. The more cycles the greater the Hertz.