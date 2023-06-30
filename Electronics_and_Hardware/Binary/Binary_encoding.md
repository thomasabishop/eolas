---
title: Binary encoding
categories:
  - Computer Architecture
tags: [binary, binary-encoding]
---

# Binary encoding

We know that everything going on in a computer is the manipulation of binary digits. Thus all data must ultimately reduce to binary numbers manipulated through logic circuits.

_Encoding_ is the process of establishing a correspondence between sets of binary numbers and sets of symbols that are representative of a given type of data. For certain fundamental data types, for example alphanumeric characters and colours, there are agreed standards of encoding such that, for example, that `111111` (binary) and `3F` (hex) always corresponds to the character `?`. The reverse is obviously _decoding_: deriving the data/ symbol from the binary format.

> An encoding system maps each symbol to a unique sequence of bits. A computer then interprets that sequence of bits and displays the apppropriate symbol to the user.

The length of the binary number (sometimes called the _word length_) corresponding to 8-bit, 16-bit, 32-bit etc. that is used to represent a given data set is determined by the number of variations that you reqzuire to capture the entire range of the dataset:

> An $n$-bit binary system can encode $2^n$ different things

For example, say we know that there are 18 levels to a computer game. To encode a reference for each level we would need a binary number that is capable of at least 18 total variations. In this instance a 32-bit ($2^{5}$ ) number would be best because the next smallest (16-bit) would not be sufficient. Our levels would have representations as follows:

```
00001 (1)
00010 (2)
00011 (3)
00100 (4)
...
```

## Related points

Think about when you open a file format in a text editor that cannot decode it. For example trying to open a Word document in VSCode. The mangled letters it displays is the encoded binary data. When you open the file in Word, the decoding is applied and it resembles what you would expect.

When we save a file, the different file extensions denote different formats and these are encoding formats. For example if you save an image file as `.png` rather than `.jpg`, you are applying a different encoding algorithm to the data that compresses the raw binary data in a different way.
