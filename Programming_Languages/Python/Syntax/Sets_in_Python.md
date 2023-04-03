---
categories:
  - Programming Languages
tags: [python, data-structures]
---

# Sets in Python

- They are **unordered**
- You can increase/decrease their length by adding/removing new members
- They **do not allow duplicate members**
- **Can only hold immutable objects**

> Sets are denoted with `{...}`

## Basic usage

```python
basket = {'apple', 'orange', 'apple', 'pear', 'orange', 'banana'}
print(basket)  # show that duplicates have been removed
print(len(basket))
# {'apple', 'pear', 'banana', 'orange'}
# 4
```

## Looping through sets

```python
for item in basket:
    print(item)

"""
apple
pear
banana
orange
"""
```

## Check for membership

```python
basket = {'apple', 'orange', 'apple', 'pear', 'orange', 'banana'}
print('apple' in basket)
# True
```

## Remove items from set

> `remove` will raise an error if the specified item does not exist, `discard` will not

```python
basket.remove('apple')
basket.discard('apricot')
print(basket)
# {'pear', 'banana', 'orange'}

basket.clear()
print(basket)
#set

```

## Add items to a set

```python
basket.add('apricot')
print(basket)
# {'apricot', 'pear', 'banana', 'orange'}
```

## Start with empty set

To declare an empty set you cannot just do:

```py
my_set = {}
```

You have to use a constructor:

```py
my_set = set()
```

## Apply unions and intersections

```python
s1 = {'apple', 'orange', 'banana'}
s2 = {'grapefruit', 'lime', 'banana'}
print('Union:', s1 | s2)
# Union: {'apple', 'orange', 'grapefruit', 'lime', 'banana'}

print('Intersection:', s1 & s2)
# Intersection: {'banana'}


print('Difference:', s1 - s2)
# Difference: {'orange', 'apple'}

print('Symmetric Difference:', s1 ^ s2)
#Symmetric Difference: {'apple', 'orange', 'grapefruit', 'lime'}

```
