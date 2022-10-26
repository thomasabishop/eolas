---
title: Switches and transistors
categories:
  - Computer Architecture
  - Electronics
  - Hardware
tags: [logic-gates, binary, memory]
---

# Switches and transistors

Ultimately every process in a computer is the product of a digital [circuit](/Electronics/Circuits.md) that is working on binary values. In contrast to electrical circuits, digital circuits are not represented in an [analogue](/Hardware/Analogue_and_digital.md) fashion.

In a standard electrical circuit, voltage, current and resistance can vary over a wide range of values however in the binary context we want to deal with discrete values (zeros and ones) which can be fed into the various [logic gates](/Hardware/Logic_Gates/Logic_gates.md).

We therefore need a way to represent 'on' and 'off' as single quantities. We do this by stipulating that a given voltage corresponds to 'on' (high) and another corresponds to 'off' (low). Of course these are not really discrete values since voltage is inherently analogue but we basically binary-encode them. Formally 'on' has a voltage of 1 and 'off' has a voltage of 0. In reality 'on' tends to be within 2-5V depending on the circuit design and anything between 0 - 0.8V is considered off.

## Implementing binary logic with mechanical switches

## Transistors
