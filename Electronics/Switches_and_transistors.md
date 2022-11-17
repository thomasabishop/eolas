---
title: Switches and transistors
categories:
  - Computer Architecture
  - Electronics
  - Hardware
tags: [logic-gates, binary, memory]
---

# Switches and transistors

In the discussion of [digital circuits](/Electronics/Digital_circuits.md) we noted that a digital circuit requires that electrical phenomena be treated as discrete rather than continuous values. Although a given voltage at a point in the circuit can vary widely, in order to represent the binary states of 'on' and 'off' we need it to remain fixed within certain narrow parameters. Typically a voltage between 2V - 5V for the 'on' state and a voltage between 0V - 0.8V for the 'off' state.

We will look at two ways to achieve this. Firstly with literal switches which are impractical but useful for understanding the concept and then with transistors which are what are actually used in computers.

## Implementing binary logic with mechanical switches

An electrical switch is inherently binary. When the switch is on, it acts like a simple copper wire through which current flows freely. When the switch is off, it acts like an open circuit and no current can flow.

We can combine switches in a circuit to create analogs to logic gates.

![](/img/switch-and-gate.png)

In the example above a simple AND gate is implemented with switches. Each switch is a conjunct and the current only flows if both switches are on, closing the circuit.

![](/img/switch-or-gate.png)

In the example above is a circuit implementing an OR gate. The current flows just if one of the switches are on or if both of the switches are on but not if both switches are off.

## Transistors

In real digital circuits, mechanical switches would be totally impractical. The number of switches required is too numerous and we need to be able to connect and interconnect the output of many circuits together. The output of one circuit needs to be fed into another and there is no way to do this with switches.

Thus instead of switches, modern digital circuits use transistors, a special electrical component that controls the flow of current in the manner of a switch where the 'off' and 'on' states are represented by [voltage](/Electronics/Voltage.md) values within set paramters.

There are different types of transistors but the simplest for the purposes of explanation are **bipolar junction transistors**.

![](/img/transistor-diag.svg)

A transistor works as follows: applying a small amount of current at the base allows a larger current to flow from the collector to the emitter. Relating this back to switches, applying current to the base is like turning the switch on. Removing this current is like turning the switch off.
