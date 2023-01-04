---
categories:
  - Electronics
  - Hardware
tags: [logic-gates, binary, memory, clock]
---

# 3-bit Counter

To demonstrate the use of [Flip-Flops](/Electronics_and_Hardware/Digital_circuits/Flip_flops.md) we will create the circuit for a 3-bit counter. This simply counts up from 0 to 7 because 7 is the maximum decimal number we can create with three bits ($2^3$): 

| Binary 	| Decimal 	| 
|-------	| -------	|
| 000 	    | 0	        | 
| 001 	    | 1 	    | 
| 010 	    | 2 	    | 
| 011	    | 3 	    | 
| 100 	    | 4 	    | 
| 101 	    | 5 	    | 
| 110 	    | 6 	    | 
| 111 	    | 7 	    | 

The circuit will have three memory components, each representing one bit of the 3-bit number. When the [clock pulses](/Electronics_and_Hardware/Digital_circuits/Clock_signals.md), the 3-bit number increments by one. We need to synchronise the operation with a clock because each bit by itself is meaningless, it only gains meaning by the relation it sustains to the other two bits hence it must be kept in sync with them.

We can derive the circuit arrangement by analysing the outputs of a flipflop at each pulse:

| Combined bits 	| Q2 	| Q1 	| Q0 	| Decimal 	|
|---------------	|----	|----	|----	|---------	|
| 000           	| 0  	| 0  	| 0  	| 0       	|
| 001           	| 0  	| 0  	| 1  	| 1       	|
| 010           	| 0  	| 1  	| 0  	| 2       	|
| 011           	| 0  	| 1  	| 1  	| 3       	|
| 100           	| 1  	| 0  	| 0  	| 4       	|
| 101           	| 1  	| 0  	| 1  	| 5       	|
| 110           	| 1  	| 1  	| 0  	| 6       	|
| 111           	| 1  	| 1  	| 1  	| 7       	|

If we look at the pattern of each flip-flops' output we notice the following:

* _Q0_ toggles on every pulse
* _Q1_  toggles every time _Q0_ was previously 1
* _Q2_ toggles when both _Q1_ and _Q0_ were previously 1

This means that to construct a circuit that displays this behaviour we just have to use a [T flip-flop](/Electronics_and_Hardware/Digital_circuits/Flip_flops.md#t-flip-flops) since the only state change we need is a single bit toggle three times that retains its value.

Using these pulse patterns we can construct a circuit as follows:
![](/_img/3-bit-adder-diagram.png)

<iframe src="https://circuitverse.org/simulator/embed/3-bit-counter-d33846e3-7538-427d-b4cc-dc64fdaf0af3?theme=default&display_title=false&clock_time=true&fullscreen=true&zoom_in_out=true" style="border-width:; border-style: solid; border-color:;" name="myiframe" id="projectPreview" scrolling="no" frameborder="1" marginheight="0px" marginwidth="0px" height="500" width="600" allowFullScreen></iframe>

<br />

> Remember from the table: Q2 is the most significant bit and Q0 is the least significant bit so we should read the output in the interactive circuit backwards, reversing the order. Then we will see that the cicuit is cyling through 0-7 


This is how the circuit works:

* All three flip-flops are connected to the same clock signal so that they are synchnonised
* Because _T0_ is connected to the voltage source _Q0_ toggles every time the clock pulses
* _T1_ is connected to _Q0_ so a clock pulse causes _Q1_ to toggle only when _Q0_ is high in line with the table
* _T2_ is connected to _Q0 AND Q1_ so _Q2_ only toggles on a clock pulse when _Q0_ and _Q1_ are both high
