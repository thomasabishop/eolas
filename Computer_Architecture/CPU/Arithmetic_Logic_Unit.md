---
categories:
  - Computer Architecture
tags: [CPU]
---

# Arithmetic Logic Unit (ALU)

The ALU is the centerpiece or core of the
[CPU](/Computer_Architecture/CPU/CPU_architecture.md) architecture, where the
binary calculations occur. All the other components on the CPU chip are
appendanges to the execution that occurs within the ALU.

The ALU comprises
[logic gates](/Electronics_and_Hardware/Digital_circuits/Logic_gates.md) that
execute the instructions passed from memory and where the data stored by the
registers is acted upon. A processor's ALU is just a complex combinatorial logic
circuit.

It executes arithmetic and logical operations on binary numbers and where you
will find operations conducted by
[full-adders and half adders](/Electronics_and_Hardware/Digital_circuits/Half_adder_and_full_adder.md)
etc.

More specifically, the ALU is responsible for the _execute_ phase of the
[fetch, decode, execute cycle](/Computer_Architecture/CPU/Fetch_decode_execute.md).

## ALU execution lifecycle

1. **Inputs**: The ALU receives two operands and a control signal as inputs. The
   operands are the data on which the operations will be performed. The control
   signal tells the ALU which operation it needs to perform.
2. **Perform operation**: The ALU carries out the requested operation. For
   instance, if the control signal indicates an addition operation, the ALU sums
   the two operands.
3. **Output**: The ALU then sends the operation to another part of the CPU for
   further processing or storage. The ALU also outputs a status bit that can be
   used by other parts of the CPU to make decisions. For instance if the additon
   results in a value that is too large to be stored, the ALU will set an
   overflow flag.
