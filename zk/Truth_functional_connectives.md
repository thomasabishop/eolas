---
categories:
  - Logic
tags: [propositional-logic]
---

# Truth-functional connectives

Propositions generated from other (simple) propositions by means of
propositional connectives are
[compound propositions](Atomic_and_molecular_propositions.md).

We know that
[logically determinant](Logical_indeterminacy.md)
propositions express a truth value. When simple propositions are joined with a
connective to make a compound proposition they also have a truth value. This is
determined by the nature of the connective and the truth value of the
constituent propositions. We therefore call connectives of this nature truth
_functional_ connectives since the **truth value of the compound is a function
of the truth values of its components**.

> A propositional connective is used truth-functionally if and only if it is
> used to generate a compound proposition from one or more propositions in such
> a way that the truth value of the generated compound is wholly determined by
> the truth-values of those one or more propositions from which the compound is
> generated, no matter what the truth values may be.

Each truth-functional connective has a characteristic **truth table**. This
discloses the conditions under which the constituent propositions have a given
truth value when combined with one or more connectives.

We shall now review each of the truth-functional connectives in detail.

### Conjunction

Conjunction is equivalent to the word AND in natural language. We use $\land$ as
the symbol for this connective.

A molecular proposition joining two conjuncts P and Q is true iff both conjuncts
are true and false otherwise:

```
P	Q				P	&	Q
T	T					T
T	F					F
F	T					F
F	F					F
```

### Disjunction

Conjunction is equivalent to the word OR in natural language. We use `v` as the
symbol of this connective.

A molecular proposition joining two disjuncts P and Q is true if either disjunct
is true or if both disjuncts are true and false otherwise. This corresponds to
the inclusive sense of OR in natural language.

```
P	Q				P	∨	Q
T	T					T
T	F					T
F	T					T
F	F					F
```

### Negation

In contrast to the two previous connectives, negation is a unary connective not
a binary connective. We use `~` to symbolise negation. It does not join two or
more propositions, it applies to one proposition as a whole. This can be a
simple proposition or a complex proposition. It simply negates the truth-value
of whichever proposition it is applied to. Hence applied to P, it is true if P
is false. And if P is false, it is true when P is true. !

```
P			~	P
T			F
F			T
```

### Material conditional (a.k.a implication)

The material conditional approximates the meaning expressed in natural language
when we say _if_ such-and-such is the case _then_ such-and-such will the case.
Another way of expressing the sense of the material conditional is to say that
**P** implies **Q.**

```
If it rains today the pavement will be wet.
```

We call the proposition that expresses the 'if' proposition the **antecedent**
and the proposition that expresses the 'then' statement the **consequent**. The
symbol we use to represent the material conditional is `⊃` although you may see
`→` used as well.

The truth table is as follows:

```
P	Q				P	⊃	Q
T	T					T
T	F					F
F	T					T
F	F					T
```

The material conditional is perhaps the least intuitive of the logical
connectives. The first case (TT) closely matches what we expect the connective
to mean: it has rained so the pavement is wet. The antecedent is true and
therefore the consequent is true. This chimes with what we tend to mean by 'if'
in natural language. In the second case (TF) it also makes sense: the complex
proposition is false because it rained and the pavement wasn't wet: this negates
the truth of the expression. The final case (FF) is also straight forward. It
didn't rain therefore the pavement wasn't wet, thus the overall assertion that
rain implies wet pavements is retained.

FT is less intuitive:

```
It did not rain today. The pavement was wet.
```

To some degree one just has to take these statements as axioms, whether or not
they have intuitive sense is a secondary, more philosophical question. The
semantic issues arise because we tacitly assume the material conditional to be a
causal connective: there is something about the nature of **P** that _engenders_
or _brings about_ **Q** but causality is not a logical concern.

If we instead just focus on the simple propositions that comprise the truth
value it is more plausible. In the case of FT we can say it didn't rain yet the
pavement was wet does not stop the pavement being wet when it rains. The fact
that I can pour a beer on the pavement thereby making it wet doesn't stop or
render false the idea that the rain can also make the pavement wet. The same
explanation covers the FF case: it hasn't rained and so the pavement is not wet
does not contradict the assertion that when it rains the pavement will be wet.

Things are elucidated when we look at an equivalent expression of P ⊃ Q, ~P v Q:

```
P	Q				~	P	∨	Q
T	T						T
T	F						F
F	T						T
F	F						T
```

A disjunction is true whenever either disjunct is true so when both are false
the overall expression is false, the same as with FT and FF with the material
conditional.

### Material biconditional (a.k.a equivalence)

The material biconditional equates to the English expression 'if and only if',
as a conditional connective it therefore avoids some of the perplexity aroused
by its material cousin. In this scenario both antecedent and consequent have to
be true for the overall expression to be true. If either is false the complex
proposition is false. Other ways of expressing the semantics of this connective
is to say that one proposition implies the other or that **P** and **Q** are
equivalent.

