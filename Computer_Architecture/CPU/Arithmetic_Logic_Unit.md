---
categories:
  - Computer Architecture
tags: [CPU]
---

# Arithmetic Logic Unit (ALU)

The ALU is the centerpiece or core of the [CPU](/Computer_Architecture/CPU/CPU_architecture.md) architecture, where the binary calculations occur. It comprises [logic gates](/Electronics_and_Hardware/Digital_circuits/Logic_gates.md) that execute the instructions passed from memory and where the data stored by the registers is acted upon.

It can execute arithmetic and logical operations on binary numbers. This is where you will find operations conducted by [full-adders and half adders](/Electronics_and_Hardware/Digital_circuits/Half_adder_and_full_adder.md) etc.

This is the heart of the CPU; all the other components on the CPU chip are appendanges to the execution that occures within the ALU. It is also what is meant by the **core** processor that is referred to in hardware specs of computers, for instance _dual-core_, _quad core_ etc.

Below is a schematic of a series of logical circuits within the CPU core:

![74181aluschematic.png](/_img/74181aluschematic.png)

### Processor cores

The vast majority of general purpose computers are multi-core. This means that the CPU contains more than one processing unit. They are best thought of as mini-CPUs within the main CPU since they each have the same overall Von Neumann architecture.

With Intel processors the two main consumer processors are the i5 and i7. The latter has more cores than the former. Consequently it has faster clock speeds and greater concurrency due to increased threads.
