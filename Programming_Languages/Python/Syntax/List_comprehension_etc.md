---
categories:
  - Programming Languages
tags: [python]
---

# List comprehension

List comprehension is a syntactic shorthand for applying a function to each element in a list without explicitly using loop syntax.

Since its introduction to the language, the same functionality has become achievable by using functional methods like [`map` and `filter`](/Programming_Languages/Python/Syntax/Map_and_filter_in_Python.md) utilising [lambdas](/Programming_Languages/Python/Syntax/Lambdas_in_Python.md) however list comprehension is often more straightforward and easier to read.

## Syntax

Here is a basic example which applies `+ 1` to each integer in a list:

```python
values = [1, 2, 4, 6, 8, 9]

new_values = [i + 1 for i in values]
print('new_values', new_values)
# new_values [2, 3, 5, 7, 9, 10]
```

The basic syntax is as follows:

```
new_list  = [expression for each member in an iterable]
```

- The _expression_ can be the member itself, a call to a method, or any other valid expression that returns a value. In the example above, the expression `i + i` adds one to each member value.

- The _member_ is the object or value in the list or iterable. In the example above, the member value is _i_.

- The _iterable_ is a list, set, dictionary or any other object that can return its elements one at a time. In the example above, the iterable is each value in `values`.

This is a much more condensed way of achieving the same outcome with a traditional loop:

```py
values = [1, 2, 4, 6, 8, 9]
new_list = []
for i in values:
  values.append(i+1)
```

### Another example

In the following example, we apply list comprehension with a `in range` loop structure:

```py
new_list = [i * i for i in range(10) ]
print(new_list)
# [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]

```

### Adding a condition

We can apply a

```py
new_list = [item + 1 for item in values if item % 2 == 0]

print('new_list:', new_list)
# new_list: [3, 5, 7, 9]
```

// Add example of how a simple filter could be applied without any execution on each element

// TODO: Compare with how the same would be achieved with lambdas

## Dictionary comprehension

// TODO: Add note on dictionary and set comprehension
