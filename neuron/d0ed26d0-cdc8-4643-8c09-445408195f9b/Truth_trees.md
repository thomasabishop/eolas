---
tags:
  - logic
  - propositional-logic
---

# Truth trees

## Rationale

Like [truth-tables](Truth-tables.md), truth-trees are a means of graphically
representing the logical relationships that may obtain between propositions.
Truth-trees and truth-tables complement each other and which method you choose
depends on which logical property you are seeking to derive.

Whilst truth-tables have the benefit of being exhaustive - every possible truth
assignment is factored into the representation - their complexity grows
exponentially with each additional proposition they contain. This can make
manually constructing truth tables long-winded and prone to mistakes.

Truth-trees are less onerous but they lack the exhaustive scope of a
truth-table. They are more targeted and are best used for demonstrating _that
something is the case_ rather than _all the possible states that could be the
case_. For example, a truth tree will tell us that a set _S is logically
consistent_ whereas a truth-table will tell us that _S is consistent on the
following three assignments._

## Logical consistency

Recall that a set of propositions is logically or truth-functionally
[consistent](Consistency.md) just if there is at least one assignment of truth
conditions which results in all members of the set being true. To identify
consistency for a set of three propositions via the truth table approach we
would need to construct a truth table with $2^3$ (8) rows. Assume that this set
is consistent on one partial assignment only. This means that 87.5% of our rows
are redundant, they are not required to prove the consistency of the set.
However we can only know this and we can only be sure of consistency once we
have gone through the process of generating an assignment for each row.

Truth trees allow us to reduce the amount of work required and go straight to
the assignment that proves consistency, disregarding the rest which are
irrelevant.

## Truth tree structure and key terms

**When using a truth tree to derive logical consistency, the goal is to
determine whether there is a truth-value assignment on which all of the
sentences of a set are true. If the set is consistent we should be able to
derive a partial assignment from the tree that demonstrates consistency.**

Each truth tree begins with a series of sentences one on top of the other in a
column. We call the sentences that comprise the initial column **set members**.
In constructing the tree, we work downwards from the initial column decomposing
set members into their atomic constituents. We a call an atomic sentence that
has been decomposed a **literal.** A literal will either be an atomic sentence
or the negation of an atomic sentence. If one of the set members is already a
literal, there is no need to decompose it; it can remain as it is.

Once every set member has been decomposed the truth tree is complete. It can
then be interpreted in order to derive logical consistency or inconsistency. If
the set is consistent, we are able to derive the partial assignment(s) that
demonstrate consistency.

The rules for decomposing compound sentences match the truth conditions of the
logical connectives. There are rules for every possible connective and the
negation of every possible connective however in terms of their tree shape they
all correspond to either a conjunction or a disjunction. Disjunctive
decomposition results in new branches being formed off the main column (or
trunk). Conjunctive decomposition is non-branching which means the decomposed
constituents are placed within the trunk of whichever tree or branch they are
decomposed within.

As we construct the tree we list each line in the left-hand margin and the
decomposition rule in the right-hand margin. When we apply a decomposition rule
we must cite the lines to which it applies.

### Closed and open branches

Any branch on which an atomic sentence ($P$) and the negation of that sentence
($\sim P$) both occur is a **closed branch**. A branch that is not closed is an
**open branch**. No partial assignment is recoverable from a closed branch. An
open branch allows truth to ‘flow up’ to the original set members whereas a
closed branch blocks this passage.

### Completed open branch

A completed open branch occurs when we have an open branch that has been fully
decomposed: the branch is open and all molecular sentences have been ticked off
such that it contains only literals.

### Completed tree

A tree where all its branches are either completed open branches or closed
branches.

### Closed tree

A tree where all the branches are closed

### Open tree

A tree with at least one completed open branch

## Deriving consistency

Using the definitions above, we can now define truth-functional consistency and
inconsistency in terms of truth trees:

