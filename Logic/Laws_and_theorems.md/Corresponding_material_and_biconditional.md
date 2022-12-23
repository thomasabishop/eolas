---
categories:
  - Logic
tags: [propositional-logic]
---

# Corresponding material conditional to show validity

To demonstrate _truth-functional validity_ we have to construct a truth-table which contains each of the premises and the conclusion and then review each row to see if there is an assignment where both the premises and the conclusion are true.

A simpler way to get the same result is to invoke the corresponding material conditional. Here we concatenate the premises using conjunction and then join them to the conclusion using the material conditional, which then becomes the main connective. We then populate the truth table for this compound proposition. If it is logically true, the argument is valid.

### Demonstration

We will demonstrate with the following set:

$$ \{ P \leftrightarrow Q, P \lor Q, P \land Q \} $$

| $P$ | $Q$ | $P \leftrightarrow Q$ | $P \lor Q$ |
| --- | --- | --------------------- | ---------- |
| T   | T   | T                     | T          |
| T   | F   | F                     | T          |
| F   | T   | F                     | T          |
| F   | F   | T                     | F          |

| $P$ | $Q$ | $(P \leftrightarrow Q) \land (P \lor Q)) \leftrightarrow (P \lor Q)$ |
| --- | --- | -------------------------------------------------------------------- |
| T   | T   | T                                                                    |
| T   | F   | T                                                                    |
| F   | T   | T                                                                    |
| F   | F   | T                                                                    |

We see above that the main connective, the material conditional returns true for every truth-functional assignment. In other words it is logically true. Consequently the argument is valid

## Corresponding material biconditional

We can use the corresponding material biconditional as a shorthand for demonstrating logical equivalence between two propositions.

For two putatively equivalent propositions $P$ and $Q$, $P$ and $Q$ are logically equivalent if the compound proposition $P \equiv Q$ is logically true.
