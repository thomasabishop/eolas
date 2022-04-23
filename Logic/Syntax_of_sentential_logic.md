---
tags:
  - Logic
  - propositional-logic
---

## Syntax of formal languages versus semantics

 > 
 > The syntactical study of a language is the study of the expressions of the language and the relations among them *without regard* to the possible interpretations or 'meaning' of these expressions.

Syntax is talking about the order and placement of propositions relative to connectives and what constitutes a well-formed expression in these terms. Semantics is about what the connectives mean, in other words: truth-functions and truth-values and not just placement and order.

## Formal specification of the syntax of the language of Sentential Logic

### Vocabulary

Sentences in SL are capitalised Roman letters (non-bold) with or without natural number subscripts. We may call these sentence letters. For example:

````plain
P, Q, R...P1, Q1, R1...
````

The connectives of SL are the five truth-functional connectives:

````
~, &, v, ⊃, ≡
````

The punctuation marks of SL consist in the left and right parentheses:

````
(  )
````

### Grammar

1. Every sentence letter is a sentence.
1. If **P** is a sentence then **~P** is a sentence.
1. If **P** and **Q** are sentences, then **(P & Q)** is a sentence
1. If **P** and **Q** are sentences, then **(P v Q)** is a sentence
1. If **P** and **Q** are sentences, then **(P ⊃ Q)** is a sentence
1. If **P** and **Q** are sentences, then **(P ≡ Q)** is a sentence
1. Nothing is a sentence unless it can be formed by repeated application of clauses 1-6

### Additional syntactic concepts

We also distinguish:

* the **main connective**
* **immediate sentential components**
* **sentential components**
* **atomic components**

These definitions provide a formal specification of the concepts of atomic and molecular sentences *introduced earlier*.

1. If **P** is an atomic sentence, **P** contains no connectives and hence does not have a main connective. **P** has no immediate sentential components.
1. If **P** is of the form **~Q** where **Q** is a sentence, then the main connective of **P** is the tilde that occurs before **Q** and **Q** is the immediate sentential component of **P**.
1. If P is of the form:
   1. **Q & R**
   1. **Q v R**
   1. **Q ⊃ R**
   1. **Q ≡ R**

where **Q** and **R** are sentences, then the main connective of **P** is the connective that occurs between **Q** and **R** and **Q** and **R** are the immediate sentential components of **P**.