> A finite set ($\Gamma$ ) of sentences is truth-functionally inconsistent if
> $\Gamma$ is a closed tree

> A finite set ($\Gamma$ ) of sentences is truth-functionally consistent if
> $\Gamma$ is an open tree

## Examples

### First example

The following is a truth tree for the set ${P \lor Q, \sim P }$:

![basic-open-tree 1.svg](/static/basic-open-tree%201.svg)

### Interpretation

- We decompose the disjunction at line 1 on line 3. We tick off the compound
  sentence to indicate that it is now decomposed and no longer under
  consideration.
- Both P and its negation exist on a single branch (at line 2 and line 3). This
  makes it a closed branch. We indicate this by the X beneath the branch that is
  closed, citing the source of the closure by line number.
- The rightward branch is a completed open branch given the decomposition at 3
  and the lack of negation of Q. Overall this makes the tree an open tree.

As the set gives us an open tree, it must be truth-functionally consistent. If
this is the case we should be able to determine the partial assignment in which
each set member is true. Given that Q is not negated the assignment of
consistency will contain Q but we have both P and ~P. This means there are two
possible assignments where the set is consistent: $P, Q$ and $\sim P, Q$. This
is confirmed by the truth-table:

```
P	Q				P	∨	~	P				Q
T	T					T						T     *
T	F					T						F
F	T					T						T     *
F	F					T						F
```

**Any time there is an open tree with a closed branch it will be the case that
the negated sentences of the closed branch will appear both as** $S$ and
$\sim S$ i**n the resultant assignment.**

Invoking the truth-table highlights the differences between the two techniques.
The values that are derived when we interpret a truth tree are not the
truth-functions of the set members but the truth-values for when they are
simultaneously true. With truth-tables in contrast, we are deriving the truth
functions for every possible truth-value assignment. In other words the values
derived from a truth tree correspond to the left hand side of the truth table
not the right hand side.

### Second example

The following is a truth tree for the set
${A & \sim B, C, \sim A \lor \sim B }$.

![basic-closed-tree 1.svg](/static/basic-closed-tree%201.svg)

### Interpretation

- The two molecular set members are decomposed. The disjunction (line 3) results
  in a branching tree. The conjunction (line 1) results in the continuation of
  the trunk.
- Both branches are completed making it a completed tree. As each branch is
  closed this is a closed tree.

As this is a closed tree, the set is not truth-functionally consistent. This is
confirmed by the truth table where there is no partial assignment where all set
members are true.

```
A	B	C				A	&	~	B				C				~	A	∨	~	C
T	T	T					F						T						F
T	T	F					F						F						T
T	F	T					T						T						F
T	F	F					T						F						T
F	T	T					F						T						T
F	T	F					F						F						T
F	F	T					F						T						T
F	F	F					F						F						T
```

## Truth tree decomposition rules

---

So far we have encountered the decomposition rules for conjunction (`&D`) and
disjunction (`vD`). We will now list all the rules. We will see that for each
rule, the decomposition either branches or does not branch which is to say that
each rule either has the shape of a conjunction or a disjunction (however the
permitted values of the specific disjuncts/conjuncts obviously differ in each
case). Moreover there is a parallel rule for the decomposition of the negation
of each of the main connectives and these rules rely on logical equivalences

### Negated negation decomposition: `~~D`

![negated-negation-decomposition-rule 2.svg](/static/negated-negation-decomposition-rule%202.svg)

Truth passes only if $P$ is true

### Conjunction decomposition: `&D`

![conjunction-decomposition-rule.svg](/static/conjunction-decomposition-rule.svg)

Truth passes only $P$ and $Q$ are both true.

### Negated Conjunction decomposition: `~&D`

![negated-conjunction-decomposition-rule.svg](/static/negated-conjunction-decomposition-rule.svg)

Truth passes if either $\sim P$ or $\sim Q$ is true. This rule is a consequence
of the equivalence between $\sim (P & Q)$ and $\sim P \lor \sim Q$ , the first
of DeMorgan’s Laws.

