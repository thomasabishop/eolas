---
tags: [binary, binary-arithmetic]
---

# Binary addition

- We add binary values in columns just like we would with denary addition.
- Each column is classified on the basis of place-value. In denary this is 10,
  in binary it is 2.
- When we conduct a binary addition, we add the binary values as if they were
  normal integers but we represent the sums as binary.
  - For example: $1 + 1 = 2$ for the calculation but the sum is $10$

## Examples

### Example one

$$
1010 + 0111 = 10001
$$

$$
10 + 7 = 17
$$

In the first column: $1 + 0 = 1$, so we simply put the binary value for $1$:

```
1010
0111
____
   1
```

In the second column: $1 + 1 = 2$. In binary this is represented as $10$. So we
put $0$ beneath the bar and carry the $1$:

```
 1
1010
0111
____
  01
```

In the third column, we repeat the previous process. We are presented with
$1 + 0 + 1$ which is $2$. As $2$ is $10$ in binary, we put the zero beneath the
line and carry the $1$:

```
11
1010
0111
____
 001
```

In the final column, we again have $1+1$ giving us $2$ or $10$ but at this point
we cannot carry any more because we have reached the final column. So instead of
carrying the $1$ we just put both digits beneath the line $10$.

```
 11
 1010
 0111
_____
10001
```

### Example two

$$
1001 + 0111 = 10000
$$

$$
9 + 7 = 16
$$

```
 111
 1001
 0111
_____
10000
```
