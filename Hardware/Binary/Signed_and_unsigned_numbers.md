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

The chief advantage of the two's complement technique of signing numbers is that its circuit implementation is no different from the adding of two unsigned numbers. Once the signing algorithm is applied the addition can be passed through an [adder](/Electronics/Digital_Circuits/Half_adder_and_full_adder.md) component without any special handling or additional hardware.

Let's demonstrate this with the following addition:

$$
    7 + -3 = 4
$$

First we convert $7$ to binary: $0111$.

Then we convert $-3$ to unsigned binary, by converting $3$ to its two's complement

$$
0011 \rArr 1100 \rArr 1101
$$

Then we simply add the binary numbers regardless of whether they happen to be positive or negative integers in decimal:

$$
0111 \\
1101 \\
====\\
0100
$$

Which is 4.

The ease by which we conduct signed arithmetic with standard hardware contrasts with alternative approaches to signing numbers. An example of another approach is **signed magnitude representation**. A basic implemetation of this would be to say that for a given bit-length (6, 16, 32...) if the [most significant bit](/Electronics/Digital_Circuits/Half_adder_and_full_adder.md#binary-arithmetic)