### Disjunction decomposition: `vD`

![disjunction-decomposition-rule.svg](/static/disjunction-decomposition-rule.svg)

Truth passes if either $P$or $Q$ are true.

### Negated Disjunction decomposition: `~vD`

![negated-disjunction-decomposition-rule.svg](/static/negated-disjunction-decomposition-rule.svg)

Truth passes if both $P$ and $Q$ are false. This rule is a consequence of the
equivalence between $\sim (P \lor Q)$ and $\sim P & \sim Q$, the second of
DeMorgan’s Laws.

### Conditional decomposition: `⊃D`

![conditional-decomposition-rule.svg](/static/conditional-decomposition-rule.svg)

Truth passes if either $\sim P$ or $Q$ are true. This rule is a consequence of
the equivalence between $P \supset Q$ and $\sim P \lor Q$ therefore this branch
has the shape of a disjunction with $\sim P$ , $Q$ as its disjuncts.

### Negated Conditional decomposition: `~⊃D`

Truth passes if both $P$ and $\sim Q$ are true. This is a consequence of the
equivalence between $\sim (P \supset Q)$ and $P & \sim Q$.

![negated-conditional-decomposition-rule.svg](/static/negated-conditional-decomposition-rule.svg)

### Biconditional decomposition: `≡D`

![biconditional-decomposition-rule.drawio(1).svg](/static/biconditional-decomposition-rule.drawio%281%29.svg)

Truth passes if either $P$ and $Q$ are true or $\sim P & \sim Q$ are true. This
is an interesting rule because it combines the disjunction and conjunction tree
shapes.

### Negated biconditional decomposition: `~≡D`

![negated-biconditional-decomposition-rule.drawio.svg](/static/negated-biconditional-decomposition-rule.drawio.svg)

Truth passes if either $P$ and $\sim Q$ is true or if $\sim P$ and $Q$ is true.

## Further examples and heuristics for complex truth trees

With truth-trees regardless of which order you decompose the set members, the
conclusion should always be the same. This said, there more are more efficient
ways than others to construct the trees. You want to find the route that will
demonstrate consistency or non-consistency with the shortest amount of work. The
following heuristic techniques followed in order, facilitate this:

1. Decompose those molecular sentences the decomposition of which does not
   produce new branches. In other words that are decompositions of double
   negations or pure conjunctions.
1. Perform those decompositions that will rapidly generate closed branches.
1. If neither (1) or (2) is applicable, decompose **the most complex** sentence
   first.

Here are some examples of these rules applied:

![complex-tree.svg](/static/complex-tree.svg)

Observe that here we don’t bother to decompose the sentence on line 1. This is
because, having decomposed the sentences on lines 2 and 3 we have arrived at a
closed tree. It is therefore unnecessary to go any further for if two sentences
in the set are inconsistent with each other, adding another sentence is not
going to change the overall assignment of inconsistency.

## Deriving properties other than logical consistency from truth trees

So far truth trees have been discussed purely in terms of logical consistency
however they can be used to derive all the other key truth-functional properties
of propositional logic. Given the foundational role of consistency to logic,
these properties are expressible in terms of consistency which is what makes
them amenable to formulation in terms of truth trees.

### Logical falsity

For a given finite set $\Gamma$, $\Gamma$ is logically consistent just if all of
its members can be true at once. Expressed in terms of truth trees, this is
equivalent to an open tree. Contrariwise, $\Gamma$ is inconsistent if it is not
possible for every member of the set to be true at once. This is the same as a
tree where all of the branches are closed (i.e. a closed tree).

