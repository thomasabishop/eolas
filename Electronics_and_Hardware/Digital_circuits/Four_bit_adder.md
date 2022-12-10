---
categories:
  - Hardware
  - Electronics
tags: [logic-gates, binary]
---

# Four-bit adder

A single [half adder](/Electronics/Digital_Circuits/Half_adder_and_full_adder.md#half-adder) and [full adder](/Electronics/Digital_Circuits/Half_adder_and_full_adder.md#fufll-adder) allows us to calculate the sum of two 1-bit numbers, but this is not much use in practice. To approximate what is really happening at the circuit level in computers we need to be able to add bigger binary numbers. We will demonstrate how this can be achieved for a four-bit number (nibble) using repeated full adders and half adders.

We want to be able to calculate the following sum:

```
0010
0011
____
0101
```

We will achieve this by using three full adders and one half adder, moving from right to left. The half adder will be used at the beginning to calculate the least significant bit as it will have no carry-in. The subsequent three bits will all be added using a full adder.

Let's walk through the process:

![](/img/four-bit-adder.png)

1. HA receives the bits $0$ and $1$ as inputs. It outputs $1$ as the sum bit and $0$ as the carry-out.
2. FA1 receives $0$ as the carry-in bit plus $1$ and $1$ as its input. This means it has the following calculation to execute: $1 + 1 + 0$. This gives $0$ as the sum bit and $1$ as the carry-out bit.
3. FA2 receives $1$ as the carry-in (the carry-out from FA1) plus $0$ and $0$ as its own inputs. $0 + 0 + 1$ gives us $1$ as the sum bit and $0$ as the carry-out.
4. Finally FA3 receives $0$ as its carry-in plus $0$ and $0$ as its inputs. $0 + 0 + 0 = 0$, therefore its sum bit is $0$ and the overall sum of the four bits is $0101$. There is no carry out as there are no more bits to add.

## Ripple carry adder

We notice that as the calculation proceeds, the carry bits propagate or _ripple_ through the circuit. For this reason, a four-bit adder constructed in the manner of this circuit is called a **ripple carry adder**.

There are two important consequences to note about this type of circuit:

- Each carry bit that ripples to the next full adder introduces a small delay. Therefore extending the circuit to handle more bits will make the circuit slower overall.
- Because the value of the bits changes through the course of the ripple, the output of the circuit will be innacurate until all the carry bits have had time to propagate.
