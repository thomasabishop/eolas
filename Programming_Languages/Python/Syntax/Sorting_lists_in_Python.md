---
categories:
  - Programming Languages
tags: [python]
---

# Sorting lists in Python

### Using `sorted()` Function:

The built-in `sorted()` function returns a new list containing all the elements of the original list sorted in the specified order (either ascending, which is default, or descending).

```python
my_list = [3, 1, 4, 1, 5, 9, 2, 6, 5]
sorted_list = sorted(my_list)
print(sorted_list)  # Output: [1, 1, 2, 3, 4, 5, 5, 6, 9]
```

For sorting in descending order, you can use the `reverse=True` argument:

```python
sorted_list_desc = sorted(my_list, reverse=True)
print(sorted_list_desc)  # Output: [9, 6, 5, 5, 4, 3, 2, 1, 1]
```

### Using `.sort()` Method:

The `.sort()` method sorts the elements of a list in-place and returns `None`. This modifies the original list.

```python
my_list = [3, 1, 4, 1, 5, 9, 2, 6, 5]
my_list.sort()
print(my_list)  # Output: [1, 1, 2, 3, 4, 5, 5, 6, 9]
```

For sorting in descending order:

```python
my_list.sort(reverse=True)
print(my_list)  # Output: [9, 6, 5, 5, 4, 3, 2, 1, 1]
```

### Using a Custom Key Function:

Both `sorted()` and `.sort()` accept a `key` parameter that allows you to specify a function to determine the sorting order. The function should take a single argument and return a value that will be used for sorting purposes.

For example, if you have a list of strings and you want to sort them by their length:

```python
my_str_list = ["apple", "banana", "cherry", "date"]
sorted_by_length = sorted(my_str_list, key=len)
print(sorted_by_length)  # Output: ['date', 'apple', 'cherry', 'banana']
```
