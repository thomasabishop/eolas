---
categories:
  - Logic 
tags: [propositional_logic]
---

Sentences or propositions (we will use 'sentences' for consistency) are expressions **that have truth values**, either true or false.

We call a sentence which does not contain a logical connective (or 'sentential connective') a **simple sentence**.

We call a sentence that does contain a logical connective, a **compound sentence**.

Simple sentences are represented within a formal language of sentential logic with a single character, customarily *P* or *Q*. When we refer to the formal representation of such sentences in our system of sentential logic (SL) we call them **atomic sentences**.

Compound sentences consist in single characters for each atomic sentence that they comprise, combined with a symbol for the logical connective. When we refer to the formal representation of such sentences in SL we call them **molecular sentences**.

### Demonstration

Atomic sentence: 

````
Socrates was a philosopher.
(P)
````

Molecular sentence: 

````
Socrates was a philosopher and a drinker.
(P & Q)
````

Connectives in natural language often obscure the logical basis of the proposition being expressed (where such a sentence contains a proposition, i.e. excluding sentences that are *logically indeterminate*. The molecular sentence is above is such an example. In this instance the sentence can be expressed more precisely as:

````
Socrates was a philosopher and Socrates was a drinker.
````

Where sentences in natural language cannot be elucidated by the addition of implied logical connectives in the manner above, they must be treated not as molecular sentences but as atomic sentence. Example:

````
Two splashes of gin and a few drops of vermouth make a great martini.
````

If we were to formalise this as:

````
Two splashes of gin make a great martini and a few drops of vermouth make a great martini.
````

We would lose the sense of the original and we would not be uncovering any logic that is in the original.
