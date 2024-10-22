---
tags:
  - number-systems
  - computer-architecture
---

# Hexadecimal number system

Hexadecimal is the other main number system used in computing. It works in
tandem with the [binary number system](Binary_number_system.md) and provides an
easier and more accessible means of working with long sequences of binary
numbers.

## Hexadecimal place value

Unlike denary which uses base ten and binary which uses base two, hexadecimal
uses base 16 as its place value.

> Each place in a hexadecimal number represents a power of 16 and each place can
> be one of 16 symbols.

## Hexadecimal values

The table below shows the symbols comprising hexadecimal alongside their denary
and binary equivalents:

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

## Hexadecimal prefix

The custom is to prefix a hexadecimal number with `0x` to indicate that the
number is hexadecimal.

## Converting hexadecimal numbers

Using the previous table we can convert hexadecimal values to decimal.

For example we can convert `1A5` as follows, working from right to left:

$(5 \cdot 1 = 5) + (A \cdot 16 = 160) + (1 \cdot 256 = 256) = 421$

The process is quite easy: we get the n from $16^{n}$ based on the position of
the digit and then multiply this by the value of the symbol (1,2,...F):

$$
  16^{n} \cdot 1,2,...F
$$

As applied to `0x1A5`:

| $16^{3}$               | $16^{2}$              | $16^{1}$                   | $16^{0}$            |
| ---------------------- | --------------------- | -------------------------- | ------------------- |
| $1\cdot 16^{3} = 4096$ | $1\cdot 16^{2} = 256$ | $A (10)\cdot 16^{1} = 160$ | $5\cdot 16^{0} = 5$ |

Another example for `0xF00F`:

$(15 \cdot 4096 = 61440) + (0 \cdot 256 = 0) + (0 \cdot 16 = 0) + (15 \cdot 1 = 15) = 61455$

## Using hexadecimal to simplify binary numbers

Whilst computers themselves do not use the hexadecimal number system (everything
is binary), hexadecimal offers advantages for humans who must work with binary:

1. It is much easier to read a hexadecimal number than long sequences of binary
   numbers
2. It is easier to quickly convert binary numbers to hexadecimal than to convert
   binary numbers to decimal

Look at the following equivalences

| Number system   | Example 1           | Example 2           |
| --------------- | ------------------- | ------------------- |
| **Binary**      | 1111 0000 0000 1111 | 1000 1000 1000 0001 |
| **Hexadecimal** | F00F                | 8881                |
| **Decimal**     | 61,455              | 34,945              |

It is obvious that a pattern is maintained between the hexadecimal and binary
numbers and that this pattern is obscured by the decimal conversion. In the
first example the binary half-byte `1111` is matched by the hexadecimal `F00F`.

Mathematically comparing hex `F` and binary `1111`:

$$
  \textsf{1111} = ((1 \cdot 2^{3}) + (1 \cdot 2^{2}) + (1 \cdot 2^{1}) + (1 \cdot 2^{0})) \\
  = 8 + 4 + 2 + 1 \\
  = 15
$$

$$
  \textsf{F} = 15 \cdot 16^{0}  \\
  = 15
$$

![](static/hexadecimal-to-bytes.svg)

> Every four bits (or half byte) in binary corresponds to one symbol in
> hexadecimal. Therefore **a byte can be easily represented with two hexadecimal
> symbols, a 16-bit number can be represented with four hex symbols, a 32-bit
> number can represented with eight hex symbols and so on.**
