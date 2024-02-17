---
tags: [physics, electricity]
---

# Cells and batteries

Cells are a
[voltage source](Voltage.md) that
generate a difference of potential via a positive and negative electrode
separated by an electrolytic solution. The electrolytes pull free electrons from
one of the materials which creates a positive charge. The other material gains
the free electrons creating a negative charge.

> A battery is a combination of two or more cells.

> Cells which cannot be recharged are called **primary cells**. Cells which can
> be recharged are called **secondary cells**.

## Connecting batteries

Cells and batteries can be connected to each other in electrical ciruits to
increase the overall voltage and current that is produced. There are three main
connection types:

- series
- parallel
- series-parallel

> The key thing to remember: **cells configured in series increases the overall
> voltage available** and **cells configured in parallel increases the overall
> current available**

The table below summarises the relative differences:

![](/img/cell-comparison.svg)

### Series connections

With series connections we distinguish **series aiding** and **series opposing**
configurations.

In the case of **series aiding**, cells are connected one in front of another
with the positive terminal connecting to the negative terminal of the other in a
line.

In this configuration the same current flows through all the cells; it is not
cumulative. We represent this as follow> However the voltage is cumulative: it
is the _sum_ of the individual cell voltages, represented below as
[electrical field](Voltage.md#distinguishing-voltage-from-electric-field):

$$
E_{T} = E_{1} + E_{2} + E_{3} \\
$$

Thus series connections increase voltage but keep current constant.

_Series battery connection:_

![](/img/series-battery-diagram.svg)

_Can be represented in a circuit diagram in one of the following two ways: as a
series of cells or as a single battery:_

![](/img/series-battcircuit.svg)

In the case of **series opposing**, negative terminals are connected to each
other and positive terminals are connected to each other in a series. This
doesn't have many applications.

### Parallel connections

In parallel connections all positive terminals are connected to each other and
all negative terminals are connected to each other.

This time the voltage is the same as each individual cell but the current is the
sum of the individual cell currents. So the voltage is constant but the current
is cumulative:

$$
E_{T} = E_{1} = E_{2} = E_{3} \\
$$

$$
I_{T} = I_{1} + I_{2} + I_{3}
$$

_Parallel battery connection:_

![](/img/parallel-battery-diagram.svg)

_Parallel battery circuit diagram:_

![](/img/circ-batt-final.svg)

### Series-parrallel

If we want both a higher voltage and a higher current we can use series-parallel
configurations. Connecting cells in series increases the voltage and connecting
cells in parellel increases the current so doint both boosts the amount of both
quantities.
