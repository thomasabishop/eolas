---
tags:
  - propositional-logic
  - algebra
  - nand-to-tetris
  - logic
---

# Boolean algebra

## Algebraic laws

Many of the laws that obtain in the mathematical realm of algebra also obtain
for Boolean expressions.

### The Commutative Law

$$
    x \land y = y \land x \\
$$

$$

    x \lor y = y \lor x
$$

Compare the
[Commutative Law](Whole_numbers.md#the-commutative-property)
in the context of arithmetic.

### The Associative Law

$$
    x   \land (y \land z) = (x \land y) \land z
$$

$$
    x   \lor (y \lor z) = (x \lor y) \lor z
$$

Compare the
[Associative Law](Whole_numbers.md#the-associative-property)
in the context of arithmetic.

### The Distributive Law

$$
    x \land (y \lor z) = (x \land y) \lor (x \land z)
$$

$$
    x \lor (y \land z) = (x \lor y) \land (x \lor z)
$$

Compare how the
[Distributive Law applies in the case of algebra based on arithmetic](Distributivity.md):

$$
    a \cdot (b + c) = a \cdot b + a \cdot c
$$

### Double Negation Elimination

$$
    \lnot \lnot x = x
$$

### Idempotent Law

$$
    x \land x = x
$$

> Combining a quantity with itself either by logical addition or logical
> multiplication will result in a logical sum or product that is the equivalent
> of the quantity

### DeMorgan's Laws

In addition we have
[DeMorgan's Laws](DeMorgan's_Laws.md) which express
the relationship that obtains between the negations of conjunctive and
disjunctive expressions:

$$
\lnot(x \land y)  = \lnot x \lor \lnot y
$$

$$
    \lnot (x \lor y) = \lnot x \land \lnot y
$$

## Applying the laws to simplify complex Boolean expressions

Say we have the following expression:

$$
    \lnot(\lnot(x) \land \lnot (x \lor y))
$$

We can employ DeMorgan's Laws to convert the second conjunct to a different
form:

$$
    \lnot (x \lor y) = \lnot x \land \lnot y
$$

So now we have:

$$
    \lnot(\lnot(x) \land (\lnot x \land \lnot y ))
$$

As we have now have an expression of the form _P and (Q and R)_ we can apply the
Distributive Law to simplify the brackets (_P and Q and R_):

$$
    \lnot( \lnot(x) \land \lnot(x) \land \lnot(y))
$$

Notice that we are repeating ourselves in this reformulation. We have
$\lnot(x) \land \lnot(x)$ but this is just the same $\lnot(x)$ by the principle
of **idempotence**. So we can reduce to:

$$
    \lnot(\lnot(x) \land \lnot(y))
$$

This gives our expression the form of the first DeMorgan Law
($\lnot (P \land Q)$), thus we can apply the law ($\lnot P \lor \lnot Q$) to
get:

$$
\lnot(\lnot(x)) \lor \lnot(\lnot(y))
$$

Of course now we have two double negatives. We can apply the double negation law
to get:

$$
    x \lor y
$$

### Truth table

Whenever we simplify an algebraic expression the value of the resulting
expression should match that of the complex expression. We can demonstrate this
with a truth table:

| $x$ | $y$ | $\lnot(\lnot(x) \land \lnot (x \lor y))$ | $x \lor y$ |
| --- | --- | ---------------------------------------- | ---------- |
| 0   | 0   | 0                                        | 0          |
| 0   | 1   | 1                                        | 1          |
| 1   | 0   | 1                                        | 1          |
| 1   | 1   | 1                                        | 1          |

### Significance for computer architecture

The fact that we can take a complex Boolean function and reduce it to a simpler
formulation has great significance for the development of computer
architectures, specifically
[logic gates](Logic_gates.md). It
would be rather resource intensive and inefficient to create a gate that is
representative of the complex function. Whereas the simplified version only
requires a single
[OR gate](Logic_gates.md#or-gate).
