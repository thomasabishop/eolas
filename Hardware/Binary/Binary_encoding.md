---
title: Binary encoding
categories:
  - Computer Architecture
tags: [binary]
---

# Binary encoding

We know that everything going on in a computer is the manipulation of binary digits. Thus all data must ultimately reduce to binary numbers controlled through logic circuits.

_Encoding_ is the process of establishing a correspondence between certain binary numbers and symbols. For certain essential data types, for instance alphanumeric characters and colours, there are agreed standards of encoding such that, for example, that `111111` (binary) and `3F` (hex) always corresponds to the character `?`. The reverse is obviously _decoding_: deriving the data/ symbol from the binary format.

The length of the binary number is determined by the number of variations that you require to capture a given dataset. For example, say we know that there are 18 levels to a computer game. To encode a reference for each level we would need a binary number that is capable of at least 18 total variations.

Here, a 32-bit ($2^{5}$) number would be best because the next smallest (16-bit) would not be sufficient. Our levels would have representations as follows:

```
00001 (1)
00010 (2)
00011 (3)
00100 (4)
...
```

> An encoding system maps each symbol to a unique sequence of bits. A computer then interprets that sequence of bits and displays the apppropriate symbol to the user.

## Related points

Think about when you open a file format in a text editor that cannot decode it. For example trying to open a Word document in VSCode. The mangled letters it displays is the encoded binary data. When you open the file in Word, the decoding is applied and it resembles what you would expect.

When we save a file, the different file extensions denote different formats and these are encoding formats. For example if you save an image file as `.png` rather than `.jpg`, you are applying a different encoding algorithm to the data that compresses the raw binary data in a different way.
