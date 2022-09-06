---
categories:
  - Mathematics
tags: [logic]
---

### Soundness

Recall that in the definition of [deductive validity](Validity%20and%20entailment.md#validity) we do not say: an argument is valid iff if the premises _are true_ and the conclusion _is true_. We say _if it is possible for the premises to be true_. This is important: we are not interested in the actual truth of the premises or the conclusion.

#### Demonstration

Therefore this argument is valid:

```
(P1) Oranges are the same colour as bananas.
(P2) Bananas are yellow.
____________________________________________
(C) Oranges are yellow.
```

Of course oranges are not yellow but _were_ (P1) true, then given (P2), the conclusion must also be true.

This argument is also valid:

```
(P1) Oranges are the same colour as carrots.
(P2) Carrots are orange.
____________________________________________
(C) Oranges are orange in colour.
```

The difference here is that the premises happen to be true and, given that the argument is valid, the conclusion must also be true. What we have defined here is **soundness**: the argument is said to be sound as well as valid. This is an additional and stronger criterion of evaluation.

> An argument is sound if and only if it is deductively valid and all it's premises are true.

We must not forget that truth alone is not the sole condition for soundness. We can have arguments whose conclusion and premises are all true without the argument being sound:

```
(P1) London is the capital of the United Kingdom
(P2) The capital of the United Kingdom is in the southern part of the United Kingdom.
    Can
(P3) Cambridge is not the capital of the United Kingdom
____________________________________________
(C) London is south of Cambridge
```

All sentences are true here but the argument is not deductively valid: the premises are all true but the conclusion is false.

We can also have arguments which are valid but which are not sound:

```
(P1) Vitamin C prevents colds.
(P2) Vitamin C does not prevent colds.
____________________________________________
(C) Vitamin C is harmless
```

This argument is valid because we cannot consistently assert the premises and deny the conclusion. In either case, the conclusion can be said to follow from the premises. The problem is that we cannot consistently assert both premises: it is not possible for both sentences to be true at the same time.
