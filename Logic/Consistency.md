---
tags:
  - Logic
  - propositional-logic
  - consistency
---

## Informal definition

A set of sentences is consistent if and only if **it is possible for all the members of the set to be true at the same time**. A set of sentences is inconsistent if and only if it is not consistent.

### Demonstration

The following set of sentences form an inconsistent set:

````
(1) Anyone who takes astrology seriously is a lunatic.
(2) Alice is my sister and no sister of mine has a lunatic for a husband.
(3) David is Alice's husband and he read's the horoscope column every morning.
(4) Anyone who reads the horoscope column every morning takes astrology seriously.
````

The set is inconsistent because not all of them can be true. If (1), (3), (4) are true, (2) cannot be. If (2), (3),(4) are true, (1) cannot be.

## Formal definition

 > 
 > A finite set of sentences $\Gamma$ is truth-functionally consistent if and only if there is at least one truth-assignment in which all sentences of $\Gamma$ are true.

### Informal expression

````
The book is blue or the book is brown
The book is brown
````

### Formal expression

````
{P v Q, Q}
````

### Truth-table

````
P	Q				P	∨	Q	        Q
T	T					T		        T    *
T	F					T		        F
F	T					T		        T    *
F	F					F               F
````

## Derivation

 > 
 > In terms of logical derivation, a finite $\Gamma$ of propositions is **inconsistent** in a system of derivation for propositional logic if and only if a sentence of the $P & \sim P$ is derivable from $\Gamma$. It is **consistent** just if this is not the case.

In other terms, if you can derive a contradiction from the set, the set is logically inconsistent. 

A [contradiction](Logical%20truth%20and%20falsity.md#logical-falsity) contradiction has very important consequences for reasoning because if a set of propositions is inconsistent, every and all other propositions are derivable from that set.

![proofs-drawio-Page-5.drawio 3.png](../img/proofs-drawio-Page-5.drawio%203.png)

*A demonstration of the the consequences of deriving a contradiction in a sequence of reasoning.*

Here we want to derive some proposition $Q$. If we can derive a contradiction from its negation as an assumption then, by the [negation elimination](Negation%20Elimination.md) rule, we can assert $Q$. This is why contradictions should be avoided in arguments, they 'prove' everything which, by association, undermines any particular premise you are trying to assert.
