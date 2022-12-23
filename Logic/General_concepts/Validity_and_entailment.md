---
categories:
  - Logic
tags: [propositional-logic]
---

## Validity

### Informal definition

In order to say whether an argument is 'good' or 'bad' we must have criteria of evaluation. in logic there are different criteria of evaluation:

- **Deductive validity**

  An **argument is deductively valid if and only if it is not possible for the premises to be true and the conclusion false**. Linking to consistency: it is not possible to consistently assert all of the premises but deny the conclusion.

- **Inductive strength**

  We do not say that inductive arguments have 'validity' because despite inductive premises being true, the conclusion may be falsifiable. Therefore we say inductive 'strength' rather than 'validity'. An argument is inductively strong if and only if the conclusion is probably true given the premises.

#### Demonstration

The Socrates demonstration above is an example of deductive validity.

The following is an example of an argument that is inductively strong:

```
99% of deaf persons have no musical talent.
Beethoven was deaf.
___________________________________________
Beethoven had no musical talent.
```

The test for a strong inductive argument is not whether the conclusion is true, rather it concerns the evidence the premises provide in support of the conclusion.

> In propositional logic we are concerned solely with deductive validity or invalidity.

### Formal definition

> An argument is truth-functionally valid if and only if there is no truth-assignment on which all the premises are true and the conclusion is false.

Linking this to derivation, we say:

> In a system of derivation in propositional logic, an argument is valid if the conclusion of the argument is derivable within the system of derivation from the set consisting of the premises, and invalid otherwise.

### Demonstration

The inference from the set ${P, P \rightarrow Q}$ to $Q$ is valid

### Truth-table

| $P$ | $Q$ | $P \rightarrow Q$ | $P$ | $Q$ | Assessment |
| --- | --- | ----------------- | --- | --- | ---------- |
| T   | T   | T                 | T   | T   | Valid      |
| T   | F   | F                 | T   | F   |            |
| F   | T   | T                 | F   | T   |            |

## Entailment

### Informal definition

Entailment as a concept is almost identical to validity. We say that a proposition is entailed by a set of propositions if it is not possible for every member of this set to be true and the proposition to be false.

The difference with validity resides in the fact that the propositions are distinguished in terms of whether they are premises or a conclusion. So, technically, validity is a subclass of entailment. A case of entailment where we distinguish propositions in terms of whether they are premises or conclusions. A proposition may be entailed by a given set without that proposition being the _conclusion_ of the set and where the set is a syllogism.

### Formal definition

> A finite set of sentences $\Gamma$ $\vdash$ $P$ if and only if there is no truth-assignment in which every member of $\Gamma$ is true and $P$ is false.

#### Informal demonstration

```
It is raining.
If it is raining then the pavement will be wet.
The pavement is wet.
```

#### Formal demonstration

$$
  \{ P, P\rightarrow Q   \} \vdash Q
$$

#### Truth-table

| $P$ | $Q$ | $P \rightarrow Q$ | $P$ | $Q$ | Assessment |
| --- | --- | ----------------- | --- | --- | ---------- |
| T   | T   | T                 | T   | T   | Valid      |
| T   | F   | F                 | T   | F   |            |
| F   | T   | T                 | F   | T   |            |
