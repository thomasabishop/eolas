---
categories:
  - Computer Architecture
  - Hardware
tags: [HDL, nand-to-tetris]
---

# Hardware Description Language

An HDL is a declarative programming language used to describe the behaviour or structure of [digital circuits](/Electronics_and_Hardware/Digital_circuits/Integrated_circuits.md). They are used to simulate the circuit and check its response.

The hardware designer specifies a chip's logic by writing an HDL program which is then rigorously tested. At this stage, a [hardware simulator](/Computer_Architecture/Hardware_simulation.md) takes the HDL program as input and creates a software representation of the chip logic. The designer can instruct the simulator to test the virtual chip on various sets of inputs. This is done to check the chip's functionality but also to benchmark a variety of other parameters such as speed of computation and energy consumption.

There are many HDLs but the most popular are VHDL ("very high speed integrated-circuit description language") and Verilog.

## Usage in _NAND to Tetris_

We won't use an actual HDL language, instead we will use a simplified toy language called HDL that is simple enough that when it is used with a simulator, we can learn the main facets of chip design.

## Demonstration

We will create an HDL program for an XOR gate that is implemented through the following arrangement of NOT, AND, and OR gates:
