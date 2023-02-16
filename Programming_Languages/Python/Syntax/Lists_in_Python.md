---
categories:
  - Programming Languages
tags: [python, data-structures]
---

# Lists in Python

Lists are the equivalent of a simple array in JavaScript.

Lists have the following properties:

- They are **ordered**
- They are **mutable** and can be modified
- They **allow duplicate** members
- They are **indexed**
- You can increase/decrease their length by adding/removing new members

> Lists are denoted with `[...]`

## Duplicating lists

When we want to duplicate a list, we can't just reassign the list to a new variable and expect this to be a copy.

If we edit this "copy" it will update the original list since it copies the pointer and will therefore point to the same address in memory. Instead we have to use the List `copy()` function which returns a new list and doesn't modify the original list.

Relatedly, we should distinguish those List methods and functions which create a new list (non-destructive) and those that mutate the existing list.

## Basic usage

```python
# Defining a list
list1 = ['John', 'Paul', 'George', 'Ringo']
list2 = [4]

# Empty list
list3 = []  # empty list
list3 = list()  # Also empty list

# Nested list
list5 = [[2, 3], [6, 8]]
```

## Slicing

```python
list1 = ['John', 'Paul', 'George', 'Ringo']

print(list1[1])
print(list1[-1])
print(list1[1:3])
print(list1[:3])
print(list1[1:])

"""
Ringo
['Paul', 'George']
['John', 'Paul', 'George']
['Paul', 'George', 'Ringo']
"""
```

## Adding additional values to existing list

```python
list1 = ['John', 'Paul', 'George', 'Ringo']

# Add single element to the end of a list
list1.append('Pete')
# ['John', 'Paul', 'George', 'Ringo', 'Pete']

# Add multiple elements to end of a list
list1.extend(['Albert', 'Bob'])
list1 += ['Ginger', 'Sporty']
# ['John', 'Paul', 'George', 'Ringo', 'Pete', 'Albert', 'Bob', 'Ginger', 'Sporty']

## Insert at specific index
list1.insert(2, 7)
['John', 'Paul', 7, 'George', 'Ringo', 'Pete', 'Albert', 'Bob', 'Ginger', 'Sporty']

a_list = ['Adele', 'Madonna', 'Cher']
print(a_list)
a_list.insert(1, 'Paloma')
print(a_list)
# ['Adele', 'Paloma', 'Madonna', 'Cher']

```

## Removing elements

We distinguish `del` from `remove` when removing elements from lists:

- `del` requires an index value
- `remove` requires a value reference (i.e. the mame of the element rather than its index)

`del` is simple deletion whereas `remove` searches the list. Therefore `del` is more efficient.

```python
# Remove and return element removed
list6 = ['Once', 'Upon', 'a', 'Time']
print(list6.pop(2))
# a

# Remove and return last element
list6 = ['Once', 'Upon', 'a', 'Time']
print(list6.pop())
list6.pop()
print(list6)
# Time

list6.remove('Upon')
print(list6)
# ['Once', 'a']

my_list = ['A', 'B', 'C', 'D', 'E']
print(my_list)
# ['A', 'B', 'C', 'D', 'E']
del my_list[2]
print(my_list)
# ['A', 'B', 'D', 'E']


print(my_list)
# ['A', 'B', 'C', 'D', 'E']
del my_list[1:3]
print(my_list)
# ['A', 'D', 'E']

```

## Retrieve elements by index

```python
list7 = [2, 3, 6, 8]
print(list7.index(8))
# 3

list6 = ['Once', 'Upon', 'a', 'Time']
print(list6.index('a'))
# 2
```

## Nesting lists

```python
l1 = [1, 43.5, 'Phoebe', True]
l2 = ['apple', 'orange', 31]
root_list = ['John', l1, l2, 'Denise']
print(root_list)
# ['John', [1, 43.5, 'Phoebe', True], ['apple', 'orange', 31], 'Denise']
```

## List comprehension

> List comprehension is an older feature of Python. Now the same functionality can be achieved with greater concision using functional methods like `map` and `filter`. But you may see it used in older code.

```python
values = [1, 2, 4, 6, 8, 9]

new_values = [i + 1 for i in values]
print('new_values', new_values)
# new_values [2, 3, 5, 7, 9, 10]
new_list = [item + 1 for item in values if item % 2 == 0]

print('new_list:', new_list)
# new_list: [3, 5, 7, 9]
```
