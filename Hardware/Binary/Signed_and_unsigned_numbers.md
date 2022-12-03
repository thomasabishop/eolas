---
categories:
  - Computer Architecture
tags: [binary, binary-encoding]
---

# Signed and unsigned numbers

In order to represent negative integers in binary we use signed numbers. **Signed binary** is basically binary where negative integers can be represented. **Unsigned binary** is standard binary without negative integers.

## Two's complement

Signed numbers can be implemented in binary in a number of ways. The differences come down to how you choose to encode the negative integers. A common method is to use "two's complement".

> The two's complement of a given binary number is its negative equivalent

For example the two's complement of $0101$ (binary 5) is $1011$. There is a simple algorithm at work to generate the complement for 4-bit number:

1. Take the unsigned number, and flip the bits. In other words: invert the values, so $0$ becomes $1$ and $1$ becomes $0$.
2. Add one

// INSERT DIAGRAM HERE

To translate a signed number to an unsigned number you flip them back and still add one:

// INSERT DIAGRAM HERE

### Advantages

The chief advantage of the two's complement technique of signing numbers is that its circuit implementation is no different from the adding of two unsigned numbers. Once the signing algorithm is applied the addition can be passed through an [adder](/Electronics/Digital_Circuits/Half_adder_and_full_adder.md) comp
