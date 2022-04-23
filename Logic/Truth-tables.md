---
tags:
  - Logic
  - propositional-logic
  - recursion
  - truth-tables
---

We are already familiar with truth-tables from the previous entry on the *truth-functional connectives* and the relationship between sentences, connectives and the overall truth-value of a sentence. Here we will look in further depth at how to build truth-tables and on their mathematical relation to binary truth-values. We will also look at examples of complex truth-tables for large compound expressions and the systematic steps we follow to derive the truth conditions of compound sentences from their simple constituents.

## Formulae for constructing truth-tables

For any truth-table, the number of rows it will contain is equal to $2n$ where:

* $n$ stands for the number of sentences
* $2$ is the total number of possible truth values that the sentence may have: true or false.

When we count the number of sentences, we mean atomic sentences. And we only count each sentence once. Hence for a compound sentence of the form $(\sim B \supset C) & (A \equiv B)$, $B$ occurs twice but there are only three sentences: $A$, $B$, and $C$.

Thus for the sentence $P & Q$ ,we have two sentences so $n$ is 2 which equals 4 rows (2 x 2):

````
P	Q				P	&	Q	
T	T					T		
T	F					F		
F	T					F		
F	F					F
````

For the sentence $(P \lor Q) & R$ we have three sentences so $n$ is 3 which equals 8 rows (2 x 2 x 2):

````
P	Q	R				(	P	∨	Q	)	&	R	
T	T	T									T		
T	T	F									F		
T	F	T									T		
T	F	F									F		
F	T	T									T		
F	T	F									F		
F	F	T									F		
F	F	F									F
````

For the single sentence $P$ we have one sentence so $n$ is 1 which equals 2 rows (2 x 1):

````
P			P
T			T
F			F
````

This tells us how many rows the truth-table should have but it doesn't tell us what each row should consist in. In other words: how many Ts and Fs it should contain. This is fine with simple truth-tables since we can just alternate each value but for truth-tables with three sentences and more it is easy to make mistakes.

To simplify this and ensure that we are including the right number of possible truth-values we can extend the formula to $2n^-i$. This formula tells us how many groups of T and F we should have in each column.

We can already see that there is a pattern at work by looking at the columns of the truth tables above. If we take the sentence $(P \lor Q) & R$ we can see that for each sentence:

* $P$ consists in two sets of ${\textsf{T,T,T,T}}$ and ${\textsf{F,F,F,F}}$ with **four** elements per set
* $Q$ consists in four sets of ${\textsf{T,T}}$ , ${\textsf{F,F}}$, ${\textsf{T,T}}$ , ${\textsf{F,F}}$ with **two** elements per set
* $R$ consists in eight sets of ${\textsf{T}}$, ${\textsf{F}}$, ${\textsf{T}}$, ${\textsf{F}}$, ${\textsf{T}}$, ${\textsf{F}}$, ${\textsf{T}}$, ${\textsf{F}}$ with **one** element per set.

If we work through the formula we see that it returns 4, 2, 1:

$$\begin{equation} \begin{split} 2n^-1 = 3 -1 \\ = 2 \\ = 2 \cdot 2 \\ = 4 \end{split} \end{equation}$$
$$
\\begin{equation} \begin{split} 2n^-2 = 3 - 2 \\ = 1 \\ = 2 \cdot 1 \\ = 2 \end{split} \end{equation}
$$
$$
\\begin{equation} \begin{split} 2n^-3 = 3 - 3 \\ = 0 \\ = 2 \cdot 0 \\ = 1 \end{split} \end{equation}
$$

## Truth-table concepts

### Recursion

When we move to complex truth-tables with more than one connective we realise that truth-tables are recursive. The truth-tables for the truth-functional connectives provide all that we need to determine the truth-values of complex sentences:

 > 
 > The core truth-tables tell us how to determine the truth-value of a molecular sentence given the truth-values of its [immediate sentential components](Syntax%20of%20sentential%20logic.md). And if the immediate sentential components of a molecular sentence are also molecular, we can use the information in the characteristic truth-tables to determine how the truth-value of each immediate component depends n the truth-values of *its* components and so on.

### Truth-value assignment

 > 
 > A truth-value assignment is an assignment of truth-values (either T or F) to the atomic sentences of SL.

When working on complex truth tables, we use the truth-assignment of atomic sentences to count as the values that we feed into the larger expressions at a higher level of the sentential abstraction.

### Partial assignment

We talk about partial assignments of truth-values when we look at one specific row of the truth-table, independently of the others. The total set of partial assignments comprise all possible truth assignments for the given sentence.

## Working through complex truth-tables

The truth-table below shows all truth-value assignments for the sentence $(\sim B \supset C) & (A \equiv B)$ :

````
A	B	C				(	~	B	⊃	C	)	&	(	A	≡	B	)	
T	T	T					F	T	T	T		T		T	T	T		
T	T	F					F	T	T	F		T		T	T	T		
T	F	T					T	F	T	T		F		T	F	F		
T	F	F					T	F	F	F		F		T	F	F		
F	T	T					F	T	T	T		F		F	F	T		
F	T	F					F	T	T	F		F		F	F	T		
F	F	T					T	F	T	T		T		F	T	F		
F	F	F					T	F	F	F		F		F	T	F
````

As with algebra we work outwards from each set of brackets. The sequence for manually arriving at the above table would be roughly as follows:

1. For each sentence letter, copy the truth value for it in each row.
1. Identify the connectives in the atomic sentences and the main overall sentence.
1. Work out the truth-values for the smallest connectives and sub-compound sentences. The first should always be negation and then the other atomic connectives.
1. Feed-in the truth-values of the atomic sentences as values into the main connective, through a process of elimination you then reach the core truth-assignments:
