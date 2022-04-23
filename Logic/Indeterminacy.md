---
tags:
  - Logic
  - propositional-logic
---

The vast majority of sentences in natural and formal logical languages are neither [ logically true](Logical%20truth%20and%20falsity.md#logical-truth) or [\| logically false](Logical%20truth%20and%20falsity.md#logical-falsity). This makes sense because sentences of this form are all either tautologies or contradictions and as such do not express information about the state of events in the world. We call sentences that are neither logically true or logically false, logically indeterminate sentences.

## Informal definition

A sentence is logically indeterminate if it is neither logically true or logically false. This is to say: it can be both [consistently](Consistency.md) asserted and consistently denied.

For example the sentence:

````
It is raining.
````

May be true or false thus it can it both be asserted and denied quite consistently. It is true if it actually is raining and false if it actually is not raining. There is no logical contradiction in saying it is raining when it isn't raining, this assertion is simply false. There is a contradiction in saying it is both states. Thus the sentence:

````
It is raining and it is not raining.
````

Cannot be consistently asserted as there is no possibility of the sentence being true. It is either raining or it isn't raining. Given the law for conjunction both conjuncts must be true for the sentence as a whole to be true. But in the case of this sentence if one conjunct is true, the other must be false and vice versa, hence it is not possible for the sentence to be true at all. It can *only* be false.

Contrariwise the sentence:

````
It is raining or it is not raining.
````

Cannot be consistently denied as there is no possibility of it being false. It is either raining or not raining. Given the law for disjunction, either disjunct can be true to make the sentence as a whole true. Given that it is either raining or not raining in either scenario, the sentence as a whole will be true. Therefore there is no possibility of it being false, it can *only* be true.

## Formal definition

 > 
 > A sentence P is truth-functionally indeterminate if and only if it is neither truth-functionally true or truth-functionally false.

````
P
````

### Truth-table

````
P			P
T			T
F			F
````
