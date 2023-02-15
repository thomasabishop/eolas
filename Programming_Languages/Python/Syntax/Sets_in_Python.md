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
```

## Add items to a set
