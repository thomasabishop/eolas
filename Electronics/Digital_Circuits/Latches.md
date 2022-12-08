---
categories:
  - Computer Architecture
  - Electronics
  - Hardware
tags: [logic-gates, binary, memory]
---

# Latches

The combinatorial digital circuits we have looked at so far have been non-sequential. The outcome is a function of its immediate set of inputs and everything happens at once: there is no means of storing state for future use. In other words there is no _[memory](/Hardware/Memory/Memory.md)_.

In contrast, a sequential digital circuit's output depends not only on its present set of inputs but also on past inputs to the circuit. It has some knowledge of its own previous state through the existence of memory - a component that allows for the **storage and retrieval of binary data**.

## What is a latch

A latch is a circuit component that works as a very basic memory device. It is capable of setting and resetting a single bit. We can remember what it does by thinking of a door latch: once you turn the key the lock is set, when you turn it back it is unset.

The **SR Latch** (for "set/reset") has two inputs: S (for set) and R (for reset) and one output, Q. Q stands for the bit that is remembered. There is also not-Q which is the opposite of whatever Q is currently set to.

> When S is set to 1, output Q becomes 1 also. When S goes to 0, Q remains 1. When R is set to 1, this clears the memory bit and Q becomes 0. Q remains at 0 even if R goes back to 0.

This is represented more clearly in the table below:

| S   | R   | Q                       | Operation     |
| --- | --- | ----------------------- | ------------- |
| 0   | 0   | Maintain previous value | Hold          |
| 0   | 1   | 0                       | Reset         |
| 1   | 0   | 1                       | Set           |
| 1   | 1   | X                       | Invalid, null |

// TODO add diagram of latch here

## Creating a latch circuit

There is more than one way of implementing a latch with logic gates. We will look at two formulations which both use a single type of gate: [NANDs](/Hardware/Logic_Gates/Logic_gates.md#nand-gate) and [NORs](/Hardware/Logic_Gates/Logic_gates.md#nor-gate) (both universal logic gates).

In each case, the gates are in a **cross-coupled configuration**. This basically means that the wires are crossed back on themselves such that the output of one is also an input of the other at a single stage in the sequence.
