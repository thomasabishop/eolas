---
categories:
  - Logic
tags: [propositional-logic]
---

# Strategies for constructing proofs in propositional logic

## General strategy

- Break complex propositions into simpler sentences by using the elimination rules
- Recombine simple propositions into complex propositions using the introduction rules.

## Goal analysis

The approach above describes the general form of a proof but of course it will not always work and there will be cases where the route to the desired derivation is more circuitous. In these instances it is to best to combine this general top level strategy with goal analysis.

Goal analysis is a [recursive](/Data_Structures/Recursion.md) strategy which proceeds by using a 'goal' proposition to guide the construction of intermediary derivations.

Assume that we want to show that an argument is [valid](/Logic/General_concepts/Validity_and_entailment.md#validity). Then our ultimate goal is to derive the conclusion from the premises we are given. We first ask ourselves: _which propositions if we could derive them, would allow us to easily derive the conclusion_? (For example, these propositions might be two simple propositions that when combined with [Conjunction Introduction](/Logic/Proofs/Conjunction_Introduction.md) give us the conclusion.) Deriving these propositions then becomes the new intermediate goal.

If arriving at these propositions is not trivial, we then ask ourselves the question again: _which propositions would permit us to derive the intermediary propositions we need_? You keep working back in this manner until you reach a base level. Then it is just a matter or working upwards from each set of derived intermediary propositions until you reach the ultimate goal.

### Demonstration

Let's say we want to prove $(L \lor A) \land D$ from the propositions $\lnot N$ and $((\lnot N \rightarrow L) \land (D \leftrightarrow \lnot N))$.

First, we consider what is the easiest possible way of achieving the proposition $(L \lor A) \land D$. Clearly it is to separately derive each disjunct ($L \lor A$ and $D$) and then combine them with [Conjunction Introduction](/Logic/Proofs/Conditional_Introduction.md). This provides us with our first goal: to derive each of the separate conjuncts.

Let's start with $D$: where does it occur in the assumptions? It occurs in the compound $(\lnot N \rightarrow L) \land (D \leftrightarrow \lnot N)$, but only in the first conjunct. We can get this simply but applying [Conjunction Elimination](Conjunction%20Elimination.md).

So far we have:

![](/img/step1.png)

Now we just need to get $D$ from the proposition at line 3. This is easy since we already have access to the consequent of the biconditional at line 1. Therefore we can apply [Biconditional Elimination](/Logic/Proofs/Biconditional_Elimination.md)) at line 3 to get $D$. We are now halfway there:

![](/img/step2.png)

Next we need to turn our attention to deriving $L \lor A$. How can we obtain $L$ ? Well it is contained within the first conjunct of the assumption on line 2. Again, we can get this through the application of [Conjunction Elimination](/Logic/Proofs/Conjunction_Elimination.md).
Now, how do we get $L$ from $(\lnot N \rightarrow L)$? Well, we already have the antecedent $\lnot N$ as an assumption on the first line, so we can use [Conditional Elimination](/Logic/Proofs/Conditional_Elimination.md) to derive $L$. These two steps give us:

![](/img/step3.png)

Now we need to get from $L$ to $L \lor A$. This is really straightforward because by using [Disjunction Introduction](/Logic/Proofs/Disjunction_Introduction.md)) we can get from any sentence to a disjunction. Finally, having assembled all the constituent parts of the conjunction that is the conclusion, we can combine them with [Conjunction Introduction](/Logic/Proofs/Conjunction_Introduction.md) as we had planned at the outset.

![](/img/step4.png)

### A further example

We will seek to prove the following:

$$
\{ \lnot L \leftrightarrow [X \land (\lnot S \lor B) ], (E \land C) \rightarrow \lnot L, (E \land R) \land C \} \vdash X \land (\lnot S \lor B)
$$

The requirements here could easily mislead us. We see that the target proposition is a conjunction so we might think that the best strategy is to seek to derive each conjunct and then combine them via [Conjunction Introduction](/Logic/Proofs/Conjunction_Introduction.md)).

Actually, if we look more closely, there is a better approach. The target proposition is contained in the first premise as the consequent to the biconditional ($\lnot L \leftrightarrow [X \land (\lnot S \lor B)]$). A better approach is therefore to seek to derive the antecedent ($\lnot L$) and then use [Biconditional Elimination](/Logic/Proofs/Biconditional_Elimination.md) to extract the target sentence which is the consequent.

![proof.png](/img/proof.png)

## Proving theorems

When we are proving [theorems](/Logic/Laws_and_theorems.md/Theorems_and_empty_sets.md#theorems-and-empty-sets) we do not have a set of assumptions to work from when constructing the proof. We must derive the target sentence from the 'empty set' which is the target sentence itself. It is therefore like a process of reverse engineering.

### Demonstration

_Prove:_ $\vdash (U \land Y) \rightarrow [L \rightarrow (U \land L)]$

Our strategy here is to identify the main connective in the proposition we want to derive (the material conditional). We then assume the antecedent and attempt to derive the consequent from it.

![](/img/theoremproof.png)

## A complex theorem proof

_Prove_ $\vdash (\lnot A \lor \lnot B) \leftrightarrow \lnot(A \land B)$

![](/img/dsfdsfsdfwe.png)

### Walkthrough

**Lines 1-12**

- Our auxiliary goal is to prove $\lnot (A \lor B) \rightarrow \lnot (A \land B)$.

- Our starting assumption is to a disjunction. Thus we can apply [Disjunction Elimination](/Logic/Proofs/Disjunction_Elimination.md) to show that our goal sentence $\lnot(A \land B)$ follows from each of the disjuncts ($\lnot A$ and $\lnot B$) in dedicated sub-proofs. If we can do this, we have the right to derive $\lnot (A \land B)$.

- In both cases($\lnot A \vdash \lnot (A \land B)$) and ($\lnot B \vdash \lnot (A \land B)$ we require another sub-proof to reach the target as there is no easy path available. So we derive a negation from $A \land  B$ so that we can negate it as $\lnot (A \land B)$.

- Having done this, we can discharge the [Disjunction Elimination](/Logic/Proofs/Disjunction_Elimination.md) sub-proofs and derive $\lnot (A \land B)$ from $\lnot A \lor \lnot B$

**Lines 13-26**

- Our auxiliary goal is to prove $\lnot (A \land B) \rightarrow \lnot A \lor  \lnot B$. This will require a different approach to the above because we are not working from a disjunction anymore, we have a negated conjunction.
- We will do this by assuming the negation of what we want to prove ($\lnot (\lnot A \lor \lnot B)$) and then apply [Negation Elimination](/Logic/Proofs/Negation_Elimination.md) to get $\lnot A \lor \lnot B$.
- This requires us to derive a contradiction. We get this on lines 23 and 24. This requires as previous steps that we have two sub-proofs that use [Negation Elimination](/Logic/Proofs/Negation_Elimination.md) to release $A$ and $B$
