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

The length of the binary number (bytes, 16-bit, 32-bit etc) that is used to represent a given data set is determined by the number of variations that you require to capture the entire range of the dataset. For example, say we know that there are 18 levels to a computer game. To encode a reference for each level we would need a binary number that is capable of at least 18 total variations. In this insta<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>

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
