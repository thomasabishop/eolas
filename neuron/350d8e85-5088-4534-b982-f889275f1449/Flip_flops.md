---
tags:
  - logic-gates
  - binary
  - memory
---

# Flip-Flops

A flip-flop is a type of
[latch](Latches.md) that is connected
to a [clock signal](Clock_signals.md)
and which executes in time with the clock's pulse. (Sometimes "latch" and
"flip-flop" are used interchangeably but technically a latch is flip-flop
without a clock connection.)

## JK Flip-Flop

The JK Flip-Flop (the letters are meaningless) is basically an SR latch in
functionality. It has a "set" input (_J_) and a "reset" input (_K_) and _Q_ and
inverted-_Q_ outputs.

Where it differs from the SR is that it the SR will change state just if the
voltage is high (this, afterall, is all that a bit is) whereas for the JK to set
it **must receive a clock pulse** and it will only set on the pulse. Hence in
addition to _J_ and _K_ inputs it has a _CLK_ input for "clock".

In addition the JK Flip-Flop has a **toggle** function. When this is executed,
whatever _Q_ currently is will be flipped to its opposite value:
$1 \rightarrow 0$, $0 \rightarrow 1$. The toggle executes when both _J_ and _K_
are set to high.

The possible state changes for the JK Flip-Flop are detailed below:

| J   | K   | Clock | Q state                   | Operation |
| --- | --- | ----- | ------------------------- | --------- |
| 0   | 0   | Pulse | Maintain previous value   | Hold      |
| 0   | 1   | Pulse | 0                         | Reset     |
| 1   | 0   | Pulse | 1                         | Set       |
| 1   | 1   | Pulse | Inverse of previous value | Toggle    |

A JK Flip-Flop can execute on either the positive or negative pulse. Below are
the diagrams for a rising and falling pulse respectively:

![](static/jk-flip-flops.png)

## T Flip-Flops

Another type of Flip-Flop can be created by connecting the _J_ and _K_ inputs of
a JK Flip-Flop to each other. This reduces the possible states to two: toggle
current state or maintain current state. Its overall logic is therefore reduced
to just two lines of the previous state table: the state that obtains when _J_
and _K_ are $0 0$ or $1 1$.

Thus the state table for the T Flip-Flop is:

| T   | Clock | Q state                   | Operation |
| --- | ----- | ------------------------- | --------- |
| 0   | Pulse | Maintain previous value   | Hold      |
| 0   | Pulse | Inverse of previous value | Toggle    |

![](static/t-flip-flops.png)
