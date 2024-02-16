---
categories:
  - Electronics
tags: [physics, electricity]
---

# Current

> Electrical current is the movement of electrons from negatively charged atoms
> to negatively charged atoms when an appropriate external force is applied.

So current is the flow of electrons. Charge is the quantity that flows.

> The amount of current is the sum of the charges of the moving electrons past a
> given point.

## Why current exists

Current exists because of the
[first law of electrostatics](/Electronics_and_Hardware/Physics_of_electricity/Coulombs_Laws.md).

When there is an excess of electrons at one terminal (i.e. negatively charged
atoms) and a deficiency of electrons at the other terminal (i.e. positively
charged atoms), a
[_difference of potential_](/Electronics_and_Hardware/Analogue_circuits/Voltage.md)
exists between the two terminals.

When the terminals are connected to each other via a conductor (e.g. copper
wire) electrons will flow along the conductor. This is provided that there is a
source to supply electrons at one end and remove them at the other. We call this
force the **voltage source**.

_The diagram below illustrates the flow of current where the circles are
electrons knocking into each other and passing current:_

![](/img/charge-cylinder.svg)

> Electrons travel very slowly through a conductor. This is in contrast to their
> intrinsic motion which of course equal to the speed of light (186, 000 miles
> per second).

## Formal expression

We measure **charge** in Coulombs ($C$). A Coulomb is an aggregate of the charge
of thousands of electrons because their individual charge is so small. One
Coulomb is equal to the charge of $6.24 \cdot 10 ^{18}$ electrons.

We measure **current** in amps. When one coulomb of charge moves past a point in
one second it is called an **ampere** (amp) represented as $A$.

This relationship is captured in the following equation:

$$
I = \frac{Q}{t}
$$

- $I$ = current measured in amps
- $Q$ = quantity of electrical charge measured in coulombs
- $t$ = time

### Application

_Calculate the current in amps if 9 coulombs of charge flow past a point in an
electric circuit in 3 seconds._

$$
I = \frac{9}{3} \\
I = 3  A
$$

## Direction of current

In terms of the physics, current flows due to the movement of charged particles
from atoms which are negatively charged to atoms which are positively charged.
However when it comes to the representation of current in electrical circuits
the convention is to view current as flowing from the positive to the negative
terminal.

This is obviously physically inaccurate however it became the convention before
electrons were properly understood when charge was thought to be a property of
protons. So we are stuck with this convention in electronics.