```
If and only if James studies every day he will pass the exam.
```

There is no possibility in which James passes the exam and has not studied every
day. If he studies for three out of the seven days leading up to the exam he
will not pass. Alternatively, there is no possibility that James studied every
day yet failed the exam. The antecedent and consequent are locked, as indicated
by the truth-table:

```
P	Q				P	≡	Q
T	T					T
T	F					F
F	T					F
F	F					T
```

The last condition (FF) maybe requires some explanation: if he has not studied
every day then he cannot have passed the exam. Therefore, to say that he will
pass iff he studies every day is rendered true.

## Combinations of truth-functional connectives

---

So far we have applied connectives to simple propositions. In so doing we
generate complex propositions. However propositions and connectives are
inherently generative: we can build more complex expressions from less complex
parts, using more than one type of connective or several different connectives
to make larger complex propositions and express more detailed logical conditions
ans statements about the world.

For example the proposition:

```
Socrates was either a philosopher or a drinker but he wasn't a politician.
```

Can be expressed with greater logical clarity as:

```
Socrates was a philosopher or Socrates was a drinker and Socrates was not a politician.
```

Using P for 'Socrates was a philosopher', Q for 'Socrates was a drinker' and R
for 'Socrates was a politician' we can express this symbolically as:

```
(P v Q) & ~R
```

Which has the truth table:

```
P	Q	R				(	P	∨	Q	)	&	~	R
T	T	T									F
T	T	F									T
T	F	T									F
T	F	F									T
F	T	T									F
F	T	F									T
F	F	T									F
F	F	F									F
```

Let's walk through each case where S stands for the overall proposition.

1. S is false if Socrates was a philosopher, a drinker and a politician.
1. **S is true if Socrates was a philosopher, a drinker but not a politician.**
1. S is false if Socrates was a philosopher, a politician but not a drinker.
1. **S is true if Socrates was a philosopher but not a drinker or politician.**
1. S is false if Socrates was not a philosopher but was a drinker and politician
1. **S is true if Socrates was not a philosopher or politician but was a
   drinker.**
1. S is false if Socrates was neither a philosopher or drinker but was a
   politician.
1. S is false if Socrates was neither a philosopher, drinker, or politician.

If we look just at the true cases for simplicity, it becomes obvious that the
truth value of the whole is a function of the truth-values of the parts.

At the highest level of generality the proposition is a conjunction with two
disjuncts: `P v Q` and `~R` . Therefore, for the proposition to be true both
conjuncts must be true. The first conjunct is true just if one of the
subordinate disjuncts is true (Socrates is either a philosopher, a drinker, or
both). The second conjunct is true just if Socrates is not a politician. Thus
there is only one variation for the second conjunct (not being a politician) and
two variations for the first conjunct (being a drinker/being a philosopher)
hence there are three cases where the overall proposition is true.

### Logical equivalence

Once we start working with complex propositions with more than one
truth-functional connective it becomes clear that the same proposition expressed
in natural language can be expressed formally more than one way and thus that in
logical terms, both formal expressions are equivalent. We can prove this
equivalence by comparing truth tables.

For example the proposition:

```
I am going to the shops and the gym.
```

Can obviously be expressed formally as:

```
P & Q
```

But also as:

```
~ (~P v ~Q)
```

And we know this because the truth-tables are identical:consistency

```
P	Q				P	&	Q
T	T					T
T	F					F
F	T					F
F	F					F
```

```
P	Q			~	(	~	P	∨	~	Q	)
T	T			T
T	F			F
F	T			F
F	F			F
```

Another example of equivalent expressions:

```
Neither Watson or Sherlock Holmes is fond of criminals
```

The first formalisation:

```
~P & ~Q
```

Equivalent to:

```
~(P v Q)
```

Again the truth-tables for verification:

```
P	Q				~	P	&	~	Q
T	T						F
T	F						F
F	T						F
F	F						T
```

`~P & ~Q`

```
P	Q			~	(	P	∨	Q	)
T	T			F
T	F			F
F	T			F
F	F			T
```

### Important equivalences

The example above is a key equivalence that you will encounter a lot especially
when deriving formal proofs. It goes together with another one. We have noted
them both below for future reference:

```
~P & ~Q = ~P v ~Q
```

```
~P v ~Q = ~(P & Q)
```

## Enforcing binary connectives through bracketing

If we had a proposition of the form

```
Socrates is man, is mortal and a philosopher.
```

We could not write this as:

```
P & Q & R
```

This would not be a well-formed proposition because at most truth functional
connectives can only connect two simple propositions. It would not be possible
to generate truth conditions for this proposition in its current form. Instead
we introduce brackets to enforce a binary grouping of simple propositions. In
this instance, the placement of the brackets does not affect the accurate
interpretation of the truth conditions of the compound, so the following two
formalisations are equivalent:

```
(P & Q) & R

P & (Q & R)
```
