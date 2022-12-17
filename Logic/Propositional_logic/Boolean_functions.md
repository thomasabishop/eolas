---
categories:
  - Mathematics
tags: [logic]
---

# Boolean functions

An example of a Boolean function:

$$
f(x,y,z) = (x \land y) \lor (\lnot(x) \land z )
$$

Here is a work through where $f(1, 0, 1)$:

- The first disjunction : $ \lnot(x) \land z $ is false because $x$ is 1 and $z$ is 1
- The second disjunction: $x \land y$ is true because $x$ is 1 and $y$ is 1
- The overall function returns true because the main connective is disjunction and one of the disjuncts (the second) evaluates to 1. Thus the output is 1.

We can compute all possible outputs of the function by constructing a [truth-table](/Logic/Propositional_logic/Truth-tables.md) with each possible variable as the truth conditions and the output of the function as the truth value:

| $x$ | $y$ | $z$ | $f(x,y,z) = (x \land y) \lor (\lnot(x) \land z )$ |
| --- | --- | --- | ------------------------------------------------- |
| 0   | 0   | 0   | 0                                                 |
| 0   | 0   | 1   | 1                                                 |
| 0   | 1   | 0   | 0                                                 |
| 0   | 1   | 1   | 1                                                 |
| 1   | 0   | 0   | 0                                                 |
| 1   | 0   | 1   | 0                                                 |
| 1   | 1   | 0   | 1                                                 |
| 1   | 1   | 1   | 1                                                 |
