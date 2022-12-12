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

The circuit will have three memory components, each representing one bit of the 3-bit number. When the clock pulses, the 3-bit number increments by one. We need to synchronise the operation with a clock because each bit by itself is meaningless, it only gains meaning by the relation it sustains to the other two bits hence it must be kept in sync with them.