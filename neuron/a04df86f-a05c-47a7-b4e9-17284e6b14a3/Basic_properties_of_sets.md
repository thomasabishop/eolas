---
tags:
  - set-theory
---

# Basic properties of sets

## Set theory

Set theory is a sub-discipline of both mathematics and formal logic. In
mathematics it is used as a universal framework for describing other
mathematical theories. It is also utilised in computer science and linguistics.

It is useful because it provides tools for modelling an extraordinary variety of
structures.

> Set theory and the theory of infinite sets was created by Georg Cantor
> (1845-1918), a German mathematician.

## Method of formalisation

We can use the symbols of predicate logic to simplify and clarify natural
language expression of set-theoretic principles. There are different ways to do
this but we will use the standard quantifiers and:

- variables $a,b,c,...$ to range over sets
- variables $x,y,z$ to range over ordinary objects as well as sets.

More generally we will use capital Latin letters ($A, B, ...$) to denote some
specific set, i.e not a generalised/quantified notion of a set.

### Example

'Everything is a member of some set or another:

$$ \forall x \exists a (x\in a) $$

## What are sets?

A set is a collection of objects. In mathematics the objects are mathematical
objects.

A **finite set:**

$$ BG = { \textsf{Barry, Maurice, Robin}} $$

An **infinite set:**

$$ I = {1, 2, 3, 4, ...} $$

> When we use braces to indicate the members of a set we are providing a **list
> description** of the set.

## Set membership

If a set S is a collection of objects, to say that object x is a member of S is
just to say that x is one of those objects.

We might also express this in natural language as:

- the object x is an element of the set S
- the object x belongs to S
- the set S contains the object x

Formally, we use epsilon to express set membership:

$$ x \in A $$

This asserts that x is a member of the set A.

The negation of this proposition is expressed:

$$ x \notin A $$

This asserts that x is not a member of the set A.

### Subsets

> Set A is a subset of set B if every member of A is also a member of B.

For example the set of women is a subset of the set of humans because every
woman is a human. We express subset relations like so:

$$ A \subseteq B $$

This asserts that set A is a subset of set B.

The negation of this proposition is expressed:

$$ A \not\subset B $$

We must not confuse the relation of being a subset with being a member. Jane is
a member of the set of women but Jane is not a subset of the set of women since
Jane is not herself a set, she is an object/individual member.

There is also the notion of a **proper subset.**

> If subset _A_ of _B_ is a proper subset of _B_ then _B_ contains some elements
> that are not in _A_.

In other words, if B contains objects other than/ in addition to A.

$$ A \subset B $$

This asserts that set A is a proper subset of set B.

For example, the set of women is a proper subset of the set of humans because
the set of humans also includes the set of men. If there were only women and no
men, then the set of women would be a subset of the set of humans.

### Supersets

If A is a subset of B then we say that B is a **superset** of A. Being a
superset, B contains every object of A and may also contain other objects in
addition to A. This is just a different way of asserting that A is a proper
subset of B.

$$ B \supseteq A $$

This asserts B is a superset of A. The negation:

$$ B \not\supset A $$

This asserts that B is not a superset of A.

## Resources

[Set symbols](symbols.html)
