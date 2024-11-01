---
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

When we want to duplicate a list, we can't just reassign the list to a new
variable and expect this to be a copy.

If we edit this "copy" it will update the original list since it copies the
pointer and will therefore point to the same address in memory. Instead we have
to use the List `copy()` function which returns a new list and doesn't modify
the original list.

Relatedly, we should distinguish those List methods and functions which create a
new list (non-destructive) and those that mutate the existing list.

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
'John'
'Ringo'
['Paul', 'George']
['John', 'Paul', 'George']
['Paul', 'George', 'Ringo']
"""
```

## Adding additional values to existing list

### Single value

```py
list1 = ['John', 'Paul', 'George', 'Ringo']

# Add single element to the end of a list
list1.append('Pete')
# ['John', 'Paul', 'George', 'Ringo', 'Pete']
```

### Multiple values

```py
list1.extend(['Albert', 'Bob'])
list1 += ['Ginger', 'Sporty']
# ['John', 'Paul', 'George', 'Ringo', 'Pete', 'Albert', 'Bob', 'Ginger', 'Sporty']
```

### Specific index

```python

## Insert at specific index

a_list = ['Adele', 'Madonna', 'Cher']
a_list.insert(1, 'Paloma')
print(a_list)

# ['Adele', 'Paloma', 'Madonna', 'Cher']
```

## Removing elements

We distinguish `del` from `remove` when removing elements from lists:

- `del` requires an index value
- `remove` requires a value reference (i.e. the name of the element rather than

`del` is simple deletion whereas `remove` searches the list. Therefore `del` is
more efficient.

### `del`

```py
my_list = [10, 20, 30, 40, 50]
del my_list[1]
print(my_list)  # Output will be [10, 30, 40, 50]
```

We can remove multiple items at once via a slice:

```py
my_list = [10, 20, 30, 40, 50]

# Delete the elements from index 1 to 3 (inclusive of start index and exclusive of end index)
del my_list[1:4]

# Print the updated list
print(my_list)  # Output will be [10, 50]
```

### `remove()`

```py
my_list = [10, 20, 30, 40, 50]

# Remove the element with value 30
my_list.remove(30)

# Print the updated list
print(my_list)  # Output will be [10, 20, 40, 50]
```

> If the value is not found in the list,
> `remove()`` will raise a ValueError. To avoid this, you can check whether the value exists in the list before calling `remove()`

### pop()

Remove and return the element removed

```python
list6 = ['Once', 'Upon', 'a', 'Time']
print(list6.pop(2))
# a

```

## Return index of a list element

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

## Merging lists

```py
list1 = [1, 2, 3]
list2 = [4, 5, 6]

merged_list = list1 + list2
print(merged_list)  # Output: [1, 2, 3, 4, 5, 6]
```

## Flattening a two-dimensional list (matrix)

Use [list comprehension](List_comprehension_in_Python.md) for each row in the
matrix:

```python
 matrix = [
    [9, 3, 8, 3],
    [4, 5, 2, 8],
    [6, 4, 3, 1],
    [1, 0, 4, 5],
]

flat = [item for row in matrix for item in row]
# [9, 3, 8, 3, 4, 5, 2, 8, 6, 4, 3, 1, 1, 0, 4, 5]
```

## See also

[Sorting lists in Python](Sorting_lists_in_Python.md)
