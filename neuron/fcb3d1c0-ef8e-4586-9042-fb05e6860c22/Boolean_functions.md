---
tags:
  - propositional-logic
  - nand-to-tetris
  - logic
---

# Boolean functions

An example of a Boolean function:

$$
f(x,y,z) = (x \land y) \lor (\lnot(x) \land z )
$$

Here is a work through where $f(1, 0, 1)$:

- The first disjunction : $\lnot(x) \land z$ is false because $x$ is 1 and $z$
  is 0
- The second disjunction: $x \land y$ is false because $x$ is 1 and $y$ is 1
- The overall function returns false because the main connective is disjunction
  and both of its disjuncts are false

We can compute all possible outputs of the function by constructing a
[trkjuth table](Truth-tables.md) with each possible
variable as the truth conditions and the output of the function as the truth
value:

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
