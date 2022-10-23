---
title: Voltage
categories:
  - Electronics
tags: [physics, electricity]
---

# Voltage

## Difference of potential and the tranfer of energy

We noted in the discussion of [current](/Electronics/Physics_of_electricity/Current.md) that current flows when there is a difference of potential between two points with negatively charged atoms at one point and positively charged atoms at the other.

_Difference of potential_ is the same thing as voltage. Voltage is essential to current because it is the force that enables the current to flow.

Without voltage there can be no current because in their natural state, the electrons in an atom are in random motion with no direction. To produce a current, energy must be imparted to the electrons so that they all flow in the same direction.

Voltage is the application of this energy. Any [form of energy](/Electronics/Physics_of_electricity/Voltage_sources.md) that dislodges electrons from atoms can be used to produce current. Thus:

> Voltage is the work required per coulomb to move a charge from one point to another.

### Voltage exists even without current

Given that voltage is the force that generates current, it would be natural to think that voltage only exists when a voltage source (such as a [battery](/Electronics/Cells_and_batteries.m`)) is connected to a circuit. This however is not the case. Even if a 9V battery isn't connected to anything it still has a difference of potential of 9-volts accross its terminals. Remember voltage is _potential energy_ not just the actualisation of that energy.

## Voltage rise and voltage drops

In circuits there are actually two types of voltage:

1. Voltage rise
2. Voltage drop

### Voltage rise

When we introduce potential energy into a ciruit in the form of voltage, this is a voltage rise. The current flows from the negative terminal of the voltage source and returns to the positive terminal of the voltage source.

A 12V battery connected to a circuit gives it a voltage rise of 12 volts.

### Voltage drop

Voltage drop is the corrolary to voltage rise. It is the loss of energy that the electrons of the circuit current experience as a result of encountering resistance.

As they move through the circuit the electrons encounter a **load** which is what we call resistance to the flow of electrons. As they run into this, they give up their energy. The relinquishing of energy happens in the form of a conversion of electrical energy to heat. The amount lost is equal to the amount of energy imparted by the voltage rise.

> The voltage drop in a circuit equals the the voltage rise of the circuit because energy cannot be created or destroyed, only changed to another form. When a voltage rise is converted to a voltage drop we say that **the energy has been _consumed_ by the circuit**.

#### Examples

- If a 12V source is connected to a 12V lamp, the source supplies a 12V voltage rise and the lamp produces a 12V voltage drop.
- If two identical 6V lamps are connected in series to the same 12V source, each lamp produces a 6V drop for a total of 12 volts
- If two different lamps are connected in series to to a 12V source: a 3V and a 9V lamp, the 9V lamp produces a drop of 9V and the 3V lamp produces a drop of 3V. The sum of the voltage drops equals the voltage rise of 12 volts.

These examples demonstrate that the voltage rise: voltage drop ratio always evens out.

## Ground: zero potential

We use the term **ground** to refer to zero potential - the point at which there is no difference of potential (voltage) that could generate current.

We need ground to prevent electric shock from appliances and circuits. It keeps all devices at the same potential.

In domestic settings appliances are **earth grounded**. The name comes from the fact that all appliances will ultimately connect to the earth to neutralise potential. This means there can be no difference of potential between circuits.

In electronics ground doesn't refer to the specific appliance but is a concept of a zero reference point against which all voltages are measured. A measured voltage will be negative or positive with respect to ground. This said, all circuitry will also have a physical mechanism of discharging potential.

// TODO: Don't really understand this so return to with better explanation

## Distinguishing _voltage_ from _electric field_

It can be confusing that two different symbols often seemed to be used interchangeably when talking about voltage: $V$ and $E$. However, while they broadly point to the same phenomenon there is a difference in emphasis.

- $V$ stands for volts or voltage conceived purely in terms of the difference in potential between two points: the positive and negative terminals
- $E$ stands for electric field. This is the field that surround each electric charge and exerts force on all other charges in the field, attracting or repelling them. So it is more the physical process that the volatage represents rather than the numerical representation of the potential between the terminals.
