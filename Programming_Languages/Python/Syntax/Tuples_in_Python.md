---
categories:
  - Programming Languages
tags: [python, data-structures]
---

# Tuples in Python

Tuples are one of the main data-structures or containers in Python.

Tuples have the following properties:

- They are **ordered**
- They have a **fixed size**
- They are **immutable** and cannot be modified
- **Allow duplicate** members
- They are **indexed**

```python
tup1 = (1, 3, 5, 7)
print('tup1[0]:\t', tup1[0])
print('tup1[1]:\t', tup1[1])
print('tup1[2]:\t', tup1[2])
print('tup1[3]:\t', tup1[3])

"""
tup1[0]:         1
tup1[1]:         3
tup1[2]:         5
tup1[3]:         7
"""

# Slicing

print('tup1[1:3]:\t', tup1[1:3])
print('tup1[:3]:\t', tup1[:3])
print('tup1[1:]:\t', tup1[1:])
print('tup1[::-1]:\t', tup1[::-1])

"""
tup1[1:3]:       (3, 5)
tup1[:3]:        (1, 3, 5)
tup1[1:]:        (3, 5, 7)
tup1[::-1]:      (7, 5, 3, 1)
"""


print('len(tup1):\t', len(tup1))
# len(tup1):       4

tup2 = (1, 'John', True, -23.45)
print(tup2)
# (1, 'John', True, -23.45)


tup3 = ('apple', 'pear', 'orange', 'plum', 'apple')
for x in tup3:
    print(x)

"""
apple
pear
orange
plum
apple
"""

print(tup3.count('apple'))
print(tup3.index('pear'))

# 2
# 1


if 'orange' in tup3:
    print('orange is in the Tuple')

# orange is in the Tuple

tuple1 = (1, 3, 5, 7)
tuple2 = ('John', 'Denise', 'Phoebe', 'Adam')
tuple3 = (42, tuple1, tuple2, 5.5)
print(tuple3)

# (42, (1, 3, 5, 7), ('John', 'Denise', 'Phoebe', 'Adam'), 5.5)

```
