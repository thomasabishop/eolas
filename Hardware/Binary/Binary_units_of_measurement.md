---
title: Binary units of measurement
categories:
  - Hardware
  - Mathematics
tags: [bits, binary]
---

# Binary units of measurement

A single place or symbol in a decimal number is called a **digit**. For example the number 343 is a number containing three digits. A digit can be any numeral through 0-9.

The equivalent entity in the [binary number system](/Hardware/Binary/The_binary_number_system.md) is the **bit**. For example the binary number 110 has three bits. A bit can only have one of two values in contrast to a digit which can have one of ten values: 0 or 1.

## Sequences of bits

### Informational complexity

The informational complexity of digit is much larger than a bit: it can represent one of 10 states whereas a bit can only represent one of two states.

Consider how much data can be stored in a three digit digital number compared to a three bit binary number. For the decimal number each digit can represent one of ten states, hence the total number of unique states is equal to $3^{10} (59049)$:

```
001
002
003
...
010
011
012
013
...
```

With the binary number we have $3^{10} (59049)$
Therefore to express greater complexity we work with sequences of bits.

The standard **base sequence** of bits is called a **byte**. This is a binary number comprising **eight bits**. For example the number `11001110` is a byte equivalent to 206 in decimal.

Every time we add a bit to the sequence of bits comprising a binary number we increase complexity of the number by a factor of 2, i.e. `1, 2, 4, 8, 16, 32, 64, 128` etc.
