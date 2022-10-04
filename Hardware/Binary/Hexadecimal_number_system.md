---
title: Hexadecimal number system
categories:
  - Computer Architecture
  - Mathematics
tags: [number-systems]
---

# Hexadecimal number system

Hexadecimal is the other main number system used in computing. It works in tandem with the [binary number system](/Hardware/Binary/Binary_number_system.md) and provides an easier and more accessible means of working with long sequences of binary numbers.

## Hexadecimal place value

Unlike denary which uses base ten and binary which uses base two, hexadecimal uses base 16 as its place value.

> Each place in a hexadecimal number represents a power of 16 and each place can be one of 16 symbols.

## Hexadecimal values

The table below shows the symbols comprising hexadecimal alongside their denary and binary equivalents:

| Hexadecimal | Decimal | Binary |
| ----------- | ------- | ------ |
| 0           | 0       | 0000   |
| 1           | 1       | 0001   |
| 2           | 2       | 0010   |
| 3           | 3       | 0011   |
| 4           | 4       | 0100   |
| 5           | 5       | 0101   |
| 6           | 6       | 0110   |
| 7           | 7       | 0111   |
| 8           | 8       | 1000   |
| 9           | 9       | 1001   |
| A           | 10      | 1010   |
| B           | 11      | 1011   |
| C           | 12      | 1100   |
| D           | 13      | 1101   |
| E           | 14      | 1110   |
| F           | 15      | 1111   |

This table shows the raw value of each hexadecimal place value:

| $16^{3}$ | $16^{2}$ | $16^{1}$ | $16^{0}$ |
| -------- | -------- | -------- | -------- |
| 4096     | 256      | 16       | 1        |

## Converting hexadecimal numbers

Using the previous table we can convert hexadecimal values to decimal.

For example we can convert `1A5` as follows, working from right to left:

$(5 \cdot 1 = 5) + (A \cdot 16 = 160) + (1 \cdot 256 = 256) = 421$

The process is quite easy: we get the n from $16^{n}$ based on the position of the digit and then multiply this by the value of the symbol (1,2,...F):

$$
  16^{n} \cdot 1,2,...F
$$

As applied to `1A5`:

| $16^{2}$              | $16^{1}$                   | $16^{0}$            |
| --------------------- | -------------------------- | ------------------- |
| $1\cdot 16^{2} = 256$ | $A (10)\cdot 16^{1} = 160$ | $5\cdot 16^{0} = 5$ |

Another example for `F00F`:

$(15 \cdot 4096 = 61440) + (0 \cdot 256 = 0) + (0 \cdot 16 = 0) + (15 \cdot 1 = 15) = 61455$

// TODO: Relation to binary and bytes
