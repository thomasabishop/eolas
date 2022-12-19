---
categories:
  - Logic
  - Computer Architecture
tags: [logic, propositional-logic, nand-to-tetris]
---

# Boolean function synthesis

When we looked at [boolean functions](/Logic/Propositional_logic/Boolean_functions.md) we were working in a particular direction: from a function to a truth table. When we do Boolean function synthesis we work in the opposite direction: from a function to a truth table.

This is an important skill that we will use when constructing [logic circuits](/Electronics_and_Hardware/Digital_circuits/Digital_circuits.md). We will go from truth conditions (i.e. what we want the circuit to do and when we want it to do it) to a function expression which is then reduced and implemented with [logic gates](/Electronics_and_Hardware/Digital_circuits/Logic_gates.md).

## The process

The process proceeds as follows:

1. Work out the truth conditions for the circuit we want to construct
2. Identify the rows where the output is equal to 1
3. For each of these rows construct a Boolean expression that evaluates to that output
4. Join each expression with OR
5. Reduce these expressions to a single expression in its simplest form

## Example

Let's say we have the following truth table:

| Line | $x$ | $y$ | $z$ | $f$ |
| ---- | --- | --- | --- | --- |
| 1    | 0   | 0   | 0   | 1   |
| 2    | 0   | 0   | 1   | 0   |
| 3    | 0   | 1   | 0   | 1   |
| 4    | 0   | 1   | 1   | 0   |
| 5    | 1   | 0   | 0   | 1   |
| 6    | 1   | 0   | 1   | 0   |
| 7    | 1   | 1   | 0   | 0   |
| 8    | 1   | 1   | 1   | 0   |

We only need to focus on lines 1, 3, and 5 since they have the output 1:

| Line | $x$ | $y$ | $z$ | $f$ |
| ---- | --- | --- | --- | --- |
| 1    | 0   | 0   | 0   | 1   |
| 3    | 0   | 1   | 0   | 1   |
| 5    | 1   | 0   | 0   | 1   |

For each line we construct a Boolean expression that would result in the value in the $f$ column. In other words we construct the function:

| Line | $x$ | $y$ | $z$ | $f$                                         |
| ---- | --- | --- | --- | ------------------------------------------- |
| 1    | 0   | 0   | 0   | $ \lnot(x) \land \lnot (y) \land \lnot(z) $ |
| 3    | 0   | 1   | 0   | $ \lnot(x) \land y \land \lnot(z) $         |
| 5    | 1   | 0   | 0   | $ x \land \lnot(y) \land \lnot(z) $         |

We can now join each expression to create a complex expression that covers the entire truth table. Since 1 will be output for any one of these sub-expressions we can just join them up with OR:

$$
(\lnot(x) \land \lnot (y) \land \lnot(z)) \lor \lnot(x) \land y \land \lnot(z) \lor  x \land \lnot(y) \land \lnot(z)
$$

It's clear that we have transcribed the truth conditions accurately but that we are doing so in a rather verbose way. Let's simplify:
