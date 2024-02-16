---
categories:
  - Computer Architecture
tags: [binary, binary-encoding]
---

# Binary encoding of colours

The approach to encoding binary representations of colour is very similar to the
approach we explored when looking at the encoding of
[alphanumeric values](/Electronics_and_Hardware/Binary/Text_encoding.md).

We begin by determining the total number of colours and colour shades we want to
represent. With this value established we then decide on the bit-length required
that will accomodate this number of variations. Finally, we assign a binary
number to each representation.

### Greyscale

We can start with a limited palette: greyscale. Here there is black and white
and number of interim shades of grey. The convention is to use an 8-bit number
which, given $2^8 = 256$ provides 256 shade variations.

In decimal, 0 is equal to black (zero light intensity) and 255 is equal to white
(full light intensity). Some examples of this (including binary and hex
representations are below):

![](/img/greyscale-encoding.svg)

### Colour encoding

A single 8-bit number is sufficient for 256 greyscale combinations but with
colour, the convention is to use three 8-bit numbers where each byte corresponds
to a value for red, green and blue (RGB). Thus the overall bit-length is 24
($2^3 + 2^3 + 2^3$). Each value corresponds to a light intensity for the given
colour. Combined they are capable of representing all colours.

Some examples below

#### Red

Red is represented in RGB with all 8 red bits to set to 1 and the remaining 16
bits for the other two colours set to 0.

![](/img/red-encoding.svg)

#### Yellow

Yellow is represented in RGB with both red and blue set to 1 and the remaining 8
green bits set to ):

![](/img/yellow-encoding.svg)

## Binary encoding of images
