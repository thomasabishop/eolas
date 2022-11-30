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

In the context of adders the digits are bits. We distinguish three core bits by their role in the calculation: the carry, the **least significant bit** and the **most significant bit**. The least significant bit is the right-most digit in the calculation. The most significant bit is the leftmost.

The two types of adders are distinguished by which bits of the calculation they operate on. The half adder focuses on the least significant bit whereas the full adder focuses on the most significant bit.

## Half adder

The half adder receives two bits (A and B) which are to be added together. It outputs this value as the **sum bit**. If there is a bit to be carried to the next column in the binary calculation this will be output as the **carry-out** bit.

| A                            | B                             | S           | C_out             |
| ---------------------------- | ----------------------------- | ----------- | ----------------- |
| The first number to be added | The second number to be added | The sum bit | The carry-out bit |

The diagram below shows the circuit representation of a half-adder and an example calculation. This calculation matches the ones column of the earlier binary addition example: $0011 + 0010$.

![](/img/half-adder-new.png)

### Implementation with logic gates

If we think about it, the possible inputs and outputs of a half adder are highly circumscribed:

- If the sum exceeds $1$, the sum bit will be $0$ and the carry-out bit will be $1$
- In all other cases the carry-out bit will be $0$. These other cases are when the sum bit is either $0$ or $1$, e.g: $1 + 0$ or $0 + 0$.

We can represent this with a simple truth-table:

| A   | B   | S   | C_out |
| --- | --- | --- | ----- |
| 0   | 0   | 0   | 0     |
| 0   | 1   | 1   | 0     |
| 1   | 0   | 1   | 0     |
| 1   | 1   | 0   | 1     |

We can see that the sum bit column replicates the truth-conditions of [XOR](/Hardware/Logic_Gates/Xor_gate.md):

| P   | Q   | P V Q |
| --- | --- | ----- |
| T   | T   | F     |
| T   | F   | T     |
| F   | T   | T     |
| F   | F   | F     |

And the carry-out bit replicates the truth conditions of [AND](/Hardware/Logic_Gates/And_gate.md):

| P   | Q   | ~(P & Q) |
| --- | --- | -------- |
| T   | T   | F        |
| T   | F   | F        |
| F   | T   | F        |
| F   | F   | T        |

It is therefore possible to implement a half-adder with just these two logic gates:

The digital circuit above has the same inputs and outputs as the half adder diagram above.

<iframe src="https://circuitverse.org/simulator/embed/half-adder-67b14a9f-d1ed-4240-ab19-1d753f18a40d" style="border-width:; border-style: solid; border-color:;" name="myiframe" id="projectPreview" scrolling="no" frameborder="1" marginheight="0px" marginwidth="0px" height="500" width="500" allowFullScreen></iframe>

## Full adder

As the half adder only calculates the least significant bit, it is not sufficient by itself to complete a binary addition; it cannot account for movements in binary place value. To carry out full calculations it must be supplemented with the full adder.

The full adder takes in three inputs and has two inputs. It is identical to the half-adder apart from the fact that one of its inputs is **carry-in**. This is obviously equivalent to the value that is designated as **carry-out** in a half adder