When we wish to assess
[logical falsity](Logical%20truth%20and%20falsity.md#logical-falsity) we are not
focused on sets however, we are interested in a property of a sentence. However
we can easily construe single sentences as unit sets: sets with a single member.
With this in mind and the above accounts of consistency and logical falsity we
are equipped to express logical falsity in terms of truth-trees with the
following rule:

> A sentence $P$ is logically false if and only if the unit set ${ P }$ has a
> closed tree

A logically false sentence cannot be true on any assignment. This is the same
thing as an inconsistent set. Thus it will be represented in a truth tree as
inconsistency which is disclosed via a closed tree.

![logical-falsity-tree.svg](/static/logical-falsity-tree.svg)

### Logical truth

For a sentence $P$ to be
[logically true](Logical%20truth%20and%20falsity.md#logical-truth), there must
be no possible assignment in which $P$ is false. We express this informally by
saying _it is not possible to consistently deny $P$._ We know that in terms of
truth trees an inconsistent set is a closed tree therefore a unit set of ${ P }$
is logically true if ${ \sim P }$ is a closed tree. This is to say: if the
negation of $P$ is inconsistent.

> A sentence $P$ is logically true if and only if the set ${ \sim P }$ has a
> closed tree

### Logical indeterminacy

[Indeterminacy](Indeterminacy.md) follows from the two definitions above; we do
not require any additional apparatus. We recall that a sentence $P$ is logically
indeterminate just if it is neither logically true or logically false. Thus the
truth tree for an indeterminate sentence is straightforward:

> A sentence $P$ is logically indeterminate if and only if neither the set
>  ${ P }$ nor the set ${ \sim P }$ has a closed tree

This follows because a closed tree for  ${ P }$ means it is not logically false
and an open tree for ${ \sim P }$ means it is not logically true. So if it is
neither of these things, $P$ must be indeterminate.

### Logical equivalence

Recall that $P$ and $Q$ are [logically equivalent](Logical%20equivalence.md)
just if there is no truth assignment on which one is true and the other is
false. We know from the
[material biconditional shorthand](Corresponding%20material%20and%20biconditional.md#corresponding-material-biconditional)
that this state of affairs can be expressed as $P \equiv Q$ and that if this
compound sentence is true on every assignment then both simple sentences are
equivalent. But ‘true on every assignment’ is another way of saying _logically
true_ since there is no possibility of a false assignment. We already know what
logical truth looks like as a truth tree: it is a closed tree for the negation
of the sentence being tested. Therefore, to test the logical equivalence of two
sentences it is necessary to construct a truth tree for the negation of the
sentences conjoined by the biconditional (i.e. $\sim (P \equiv Q)$ )and see if
this results in a closed tree. If it does, the two sentences are logically
equivalent.

> Sentences $P$ and $Q$ are truth-functionally equivalent if and only if the set
> $\sim (P \equiv Q)$ has a closed tree

![logical-equivalence-tree.svg](/static/logical-equivalence-tree.svg)

### Logical entailment and validity

Let’s remind ourselves of the meaning of truth-functional
[entailment](Validity%20and%20entailment.md#entailment) and
[validity](Validity%20and%20entailment.md#validity) and the relation between the
two. $\Gamma$ $\vdash$ $P$ is true if and only if there is no truth-assignment
in which every member of $\Gamma$ is true and $P$ is false. Entailment is
closely related to validity; it is really just a matter of emphasis: we say that
$\Gamma$ are the premises and $P$ is the conclusion and that this is a valid
argument if there is no assignment in which every member of $\Gamma$ is true and
$P$ is false.

As with the previous properties, to express validity and entailment in terms of
truth trees we need to express these concepts in the language of logical
consistency. $\Gamma$ entails $P$ just if one cannot consistently assert
$\Gamma$ whilst denying $P$. This is to say that the set $\Gamma \cup {\sim P}$
is inconsistent. So we just need a closed truth tree for $\Gamma \cup {\sim P}$
to demonstrate the validity of this set.

> A finite set of sentences $\Gamma$ truth-functionally entails a sentence $P$
> if and only if the set $\Gamma \cup {\sim P}$ has a closed truth tree.

> An argument is truth functionally valid if and only if the set consisting of
> the premises and the negation of the conclusion has a closed truth tree.
