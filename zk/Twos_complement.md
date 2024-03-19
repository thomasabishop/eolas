---
id: gktb
title: Two's complement
tags: []
created: Tuesday, March 19, 2024
---

# Two's complement

## Summary

- _Two's complement_ is a method for representing signed numbers (negative
  integers) in binary.

- The two's complement of a given binary integer is its negative equivalent.

## Detail

### Procedural steps

Two's complement divides the available word length (see
[[Binary_encoding|binary encoding]]) into two subsets: one for negative integrs
and one for positive integers.

Take the binary encoding of decimal five (`0101`). Its complement is `1011`.

The procedure for deriving the complement is as follows.

To derive the complement of an unsigned number:

1. Take the unsigned number and invert its digits: `0` becomes `1`, `1` becomes
   `0`
2. Add one

![](/img/unsigned-to-signed.png)

To derive the unsigned equivalent of a signed number

### Formal expression

## Applications

## Related notes

[[Signed_and_unsigned_numbers|signed_and_unsigned_numbers]]
