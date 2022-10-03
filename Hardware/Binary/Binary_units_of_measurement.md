---
title: Binary units of measurement
categories:
  - Computer Architecture
  - Mathematics
tags: [bits, binary]
---

# Binary units of measurement

A single place or symbol in a decimal number is called a **digit**. For example the number 343 is a number containing three digits. A digit can be any numeral through 0-9.

The equivalent entity in the [binary number system](/Hardware/Binary/The_binary_number_system.md) is the **bit**. For example the binary number 110 has three bits. A bit can only have one of two values in contrast to a digit which can have one of ten values: 0 or 1.

## Sequences of bits

### Informational complexity

The informational complexity of digit is much larger than a bit: it can represent one of 10 states whereas a bit can only represent one of two states.

We can think of how much data can be stored in a number in terms of the total number of unique arrangemnets of bits or digits. With this in mind, compare a two digit digital number to a two bit binary number. For the decimal number each digit can represent one of ten states, hence the total number of unique states is equal to $2^{10} (1024)$:

With the binary number we have $2^{2} (4)$, giving us far fewer possible unique states. They are so few we can easily list them:

```
00
01
10
11
```

### Bytes

In order to express larger binary numbers and greater complexity we work with sequences of bits.

The standard **base sequence** of bits is called a **byte**. This is a binary number comprising **eight bits**. For example the number `11001110` is a byte equivalent to 206 in decimal.

A byte allows for a complexity of up to 256 possible states: $2^{8} = 256$

## Metric units: kilobytes, megabytes etc

Having established that the core quantity of information is the byte, the convention is to apply the [standard metric prefixes](/Electronics/Physics_of_electricity/Prefixes_for_units_of_electrical_measurement.md) to the byte to establish units:

| Prefix | Symbol | Expression as base ten exponent | Value             | English word |
| ------ | ------ | ------------------------------- | ----------------- | ------------ |
| Terra- | T      | $10^{12}$                       | 1,000,000,000,000 | trillion     |
| Giga-  | G      | $10^9$                          | 1,000,000,000     | billion      |
| Mega-  | M      | $10^6$                          | 1,000,000         | million      |
| Kilo-  | k      | $10^3$                          | 1,000             | thousand     |

Hence 2MB is two million bytes, 4kb is four thousand bytes etc.

Whilst the metric prefixes are conventionally used to refer to aggregates of bytes, they are only approximate values due to the fact that metric is base ten whereas bytes are base two. Hence 1MB is not 1,000,000 bytes it is 1,048,576 bytes.

This is usually fine as a shorthand but an accurate representation of byte values is as follows:

| Prefix | Symbol | Expression as base two exponent | Value             | English word |
| ------ | ------ | ------------------------------- | ----------------- | ------------ |
| Terra- | T / Ti | $2^{40}$                        | 1,099,511,627,776 | trillion     |
| Giga-  | G / Gi | $2^{30}$                        | 1,073,741,824     | billion      |
| Mega-  | M / Mi | $2^{20}$                        | 1,048,576         | million      |
| Kilo-  | k / Ki | $2^{10}$                        | 1,024             | thousand     |

> A special IEEE standard was introduced to distinguish base two within the metric nomenclature: kibi, mebi, gibi etc but this was not widely adopted. The symbols for this are included above as they are sometimes used by Linux programs (Gi, Mi, Ki etc)
