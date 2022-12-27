---
categories:
  - Logic
tags: [propositional-logic]
---

# Syntax of propositional logic

## Syntax of formal languages versus semantics

> The syntactical study of a language is the study of the expressions of the language and the relations among them _without regard_ to the possible interpretations or 'meaning' of these expressions.

Syntax is talking about the order and placement of propositions relative to connectives and what constitutes a well-formed expression in these terms. Semantics is about what the connectives mean, in other words: truth-functions and truth-values and not just placement and order.

## Formal specification of the syntax of the language of Sentential Logic

### Vocabulary

Propositions in SL are capitalised Roman letters (non-bold) with or without natural number subscripts. We may call these proposition letters. For example:

$$
  P, Q, R,... P_{1}, Q_{1}, R_{1}, ...
$$

The connectives of SL are the five truth-functional connectives:

$$
  \lnot, \land, \lor, \rightarrow, \leftrightarrow
$$

The punctuation marks of SL consist in the left and right parentheses:

$$
  ( )
$$

### Grammar

1. Every letter in a statement is a proposition.
2. If $P$ is a proposition then $\lnot P$ is a proposition.
3. If $P$ and $Q$ are propositions, then $P \land Q$ is a proposition
4. If $P$ and $Q$ are propositions, then $P \lor Q$ is a proposition
5. If $P$ and $Q$ are propositions, then $P \rightarrow Q$ is a proposition
6. If $P$ and $Q$ are propositions, then $P \leftrightarrow Q$ is a proposition
7. Nothing is a proposition unless it can be formed by repeated application of rules 1-6

### Additional syntactic concepts

We also distinguish:

- the **main connective**
- **immediate sentential components**
- **sentential components**
- **atomic components**

These definitions provide a formal specification of the concepts of [atomic and molecular propositions](/Logic/Propositional_logic/Atomic_and_molecular_propositions.md) introduced previously.

1. If $P$ is an atomic proposition, $P$ contains no connectives and hence does not have a main connective. $P$ has no immediate propositional components.
1. If $P$ is of the form $\lnot Q$ where $Q$ is a proposition, then the main connective of $P$ is the negation symbol that occurs before $Q$ and $Q$ is the immediate propositional component of $P$
1. If P is of the form:
   1. $Q \land R$
   1. $Q \lor R$
   1. $Q \rightarrow R$
   1. $Q \leftrightarrow R$

where $Q$ and $R$ are propositions, then the main connective of $P$ is the connective that occurs between $Q$ and $R$ and $Q$ and $R$ are the immediate propositional components of $P$.
