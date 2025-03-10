---
tags: [theory-of-computation, Turing]
created: Friday, September 13, 2024
---

# Turing Completeness

We know that a [Turing machine](Turing_machines.md) is a theoretical construct
of a computer that:

> contains mutable state, executes sequences of simple instructions that read
> and write that state, and can pick different execution paths depending on the
> state (via conditional branch instructions.)

A Turing Complete (TC) system is a system that abides by, or can be reduced to,
the above description.

TC also serves as a _definition of computability_ and provides a formal basis
for conceiving of computation at a theoretical level.

All Turing Complete systems are functionally equivalent. This means they can
simulate each other given enough time and memory. Similarly a TC system can in
principle perform any computation that any other programmable computer can
perform. This is true for _other_ TC systems and also those that are not TC
however the inverse doesn't hold: a non-TC system cannot emulate a TS system.
For instance a calculator cannot do what a TC smart phone can do. But a smart
phone can act as a calculator.

This concept of completeness is also expressed in terms of a Universal Turing
Machine - a TM capable of simulating any other Turing machine. Given that the
ability of a TM to simulate another TM is the condition for completeness, a TC
system is also a UTM.

Completeness applies to the hardware of computers as well as their software.

Turing Completeness is the theoretical basis of the practical concept of a
"general-purpose computer": a general-purpose computer is such because it is
TC - it can in theory compute anything that is computable.

Most modern programming languages are Turing Complete in that they can, in
theory, be used to compute anything that is computable.
