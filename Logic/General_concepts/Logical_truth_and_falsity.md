---
categories:
  - Logic
tags: [propositional-logic]
---

# Logical truth and falsity

We say of certain sentences that they are logically true or logically false.

## Logical falsity

### Informal definition

A sentence is logically false if and only if **it is not possible for the sentence to be true**. The sentence itself cannot be consistently asserted.

**Demonstration**

```
There is a country that is not a country.
Apples are fruits and apples are not fruits
```

Neither sentence can be true because the truth of the first clause is contradicted by the second. By the principle of [consistency](/Logic/General_concepts/Logical_consistency.md), it is not possible for both clauses to be true at once therefore the sentence, overall has the truth value of falsity

The examples above are simple sentences but logical falsity also applies to compound sentences and it is actually easier to see the logical principle at work with compound sentences since once simple sentence of the compound contradicts the other such that the overall sentence cannot be consistently asserted:

```
It is raining and it is not raining.
```

### Formal definition

> A sentence P is truth-functionally false if and only if P is false on every truth-value assignment

### Formal expression

$$ P \& \sim P $$

### Truth-table

| $P$ | $P \& \sim P$ |
| --- | ------------- |
| T   | F             |
| T   | F             |

## Logical truth

### Informal definition

A sentence is logically true if and only if it is not possible for the sentence to be false. The sentence itself cannot be consistently denied.

**Demonstration**

```
A rose is a rose.
Today is Tuesday unless today is not Tuesday.
```

Regardless of any facts obtaining in the world, these sentences cannot be false.

As with logically false sentences, logical truth can also apply to compound sentences:

```
It is Monday and Monday is a day of the week.
```

### Formal definition

> A sentence P is truth-functionally true if and only if P is true on every truth-value assignment

$$ P \lor \sim P$$

### Truth-table

| $P$ | $P \lor \sim P$ |
| --- | --------------- |
| T   | T               |
| F   | T               |

### Consequences

The existence of logically false and logically true sentences affects the validity and soundness of arguments in which they are used. These are technicalities that have philosophically interesting consequences.

- If an argument contains premises which are logically false than this argument will perforce be valid. This is because one cannot consistently assert the premises and deny the conclusion which is the definition of validity. However the _reason_ why one cannot consistently assert the premises and deny the conclusions is because one cannot consistently assert the premises - they conflict with each other. Furthermore as the argument contains false premises, it cannot be sound.

  ```
  (P1) Russia is a country.
  (P2) Russia is not a country
  (P3) All countries have languages.
  ____________________________________________
  (C) Russian is a language.
  ```

- Any argument with a logically true conclusion is valid. Because the conclusion cannot be consistently denied it follows that we cannot consistently assert the premises _and_ deny the conclusion. Whether or not the argument is sound remains an open question however. If the premises happen to be true then the argument will be sound on the strength of the conclusion being logically true but if the premises are false it will be unsound regardless of the truth of the conclusion.

  ```
  (P1) Horses have legs.
  (P2) Animals with legs can move.
  ____________________________________________
  (C) A horse is a horse
  ```
