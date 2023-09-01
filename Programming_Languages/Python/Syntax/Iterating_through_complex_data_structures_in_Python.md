---
categories:
  - Programming Languages
tags: [python]
---

# Iterating through complex data structures in Python

// TODO: sections :

- Looping, mapping, filtering lists
- Looping, mapping, filtering dictionaries
- As above with multi-dimensional lists
- As above with list of dictionaries

## Complex data structures

In JavaScript when we return data from an API we tend to use an array of objects as the canonical form of a repeating iterable, e.g:

```js
const data = [
  {
    name: "Thomas",
    age: 35,
  },
  {
    name: "Joe",
    age: 75,
  },
];
```

In Python there are two common ways to handle similar data structures:

- A list of lists:
  ```py
  data = [
    ["Thomas", 35],
    ["Joe", 75]
  ]
  ```
- A list of dictionaries:
  ```py
  data = [
     {"name": "Thomas", "age": 35},
     {"name": "Joe", "age": 75},
  ]
  ```

## Multi-dimensional lists (list of lists)

### Sorting by common property

Assuming the sub-lists have an identical structure, you can [sort](/Programming_Languages/Python/Syntax/Sorting_lists_in_Python.md) them by a common property by passing a [lambda function](/Programming_Languages/Python/Syntax/Lambdas_in_Python.md) to the `key` value of `sorted()` and `.sort()`.

For example, to sort the following list of lists by the second `age` property:

```python
people = [["Alice", 30], ["Bob", 25], ["Clare", 35], ["Dave", 28]]
```

Using `sorted()`:

```py
sorted_people = sorted(people, key=lambda x: x[1])
print(sorted_people)
# Output: [['Bob', 25], ['Dave', 28], ['Alice', 30], ['Clare', 35]]
```

Using `.sort`:

```py
people.sort(key=lambda x: x[1])
print(people)
# Output: [['Bob', 25], ['Dave', 28], ['Alice', 30], ['Clare', 35]]
```

If you want to sort by name instead, you could change the lambda function to `lambda x: x[0]`:

```python
# Using sorted()
sorted_people = sorted(people, key=lambda x: x[0])
print(sorted_people)
# Output: [['Alice', 30], ['Bob', 25], ['Clare', 35], ['Dave', 28]]

# Using .sort()
people.sort(key=lambda x: x[0])
print(people)
# Output: [['Alice', 30], ['Bob', 25], ['Clare', 35], ['Dave', 28]]
```

### Updating a value within an element of a list of lists

In the following example we have a list of the following structure:

```py
data = [
    ["1688582410", "Article One"],
    ["1688647447", "Article Two"],
    ["1689023491", "Article Three"],
]
```

Below we use [list comprehension](/Programming_Languages/Python/Syntax/List_comprehension.md) to convert the first element of each iner list from a Unix timestamp to a readable string:

```py
 readable_date = list(map(lambda i: [convert_timestamp(i[0])] + i[1:], date))
```

### Filter elements in a multidimensional list

Say we have the following data structure:

```py
name_age = [ ["Anthony", 16], ["Christopher", 22], ["James", 6] ]
```

We can return only the people who are older than 18 with the following `filter` function and `lambda`:

```py
filtered_ages = list(filter(lambda person: person[1] > 18, name_age))
```

### Remove duplicate entries from multidimensional list

## List of dictionaries
