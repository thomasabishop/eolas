---
categories:
  - Programming Languages
tags: [python, data-structures]
---

# Tuples in Python

Tuples are one of the main data-structures or containers in Python. Tuples are useful in cases where you want to group related data and ensure that it will not change.

Tuples have the following properties:

- They are **ordered**
- They have a **fixed size**
- They are **immutable** and cannot be modified
- **Allow duplicate** members
- They are **indexed**

> In essence a tuple is a list that is immutable.

As with all containers in Python they permit any data type.

> Tuples are denoted with `(...)`

## Basic usage

```python
tup1 = (1, 3, 5, 7)
print(tup1[0])
print(tup1[1])
print(tup1[2])
print(tup1[3])

"""
1
3
5
7
"""
```

## Slicing

```python
tup1 = (1, 3, 5, 7)

print(tup1[1:3])
print(tup1[:3])
print(tup1[1:])
print(tup1[::-1])

"""
(3, 5)
(1, 3, 5)
(3, 5, 7)
(7, 5, 3, 1)
"""
```

## Looping

```python
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
```

## Useful methods and predicates

```python
tup3 = ('apple', 'pear', 'orange', 'plum', 'apple')

# Count instances of a member
print(tup3.count('apple'))
# 2

# Get index of a member
print(tup3.index('pear'))
# 1

# Check for membership
if 'orange' in tup3:
    print('orange is in the Tuple')

# orange is in the Tuple
```

## Nest tuples

```python

tuple2 = ('John', 'Denise', 'Phoebe', 'Adam')
tuple3 = (42, tuple1, tuple2, 5.5)
print(tuple3)

# (42, (1, 3, 5, 7), ('John', 'Denise', 'Phoebe', 'Adam'), 5.5)

```

// TODO: How to flatten a tuple?
