---
title: Transistors
categories:
  - Electronics
  - Hardware
tags: [logic-gates, binary]
---

# Transistors

In the discussion of [digital circuits](/Electronics_and_Hardware/Digital_circuits/Digital_circuits.md) we noted that a digital circuit requires that electrical phenomena be treated as discrete rather than continuous values. Although a given voltage at a point in the circuit can vary widely, in order to represent the binary states of 'on' and 'off' we need it to remain fixed within certain narrow parameters. Typi>understanding the concept and then with transistors which are what are actually used in computers.

## Implementing binary logic with mechanical switches

An electrical switch is inherently binary. When the switch is on, it acts like a simple copper wire through which current flows freely. When the switch is off, it acts like an open circuit and no current can flow.

We can combine switches in a circuit to create analogs to logic gates.

![](/img/switch-and-gate.png)

In the example above a simple AND gate is implemented with switches. Each switch is a conjunct and the current only flows if both switches are on, closing the circuit.

![](/img/switch-or-gate.png)

In the example above is a circuit implementing an OR gate. The current flows just if one of the switches are on or if both of the switches are on but not if both switches are off.

## Transistors

In real digital circuits, mechanical switches would be totally impractical. The number of switches required is too numerous and we need to be able to connect and interconnect the output of many circuits together. The output of one circuit needs to be fed into another and there is no way to do this with switches.

Thus instead of switches, modern digital circuits use transistors, a special electrical component that controls the flow of current in the manner of a switch where the 'off' and 'on' states are represented by [voltage](/Electronics_and_Hardware/Analogue_circuits/Voltage.md) values within set parameters.

There are different types of transistors but the simplest for the purposes of explanation are **bipolar junction transistors**.

![](/img/transistor-diag.svg)

A transistor works as follows: applying a small amount of current at the base allows a larger current to flow from the collector to the emitter. Relating this back to switches, applying current to the base is like turning the switch on. Removing this current is like turning the switch off.

The diagrams below show a transistor being used in a circuit to create 'on' and 'off' switch states alongside a switch based circuit.

![](/img/transistor-off.png)

![](/img/transistor-on.png)

- $V^{in}$ is the voltage that electrically controls the switch-as-transistor
- $V^{out}$ is the voltage we want to control: it will be high when the transistor is in the 'on' state and low otherwise
- $V^{cc}$ stands for "common collector" and is the positive supply voltage appliced to the collector terminal
  is "on".

When the voltate at the base is low (in the diagram it is grounded to ensure this) no current flows from the c
We recall that voltage is the potential difference between two points or terminals in a circuit. High voltage increases the flow of current, low voltage restricts or reduces it.

When the voltage at the base is high a current flows from the collector to the emitter and the transistor is "on".

When the voltate at the base is low (in the diagram it is grounded to ensure this) no current flows from the collector to the emitter and the transistor is "off".

## Transistors and logic gates

With the basic element of the transistor established, we can combine transistors to create logic gates. A logic gate is a combination/sequence of transistors where the logical function is represented by the characteristic input and output voltages.

For example to create an [AND](/Electronics_and_Hardware/Logic_gates/Logic_gates.md#and-gate) gate we would have two voltage inputs going into two transistors that are connected in sequence. The two transistors create a continuous line going from the collector of one to the emitter of the other. If either voltage input is low then the voltage of the combined line is low (equivalent to the circuit being broken) and there is no current flowing.

![](/img/and-transistor.png)

Below, an [OR](/Electronics_and_Hardware/Logic_gates/Logic_gates.md#or-gate) has been constructed with transistors. If a voltage is applied to the base of either transistor, the current reaches the V-out terminal.

![](/img/or-transistor.svg)
