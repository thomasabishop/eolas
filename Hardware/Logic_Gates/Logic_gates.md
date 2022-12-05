---
categories:
  - Computer Architecture
  - Electronics
  - Hardware
tags: [logic-gates, binary]
---

# Logic gates

> [A logic gate consists in] three connections where there may or may not be some electricity. Two of those connections are places where electricity may be put into the device, and the third connection is a place where electricity may come out of the device. (Scott, 2009 p.21)

Logic gates are the basic building blocks of digital computing. **A logic gate is an electrical circuit that has one or more than one input and only one output.** The input controls the output and the logic determining which types of input (on/off) lead to specific outputs (on/off) is identical to the truth-conditions of the [Boolean connectives](/Logic/Truth-functional_connectives.md) specifiable in terms of [truth-tables](/Logic/Truth-tables.md).
Physically, what 'travels through' the gates is electrical current and what constitutes the 'gate' is a [transistor](/Electronics/Digital_Circuits/Transistors.md) responding to the current. At the next level of abstraction it is bits that go into the gate and bits which come out: binary information that may be either 1 or 0.

## AND gate

> The AND gate represents the truth conditions of the [conjunction](/Logic/Truth-functional_connectives.md#conjunction) truth functional connective

### Symbol

### Truth conditions

| P   | Q   | P & Q |
| --- | --- | ----- |
| T   | T   | T     |
| T   | F   | F     |
| F   | T   | F     |
| F   | F   | F     |

### Interactive circuit

## NAND gate

> The NAND gate inverts the truth conditions of AND.

### Symbol

### Truth conditions

| P   | Q   | ~(P & Q) |
| --- | --- | -------- |
| T   | T   | F        |
| T   | F   | F        |
| F   | T   | F        |
| F   | F   | T        |

NAND is a **universal logic gate**: equipped with just a NAND we can represent every other possible logical condition. In practice with circuits, it is more efficient to use specific dedicated gates (i.e OR, AND, NOT etc) for the other Boolean connectives but in principle the same output can be achieved through NANDs alone.

## OR gate

> The OR gate represents the truth conditions of the [disjunction](/Logic/Truth-functional_connectives.md#disjunction) truth functional connective

### Symbol

### Truth conditions

| P   | Q   | P v Q |
| --- | --- | ----- |
| T   | T   | T     |
| T   | F   | T     |
| F   | T   | T     |
| F   | F   | F     |

## XOR gate

> The OR gate represents the truth conditions of the exclusive OR

### Symbol

### Truth conditions

| P   | Q   | ~(P <> Q) |
| --- | --- | --------- |
| T   | T   | F         |
| T   | F   | T         |
| F   | T   | T         |
| F   | F   | F         |

### Interactive circuit

## References

Scott, J. Clark. 2009. _But how do it know?: the basic principles of computers for everyone_. Self-published.
