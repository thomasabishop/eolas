---
tags:
  - Logic
  - propositional-logic
---

## Corresponding material conditional to show validity

To demonstrate *truth-functional validity* we have to construct a truth-table which contains each of the premises and the conclusion and then review each row to see if there is an assignment where both the premises and the conclusion are true.

A simpler way to get the same result is to invoke the corresponding material conditional. Here we concatenate the premises using conjunction and then join them to the conclusion using the material conditional, which then becomes the main connective. We then populate the truth table for this compound sentence. If it is logically true, the argument is valid.

### Demonstration

We will demonstrate with the following set:

$$ {P \equiv Q, P \lor Q, P &Q } $$

````
P	Q				P	≡	Q					P	∨	Q					P	&	Q	
T	T					T							T							T		  *
T	F					F							T							F		
F	T					F							T							F		
F	F					T							F							F
````

````
P	Q				(	(	P	≡	Q	)	&	(	P	∨	Q	)	)	≡	(	P	&	Q	)	
T	T																	T						
T	F																	T						
F	T																	T						
F	F																	T
````

We see above that the main connective, the material conditional returns true for every truth-functional assignment. In other words it is logically true. Consequently the argument is valid

## Corresponding material biconditional

We can use the corresponding material biconditional as a shorthand for demonstrating logical equivalence between two sentences.

For two putatively equivalent sentences $P$ and $Q$, $P$ and $Q$ are logically equivalent if the compound sentence $P \equiv Q$ is logically true.
