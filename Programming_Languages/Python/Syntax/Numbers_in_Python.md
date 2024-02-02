---
categories:
  - Programming Languages
tags: [python, data-types]
---

# Numbers in Python

## Distinguishing `int` and `float`

- In Python we have floats and integers and we can coerce one into the other
- A `//` as an operator means float division. This obviously provides greater
  precision than int division `/`.
- There is no increment (`++`) or decrement (`--`) operator in Python

```python
# Integers and floats
count = 1
print(count)
# 1
print(type(count))
# <class 'int'>

exchange_rate = 1.83
print(exchange_rate)
# 1.83
print(type(exchange_rate))
# <class 'float'>

print(float(count))
# 1.0

print(int(exchange_rate))
# 1
```
