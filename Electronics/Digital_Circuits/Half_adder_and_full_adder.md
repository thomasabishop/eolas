---
categories:
  - Electronics
tags: [logic-gates, binary]
---

# The half adder and full adder

## Binary arithmetic

The half adder and full adder are components of digital circuits that enable us to carry out binary addition. Using adders and half adders we can add two binary numbers together. Adders are a type of [integrated circuit]() comprising certain [logic gates](/Hardware/Logic_Gates/Logic_gates.md) where the arrangement allows for the representation of the addition of bits.

### Example addition

Consider the following binary addition:

```
  c_1
0   0   1   0
0   0   1   1
_____________
0   1   0   1
```

How does the calculation proceed? Moving from the right-most column:

- $1 + 0 = 1$ hence the sum of the first column (the binary 1 coumn) is $1$ with no carry
- Moving to the second column (the binary 2 column), $1 + 1 = 2$ however we do not have the digit "2" in binary, therefore we must bump the place value by one place and carry this sum as a $1$ leaving a zero to mark the place value
- Thus the third column (the binary 4 column) has the calculation: $1 + 0 + 0 = 1$ with no carry.

### Bits

From the previous example we can identified the following repeated actions:

- For calculations of the form $1 + 0$ or $0 + 0$ there will be no carried digit
- For calculations of the form $1 + 1$ there will be a carried digit

In the context of adders the digits are bits. We distinguish the **least significant bit** and **most significant bit**. The least significant bit is the right-most digit in the calculation. The most significant bit is the leftmost:

// TODO: Add diagram highlighting least and most significant bits.

The two types of adders are distinguished by which bits of the calculation they operate on. The half adder focuses on the least significant bit whereas the full adder focuses on the most significant bit.

## Half adder

The symbol for the half adder is displayed below

// TODO: Add diagram of half adder

It has two inputs and two ouputs:

| Input                        | Input                         | Output      | Output            |
| ---------------------------- | ----------------------------- | ----------- | ----------------- |
| A                            | B                             | S           | C_out             |
| The first number to be added | The second number to be added | The sum bit | The carry-out bit |
