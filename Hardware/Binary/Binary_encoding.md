---
title: Binary encoding
categories:
  - Computer Architecture
tags: [binary]
---

# Binary encoding

We know that everything going on in a computer is the manipulation of binary digits. Thus all data must ultimately reduce to binary numbers controlled through logic circuits.

_Encoding_ is the process of establishing a correspondence between certain binary numbers and symbols. For certain essential data types, for instance alphanumeric characters and colours, there are agreed standards of encoding such that, for example, that `111111` (binary) and `3F` (hex) always corresponds to the character `?`.

The length of the binary number is determined by the number of variations that you require to capture a given dataset. For example, say we know that there are 18 levels to a computer game. To encode a reference for each level we would need a binary number that is capable of at least 18 total variations.

Here, a 32-bit ($2^{5}$) number would be best because the next smallest (16-bit) would not be sufficient. Our levels would have representations as follows:

```
00001 (1)
00010 (2)
00011 (3)
00100 (4)
...
```
