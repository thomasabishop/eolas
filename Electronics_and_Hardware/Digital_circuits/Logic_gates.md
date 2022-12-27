---
categories:
  - Computer Architecture
  - Electronics
  - Hardware
tags: [logic-gates, binary]
---

# Logic gates

> [A logic gate consists in] three connections where there may or may not be some electricity. Two of those connections are places where electricity may be put into the device, and the third connection is a place where electricity may come out of the device.

[J.C. Scott. 2009. **But How Do It Know? The Basics of Computers for Everyone**, 21]

Logic gates are the basic building blocks of digital computing. **A logic gate is an electrical circuit that has one or more than one input and only one output.** The input controls the output and the logic determining which types of input (on/off) lead to specific outputs (on/off) is isomorphic with the truth-conditions of the [Boolean connectives](/Logic/Truth-functional_connectives.md) specifiable in terms of [truth tables](/Logic/Truth-tables.md).

Physically, what 'travels through' the gates is electrical current and what constitutes the 'gate' is a [transistor](/Electronics_and_Hardware/Digital_circuits/Transistors.md) responding to the current. Going up a level of abstraction, the current/ charge is identified with a [bit](/Electronics_and_Hardware/Binary/Binary_units_of_measurement.md#binary-units-of-measurement). It is bits that go into the gate and bits which come out: binary information that may be either 1 or 0.

## NOT gate

> The NOT gate inverts the value of whatever input it receives

### Symbol

![](/img/not-gate-new.png)

### Truth conditions

| $P$ | $\lnot P$ |
| --- | --------- |
| 1   | 0         |
| 0   | 1         |

### Interactive circuit

<iframe src="https://circuitverse.org/simulator/embed/not-gate-aeb5f9e5-9f58-4883-b8e5-d70f6d023185?theme=default&display_title=false&clock_time=true&fullscreen=true&zoom_in_out=true" style="border-width:; border-style: solid; border-color:;" name="myiframe" id="projectPreview" scrolling="no" frameborder="1" marginheight="0px" marginwidth="0px" height="250" width="500" allowFullScreen></iframe>

## AND gate

> The AND gate represents the truth conditions of the [conjunction](/Logic/Truth-functional_connectives.md#conjunction) truth functional connective

### Symbol

![](/img/and-gate-new-2.png)

### Truth conditions

| $P$ | $Q$ | $P \land Q$ |
| --- | --- | ----------- |
| 1   | 1   | 1           |
| 1   | 0   | 0           |
| 0   | 0   | 0           |
| 0   | 0   | 0           |

### Interactive circuit

<iframe src="https://circuitverse.org/simulator/embed/and-gate-b6937338-e83f-474b-af79-854b39c151a3?theme=default&display_title=false&clock_time=true&fullscreen=true&zoom_in_out=true" style="border-width:; border-style: solid; border-color:;" name="myiframe" id="projectPreview" scrolling="no" frameborder="1" marginheight="0px" marginwidth="0px" height="250" width="500" allowFullScreen></iframe>

## NAND gate

> The NAND gate inverts the truth conditions of AND.

### Symbol

![](/img/nand-gate-new.png)

### Truth conditions

| $P$ | $Q$ | $\lnot(P \land Q)$ |
| --- | --- | ------------------ |
| 1   | 1   | 0                  |
| 1   | 0   | 0                  |
| 0   | 1   | 0                  |
| 0   | 0   | 1                  |

### Interactive circuit

<iframe src="https://circuitverse.org/simulator/embed/nand-gate-60613ab9-9562-445e-9883-c4ea1920e206?theme=default&display_title=false&clock_time=true&fullscreen=true&zoom_in_out=true" style="border-width:; border-style: solid; border-color:;" name="myiframe" id="projectPreview" scrolling="no" frameborder="1" marginheight="0px" marginwidth="0px" height="250" width="500" allowFullScreen></iframe>

NAND is a **universal logic gate**: equipped with just a NAND we can represent every other possible logical condition. In practice with circuits, it is more efficient to use specific dedicated gates (i.e OR, AND, NOT etc) for the other Boolean connectives but in principle the same output can be achieved through NANDs alone.

## OR gate

> The OR gate represents the truth conditions of the [disjunction](/Logic/Truth-functional_connectives.md#disjunction) truth functional connective

### Symbol

![](/img/or-gate-new.png)

### Truth conditions

| $P$ | $Q$ | $P \lor Q$ |
| --- | --- | ---------- |
| 1   | 1   | 1          |
| 1   | 0   | 1          |
| 0   | 1   | 1          |
| 0   | 0   | 0          |

### Interactive circuit

## XOR gate

> The OR gate represents the truth conditions of the exclusive OR

### Symbol

![](/img/xor-gate-new.png)

### Truth conditions

| $P$ | $Q$ | $\lnot(P \Leftrightarrow Q)$ |
| --- | --- | ---------------------------- |
| 1   | 1   | 0                            |
| 1   | 0   | 1                            |
| 0   | 1   | 1                            |
| 0   | 0   | 0                            |

### Interactive circuit

## NOR gate

> The NOR gate inverts the function of an OR gate

### Symbol

![](/img/nor-gate-new.png)

### Truth conditions

| $P$ | $Q$ | $P \lor Q$ |
| --- | --- | ---------- |
| 1   | 1   | 0          |
| 1   | 0   | 0          |
| 0   | 1   | 0          |
| 0   | 0   | 1          |

### Interactive circuit
