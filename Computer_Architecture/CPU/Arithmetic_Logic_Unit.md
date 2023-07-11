---
categories:
  - Computer Architecture
tags: [CPU]
---

# Arithmetic Logic Unit (ALU)

The ALU is the centerpiece or core of the [CPU](/Computer_Architecture/CPU/CPU_architecture.md) architecture, where the binary calculations occur. All the other components on the CPU chip are appendanges to the execution that occurs within the ALU.

The ALU comprises [logic gates](/Electronics_and_Hardware/Digital_circuits/Logic_gates.md) that execute the instructions passed from memory and where the data stored by the registers is acted upon.

It executes arithmetic and logical operations on binary numbers and thus it is where you will find operations conducted by [full-adders and half adders](/Electronics_and_Hardware/Digital_circuits/Half_adder_and_full_adder.md) etc.

More specifically, the ALU is responsible for the _execute_ phase of the [fetch, decode, execute cycle](/Computer_Architecture/CPU/Fetch_decode_execute.md).

// Notes on

### Processor cores

The vast majority of general purpose computers are multi-core. This means that the CPU contains more than one processing unit. They are best thought of as mini-CPUs within the main CPU since they each have the same overall Von Neumann architecture.

With Intel processors the two main consumer processors are the i5 and i7. The latter has more cores than the former. Consequently it has faster clock speeds and greater concurrency due to increased threads.
