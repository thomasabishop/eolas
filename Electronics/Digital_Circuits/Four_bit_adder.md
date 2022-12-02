---
categories:
  - Hardware
  - Electronics
tags: [logic-gates, binary]
---

# Four-bit adder

A single [half adder](/Electronics/Digital_Circuits/Half_adder_and_full_adder.md#half-adder) and [full adder](/Electronics/Digital_Circuits/Half_adder_and_full_adder.md#full-adder) allows us to calculate the sum of two 1-bit numbers, but this is not much use in practice. To approximate what is really happening at the circuit level in computers we need to be able to add bigger binary numbers. We will demonstrate how this can be achieved for a four-bit number (nibble) using repeated full adders and half adders.

We want to be able to calculate the following sum:
