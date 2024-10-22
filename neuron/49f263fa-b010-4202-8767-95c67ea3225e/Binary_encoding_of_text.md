---
tags:
  - binary
---

# Text encoding

Text encoding is an applied instance of [binary encoding](Binary_encoding.md).

## ASCII

There are around 100 characters in total required to render A-Z, a-z, 0-9 and
the special characters of Lating text. The ASCII (American Standard Code for
Information Interchange) system achieves this with 8-bit code. Thus, each
character symbol corresponds to a byte. As $2^8 = 256$, this allows for a total
of 256 characters (where only 7-bits are sufficient, a leading `0` is added).

Below are some examples of the ASCII correspondences:

| Binary    | Hex | Character |
| --------- | --- | --------- |
| 00100000  | 20  | [space]   |
| 00100001  | 21  | !         |
| 001010112 | 2B  | +         |

However there are only 128 characters represented in ASCII, thus using 256-bits
is somewhat excessive. This lead people to try and use the remaining, free 128
bits to accommodate characters from non-English languages. This was quickly
found to be insufficient, necessitating the development of a new encoding
standard, Unicode...

## Unicode and UTF-8

Whereas ASCII only encodes 128 English alphanumeric characters, the scope of
Unicode is much broader, as such it is a superset of ASCII (every character in
ASCII is in Unicode but not the converse). Unicode is a universal character
encoding that defines every character in every spoken language of the world. The
Unicode standard is maintained by the Unicode Consortium and defines more than
1,40,000 characters from more than 150 modern and historic scripts along with
emoji.

In contrast to ASCII, it doesn't achieve this by mapping every character to a
bit. Instead it provides an abstract representation of every character which is
then encoded using a designated encoding protocol, such as UTF-8, UTF-16, UTF-32
etc. These abstract representations are called "code-points" and are represented
as hexadecimal numbers between 0xO - 0x10FFFF (1114111), prepended by `U+`, for
example ` U+00F7` which is the sign for division.

As the encoding names suggest they encode to different bit sizes:

- UTF-8 and UTF-16 are variable length encodings.
- In UTF-8, a character may occupy a minimum of 8 bits.
- In UTF-16, a character length starts with 16 bits.
- UTF-32 is a fixed length encoding of 32 bits.

> Unicode can be stored using several different encodings, which translate the
> character codes into sequences of bytes. So, crucially Unicode is not itself
> an encoding.

UTF-8 uses the ASCII set for the first 128 characters. That's handy because it
means ASCII text is also valid in UTF-8.
