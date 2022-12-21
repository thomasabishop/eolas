---
categories:
  - Logic
tags: [propositional-logic]
---

# Logical indeterminacy

The vast majority of propositions in natural and formal logical languages are **neither [logically true](/Logic/General_concepts/Logical_truth_and_falsity.md#logical-truth) or [logically false](/Logic/General_concepts/Logical_truth_and_falsity.md#logical-falsity)**. This makes sense because propositions of this form are all either tautologies or contradictions and as such do not express information about the state of events in the world. We call propositions that are neither logically true or logically false, **logically indeterminate** propositions.

## Informal definition

A proposition is logically indeterminate if it is neither logically true or logically false. This is to say: it can be both [consistently](Consistency.md) asserted and consistently denied.

For example the proposition:

```
It is raining.
```

May be true or false thus it can it both be asserted and denied quite consistently. It is true if it actually is raining and false if it actually is not raining. There is no logical contradiction implied by saying it is raining when it isn't raining, this assertion is simply false. There is a contradiction in saying that both states obtain. Thus the proposition:

```
It is raining and it is not raining.
```

Cannot be consistently asserted as there is no possibility of the proposition being true. It is either raining or it isn't raining. Given the law for conjunction both conjuncts must be true for the proposition as a whole to be true. But in the case of this proposition if one conjunct is true, the other must be false and vice versa, hence it is not possible for the proposition to be true at all. It can _only_ be false.

Contrariwise the proposition:

```
It is raining or it is not raining.
```

Cannot be consistently denied as there is no possibility of it being false. It is either raining or not raining. Given the law for disjunction, either disjunct can be true to make the proposition as a whole true. Given that it is either raining or not raining in either scenario, the proposition as a whole will be true. Therefore there is no possibility of it being false, it can _only_ be true.

## Formal definition

> A proposition P is truth-functionally indeterminate if and only if it is neither truth-functionally true or truth-functionally false.

```
P
```

### Truth-table

```
P			P
T			T
F			F
```
