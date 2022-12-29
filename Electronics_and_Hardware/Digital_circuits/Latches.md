---
categories:
  - Computer Architecture
  - Electronics
  - Hardware
tags: [logic-gates, binary, memory]
---

# Latches

The **combinatorial digital circuits** we have looked at so far have been non-sequential. The outcome is a function of its immediate set of inputs and everything happens at once: there is no means of storing state for future use. In other words there is no _[memory](/Computer_Architecture/Memory/Memory.md)_.

In contrast, the output of a **sequential digital circuit** depends not only on its present set of inputs but also on past inputs to the circuit. It has some knowledge of its own previous state through the existence of memory. This can be implemented via components that allow for the **storage and retrieval of binary data**.

## What is a latch?

A latch is a circuit component that works as a very basic memory device. It is capable of setting and resetting a single bit. We can remember what it does by thinking of a door latch: once you turn the key the lock is set, when you turn it back it is unset.

The **SR Latch** (for "set/reset") has two inputs: _S_ (for "set") and _R_ (for "reset") and one output, _Q_. _Q_ stands for the bit that is remembered. (There is also _not-Q_ which is the opposite of whatever _Q_ is currently set to.)

The SR Latch goes through the following state changes:

- When _S_ is set to 1, output _Q_ becomes 1 also
- When _S_ goes to 0, _Q_ remains 1
- When _R_ is set to 1, the memory bit is cleared and _Q_ becomes 0.
- _Q_ remains at 0 even if _R_ goes back to 0

This is represented more clearly in the table below:

| S   | R   | Q                       | Operation     |
| --- | --- | ----------------------- | ------------- |
| 0   | 0   | Maintain previous value | Hold          |
| 0   | 1   | 0                       | Reset         |
| 1   | 0   | 1                       | Set           |
| 1   | 1   | X                       | Invalid, null |

The most succinct account of a latch:

> A latch is a 1-bit memory device that has a state _Q_ of either 1 or 0. The _S_ input sets _Q_ to 1 and the _R_ input resets _Q_ to 0.

_The representation of an SR Latch in a digital circuit diagram_:

![](/_img/sr_latch_diagram.png)

## Creating a latch circuit

The circuit diagram latch symbol obviously encapsulates more complex functionality that occurs at the sub-circuit level. We will demonstrate how this functionality can be achieved with two [NOR](/Electronics_and_Hardware/Digital_circuits/Logic_gates.md#nor-gate) gates.

The two gates are in a **cross-coupled configuration**. This basically means that the wires are crossed back on themselves such that the output of one is also an input of the other at a single stage in the sequence.

The circuit is created as follows:

![](/_img/sr_latch_logic_circuit.png)

Interactive version:

<iframe src="https://circuitverse.org/simulator/embed/nor-latch-0869192c-7d7b-4161-b13f-3f72c1bce8e9" style="border-width:; border-style: solid; border-color:;" name="myiframe" id="projectPreview" scrolling="no" frameborder="1" marginheight="0px" marginwidth="0px" height="400" width="600" allowFullScreen></iframe>

<br />
Let's talk through the logic at each state change:

- When _S_ is set to 1, output _Q_ becomes 1 also
  - N1 is receiving 1 from S and 0 from R by way of N2. This is the inversion of OR so TF equals F. Thus N1 is outputting 0.
  - Thus N2 is receiving 0 from N1 as its top input and 0 from R as its bottom input. It is therefore outputting 1 because with NOR, FF equals T. For this reason, _Q_ is 1 because is directly connected to _R_.
- When _S_ goes to 0, _Q_ remains 1
  - N2 is receiving 0 from N1 as the top input and 0 from R as the bottom input hence the overall input is FF which means N2 is outputting T and Q remains 1
  - N1 is outputting 0 because it is receiving 0 as its top input and 1 from its bottom input
- When _R_ is set to 1, the memory bit is cleared and _Q_ becomes 0.
  - N2 is receiving 1 from R as its bottom input and 1 from the output of N1 as its top input. Therefore it is outputting TT which in NOR evaluates to F hence Q is 0
  - N1 is outputting 1 because it is receiving 0 from S as its top input and 0 from its bottom input coming from N2. FF equals T in NOR therefore 1 is outputting 1
- _Q_ remains at 0 even if _R_ goes back to 0
  - N2 is receiving 0 as its bottom input from R and 1 as its top input from N1. TF equals F in NOR hence the output of N2 is 0 and Q remains 0
  - N1 is outputting 1 because it is receiving 0 as its top input from S and 0 as its bottom input from N2. FF equals T in NOR hence N1 is 1
