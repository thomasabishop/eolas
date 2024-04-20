---
id: t127
title: Bitwise_operators
tags: [binary]
created: Saturday, April 20, 2024
---

# Bitwise operators

In addition to mathematical, logical and comparison operators, there are
_bitwise operators_. These operators execute conditions based on the actual bits
of a value rather than the values that the bits are encoded to represent.

Bitwise operators are typically represented with single characters of existing
operators, e.g. `&` instead of `&&`:

| Bitwise operation | Operator      |
| ----------------- | ------------- |
| AND               | `&`           |
| OR                | (single pipe) |
| NOT               | `~`           |

An example of using the `&` operator:

```py
x = 5
y = 3
a = x & y
b = x | y
```

The value of `a` will be 1. The reason is we are looking at the bit values of
`x` and `y` and then applying Boolean AND to each bit:

```
x = 5 = 0101
y = 3 = 0011
a = 1 = 0001
```

Working from right to left for each column:

- true and true = true
- false and true = false
- true and false = false
- false and false = false

This leaves us with 0001 which is equal to 1 in binary and denary.

For the case of bitwise OR we get 7 as the result of `x | y`:

```
x = 5 = 0101
y = 3 = 0011
b = 7 = 0111
```

- true or true = true
- false or true = true
- true or false = true
- false or false = true

This leaves us with 0111 which is equal to 7 in denary.

## Related notes
