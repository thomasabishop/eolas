---
tags:
  - Theory_of_Computation
  - Mathematics
  - binary
---

## Decimal (denary) number system

Binary is a **positional number system**, just like the decimal number system. This means that the value of an individual digit is conferred by its position relative to other digits. Another way of expressing this is to say that number systems work on the basis of **place value**.

In the decimal system the columns increase by **powers of 10**. This is because there are ten total integers in the system:

$1, 2, 3, 4, 5, 6, 7, 8, 9$

When we have completed all the possible intervals between $0$ and $9$, we start again in a new column.

The principle of counting in decimal: 

![denary.gif](../../img/denary.gif)

Thus each column is ten times larger than the previous column:

* Ten \[$10^1$\] is ten times larger than one \[$10^0$\]
* A hundred \[$10^2$\] is ten times larger than ten \[$10^1$\]

We use this knowledge of the exponents of the base of 10 to read integers that contain multiple digits (i.e. any number greater than 9).

Thus 264 is the sum of

* $4 * (10^0)$
* $6 * (10^1)$
* $2 * (10^2)$

## Binary number system

In the binary number system, the columns increase by powers of two. This is because there are only two integers: 0 and 1. As a result, you are required to begin a new column every time you complete an interval from 0 to 1.

So instead of:

$$ 10^0, 10^1, 10^2, 10^3 ... (1, 10, 100, 1000) $$

You have:

$$ 2^0, 2^1, 2^2, 2^3, 2^4... (0, 2, 4, 8, 16) $$

When counting in binary, we put zeros as placeholders in the columns we have not yet filled. This helps to indicate when we need to begin a new column. Thus the counting sequence:

$$ 1, 2, 3, 4 $$

is equal to:

$$ 0001, 0010, 0011, 0100 $$

Counting in binary:

![binary.gif](../../img/binary.gif)

## Relation to Turing Machines

It's obvious that there is a clear relation between the binary number system and Turing Machinees, since in their most basic instance, Turing Machines work with ones and zeros. In order for us to get Turing Machines to compute digital numbers we only need to convert from decimal to binary.

### Example decimal to binary conversion

Let's convert 6 and into binary:

If we have before us the binary place values ($1, 2, 4, 8$). We know that 6 is equal to: **1 in the two column and 1 in the 4 column → 110**

More clearly:

![](../../img/Pasted_image_20220319135558.png)

And for comparison:

![](../../img/Pasted_image_20220319135805.png)

Or we can express the binary as:

$$ (1 * 2) + (1 * 4) $$

Or more concisely as:

$$ 2^1 + 2^2 $$

### Another example

Let's convert 23 into binary:

![](../../img/Pasted_image_20220319135823.png)

![](../../img/binary_to_denary.gif)
