---
title: Text encoding
categories:
  - Computer Architecture
tags: [binary, ascii]
---

# Text encoding

Text encoding is an applied instance of [binary encoding](/Hardware/Binary/Binary_encoding.md).

There are around 100 characters in total required to render A-Z, a-z, 0-9 and special characters. The ASCII (American Standard Code for Information Interchange) system achieves this with 8-bit code. Thus, each character symbol corresponds to a byte. As $2^8 = 256$. This allows for a total of 256 characters (where only 7-bits are sufficient, a leading `0` is added).

Below are some examples of the ASCII correspondences:

| Binary    | Hex | Character |
| --------- | --- | --------- |
| 00100000  | 20  | [space]   |
| 00100001  | 21  | !         |
| 001010112 | 2B  | +         |

//TODO: Add notes on unicode and UTF-8
