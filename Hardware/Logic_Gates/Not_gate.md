---
tags:
  - Logic
  - Electronics
  - Hardware
  - logic-gates
---
# NOT gate

This gate corresponds to the `NOT` Boolean or negation logical connective. It is really simple and derived from the trivial logical fact that `true` is `true` and `false` is `false` also known as **logical identity**.

### Natural language
 > 
 > The negation operator (`¬` or `~` ) switches the value of a proposition from `true` to `false`. When we put `~` before `true` it becomes `false` and when we put `~` before `false` it becomes `true` .

### Truth table

![1-w2ILS6M9pgmLcK6V1PEs3Q.png](../../img/1-w2ILS6M9pgmLcK6V1PEs3Q.png)

This corresponds to a simple on-off switch.

In terms of logic gates we would create this by using a single NAND gate. Although it can take a total of two inputs, it would be controlled by a single switch, so both inputs would be set to `1 1` or `0 0` when the switch is activated and deactivated. This would remove the `AND` aspect of `NAND` and reduce it to `NOT` .

A NAND gate simulating NOT logic

![Screenshot_2020-08-25_at_15.09.01.png](../../img/Screenshot_2020-08-25_at_15.09.01.png)

TO DO: Come back to this with new book and explain better how a NAND can be reduced to NOT. 

### Symbol for `NOT` gate

NOT has its own electrical symbol to distinguish it from a NAND:

![Screenshot_2020-08-25_at_15.18.34.png](../../img/Screenshot_2020-08-25_at_15.18.34.png)
