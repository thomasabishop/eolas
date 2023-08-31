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

## List of lists

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

### Updating a value within a list of lists

We can use `map` to mutate a given value within each list.

In the following example we have a list of the following structure:

```py
data = [
    ["1688582410", "Article One"],
    ["1688647447", "Article Two"],
    ["1689023491", "Article Three"],
]
```

Below, we apply a function to each of the first elements which is a Unix timestamp, converting it to a readable format:

```py
 readable_date = list(map(lambda i: [convert_timestamp(i[0])] + i[1:], date))
```

Key points:

- We apply the `convert_timestamp` function to the first element of each sublist
- We wrap this first element in `[]` so that it can be merged with the other elements of the list. This is necessary otherwise we will just return a list of the first elements and not include the other properties.
- The map and lambda is the core structure. We wrap it in `list` because `map` returns an object not a list.
