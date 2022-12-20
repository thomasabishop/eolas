---
categories:
  - Logic
  - Computer Architecture
tags: [logic, propositional-logic, nand-to-tetris]
---

# Boolean function synthesis

When we looked at [boolean functions](/Logic/Propositional_logic/Boolean_functions.md) we were working in a particular direction: from a function to a truth table. When we do Boolean function synthesis we work in the opposite direction: from a truth table to a function.

This is an important skill that we will use when constructing [logic circuits](/Electronics_and_Hardware/Digital_circuits/Digital_circuits.md). We will go from truth conditions (i.e. what we want the circuit to do and when we want it to do it) to a function expression which is then reduced to its simplest form and implemented with [logic gates](/Electronics_and_Hardware/Digital_circuits/Logic_gates.md).

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

We can now join each expression to create a complex expression that covers the entire truth table using OR:

$$
(\lnot(x) \land \lnot (y) \land \lnot(z)) \lor (\lnot(x) \land y \land \lnot(z)) \lor  (x \land \lnot(y) \land \lnot(z))
$$

It's clear that we have transcribed the truth conditions accurately but that we are doing so in a rather verbose way. We can simplify by just looking at the position of the 1s in the truth table. Notice:

- $z$ is always 0
- $x$ and $y$ are either 0 or 1 but never both 1 in the same row

So we simplify:

$$
    (\lnot(x) \land \lnot(z)) \lor (\lnot(y) \land \lnot(z))
$$

Notice that $\lnot(z)$ is repeated so we can remove the repetition through [idempotence](/Logic/Propositional_logic/Boolean_algebra.md#idempotent-law):

$$
    \lnot z \land (\lnot(x) \lor \lnot(y))
$$

The upshot is that we now have a simpler expression that uses only NOT, OR and AND. We could therefore construct a circuit that just uses these gates to construct the conditions we specified in the first truth table.

> This is important and is an instance of the general theorem that _any Boolean function_ can be represented using an expression containing AND, OR and NOT operations

But even this is too complex. We could get rid of the OR and just use AND and NOT, in other words, NAND:

stopped at 6:38
