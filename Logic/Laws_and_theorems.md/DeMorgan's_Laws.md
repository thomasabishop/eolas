---
categories:
  - Logic
tags: [logic, laws]
---

# DeMorgan's Laws

DeMorgan's laws express some fundamental equivalences that obtain between the Boolean [connectives](/Logic/Propositional_logic/Truth-functional_connectives.md).

## First Law

> The negation of a conjunction is logically equivalent to the disjunction of the negations of the original conjuncts.

$$
\lnot (P \land Q) \leftrightarrow \lnot P \lor \lnot Q
$$

The equivalence is demonstrated with the following truth-table

| $P$ | $Q$ | $ \lnot (P \land Q)$ | $ \lnot P \lor \lnot Q$ |
| --- | --- | -------------------- | ----------------------- |
| T   | T   | F                    | F                       |
| T   | F   | T                    | T                       |
| F   | T   | T                    | T                       |
| F   | F   | T                    | T                       |

## Second Law

> The negation of a disjunction is equivalent to the conjunction of the negation of the original disjuncts.

$$
\lnot (P \lor Q) \leftrightarrow \lnot P \land \lnot Q
$$

| $P$ | $Q$ | $ \lnot (P \lor Q)$ | $ \lnot P \land \lnot Q$ |
| --- | --- | ------------------- | ------------------------ |
| T   | T   | F                   | F                        |
| T   | F   | F                   | F                        |
| F   | T   | F                   | F                        |
| F   | F   | T                   | T                        |
