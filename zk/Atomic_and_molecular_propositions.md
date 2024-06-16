---
tags:
  - propositional-logic
  - logic
---

# Atomic and molecular propositions

Propositions are expressions **that have truth values**, either true or false.

We call a proposition which does not contain a logical connective (or
'sentential connective') a **simple proposition**.

We call a proposition that does contain a logical connective, a **compound
proposition**.

Simple propositions are represented within a formal language of sentential logic
with a single character, customarily _P_ or _Q_. When we refer to the formal
representation of such propositions in our system of sentential logic (SL) we
call them **atomic propositions**.

Compound propositions consist in single characters for each atomic proposition
that they comprise, combined with a symbol for the logical connective. When we
refer to the formal representation of such propositions in SL we call them
**molecular propositions**.

### Demonstration

Atomic proposition:

```
Socrates was a philosopher.
(P)
```

Molecular proposition:

```
Socrates was a philosopher and a drinker.
(P & Q)
```

Connectives in natural language often obscure the logical basis of the
proposition being expressed (where such a proposition contains a proposition,
i.e. excluding propositions that are _logically indeterminate_. The molecular
proposition is above is such an example. In this instance the proposition can be
expressed more precisely as:

```
Socrates was a philosopher and Socrates was a drinker.
```

Where propositions in natural language cannot be elucidated by the addition of
implied logical connectives in the manner above, they must be treated not as
molecular propositions but as atomic proposition. Example:

```
Two splashes of gin and a few drops of vermouth make a great martini.
```

If we were to formalise this as:

```
Two splashes of gin make a great martini and a few drops of vermouth make a great martini.
```

We would lose the sense of the original and we would not be uncovering any logic
that is in the original.
