---
id: 3wsh
tags:
  - binary
created: Wednesday, March 20, 2024
---

# Signed magnitude representation

## Summary

## Detail

The concept behind SMR is similar to how we designate positive and negative
integers in denary mathematics: we use a dedicated symbol (`-`) to signpost that
the integer is negative. In the binary application the dedicated symbol is one
of the binary digits that comprise the number.

Typically `0` is used to indicate an unsigned (positive) integer and `1` to
indicate a signed (negative) number. The rest of the bits are the magnitude (the
actual numerical value).

We can demonstrate with an 8-bit binary system, encoding `5`: `0000 0101`. Here
the furthest bit (aka. the "most significant bit" (MSB)) at the $2^8$ position
is `0`, designating that the number is unsigned. The signed equivalent is
`1000 0101`, with the MSB being `1` designating the number as signed. When we
are working with signed numbers, the MSB is known as the **signed bit**.

### Advantages

### Limitations

## Applications

## Related notes

[[Signed_and_unsigned_numbers|signed_and_unsigned_numbers]]
