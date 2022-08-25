---
categories:
  - Electronics
tags: [physics, electricity]
---

# Cells and batteries

Cells are a [voltage source](/Electronics/Physics_of_electricity/Voltage.md#chemicals-cells-and-batteries) that generate a difference of potential via a positive and negative electrode separated by an electrolytic solution. The electrolytes pull free electrons from one of the materials which creates a positive charge. The other material gains the free electrons creating a negative charge.

> A battery is a combination of two or more cells.

> Cells which cannot be recharged are called **primary cells**. Cells which can be recharged are called **secondary cells**.

## Connecting batteries

Cells and batteries can be connected to each other in electrical ciruits to increase the overall voltage that is produced. There are three main connection types:

- series
- parallel
- series-parallel

### Series connections

With series connections we distinguish **series aiding** and **series opposing** configurations.

In the case of series aiding, cells are connected one in front of another with the positive terminal connecting to the negative terminal of the other in a line.

In this configuration the **same current flows through all the cells**. This is represented mathematically as follows ($T$ stands for time):

$$
I_{T} = I_{1} + I_{2} + I_{3} \\
$$

The voltage is the sum of the individual cell voltages (represented here as [electrical field](/Electronics/Physics_of_electricity/Voltage.md#distinguishing-voltage-from-electric-field)).

$$
E_{T} = E_{1} + E_{2} + E_{3} \\
$$

> Note here we use $E$ instead of $V$. Strictly, $V$ denotes the potential difference whereas $E$ denotes the **electric field**. The electric field is the physical field that surrounds each electric charge and exerts force on all other charges in the field, attracting or repelling them

// TODO: Add image
