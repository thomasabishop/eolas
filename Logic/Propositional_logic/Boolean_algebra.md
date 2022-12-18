---
categories:
  - Logic
tags: [propositional-logic, algebra]
---

# Boolean algebra

## Algebraic laws

Many of the laws that obtain in the mathematical realm of algebra also obtain for Boolean expressions.

### The Commutative Law

$$
    x \land y = y \land x \\
$$

$$

    x \lor y = y \lor x
$$

Compare the [Commutative Law](/Mathematics/Prealgebra/Whole_numbers.md#the-commutative-property) in the context of arithmetic.

### The Associative Law

$$
    x   \land (y \land z) = (x \land y) \land z
$$

$$
    x   \lor (y \lor z) = (x \lor y) \lor z
$$

Compare the [Associative Law](/Mathematics/Prealgebra/Whole_numbers.md#the-associative-property) in the context of arithmetic.

### The Distributive Law

$$
    x \land (y \lor z) = (x \land y) \lor (x \land z)
$$

$$
    x \lor (y \land z) = (x \lor y) \land (x \lor z)
$$

Compare for instance how this applies in the case of [multiplication](/Mathematics/Prealgebra/Distributivity.md):

$$
    a \cdot (b + c) = a \cdot b + a \cdot c
$$

In addition we have [DeMorgan's Laws](/Logic/Laws_and_theorems.md/DeMorgan's_Laws.md) which express the relationship that obtains between the negations of conjunctive and disjunctive expressions

## Applying the laws to simplify complex Boolean expressions

Say we have the following expression:

$$
    \lnot(\lnot(x) \land \lnot (x \lor y))
$$

We can employ DeMorgan's Laws to convert the second conjunct to a different form:

$$
    \lnot (x \lor x) = \lnot x \land \lnot y
$$

So now we have:

$$
    \lnot(\lnot(x) \land (\lnot x \land \lnot y ))
$$

As we have now have an expression of the form _P and (Q and R)_ we can apply the Distributive Law to simplify the brackets (_P and Q and R_):

$$
    \lnot( \lnot(x) \land \lnot(x) \land \lnot(y))
$$

Notice that we are repeating ourselves in this reformulation. We have $\lnot(x) \land \lnot(x)$ but this is just the same $\lnot(x)$ by the principle of **idempotence**. So we can reduce to:

$$
    \lnot(\lnot(x) \land \lnot(y))
$$

This gives our expression the form of the first DeMorgan Law ($\lnot (P \land Q)$), thus we can apply the law ($\lnot P \lor \lnot Q$) to get:

$$
\lnot(\lnot(x)) \lor \lnot(\lnot(y))
$$

Of course now we have two double negatives. We can apply the double negation law to get:

$$
    x \lor y
$$

### Truth table

Whenever we simplify an algebraic expression the value of the resulting expression should match that of the complex expression. We can demonstrate this with a truth table:

| $x$ | $y$ | $\lnot(\lnot(x) \land \lnot (x \lor y))$ | $x \lor y$ |
| --- | --- | ---------------------------------------- | ---------- |
| 0   | 0   | 0                                        | 0          |
| 0   | 1   | 1                                        | 1          |
| 1   | 0   | 1                                        | 1          |
| 1   | 1   | 1                                        | 1          |

### Significance for computer architecture

The fact that we can take a complex Boolean function and reduce it to a simpler formulation has great significance for the development of computer architectures, specifically [logic gates](/Electronics_and_Hardware/Digital_circuits/Logic_gates.md). It would be rather resource intensive and inefficient to create a gate that is representative of the complex function. Whereas the simplified version only requires a single [OR gate](/Electronics_and_Hardware/Digital_circuits/Logic_gates.md#or-gate)

// TO DO:

- Use truth tables to show equivalence
- Explicitly add implicit laws
- Link to deductive rules
- Link to digital circuits and NANDs as universal gates
