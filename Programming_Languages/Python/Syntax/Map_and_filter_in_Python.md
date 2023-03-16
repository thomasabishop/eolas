---
categories:
  - Programming Languages
tags: [python]
---

# Map and filter in Python

## Map

```py
data = [1, 3, 5, 2, 7, 4, 10]

new_data = map(lambda i: i + 10, data)
print(new_data)
```

We can also pass-in a function rather than use a lambda:

```py
def add_one(i):
    return i + 1

x = list(map(addOne, data))
# [2, 4, 6, 3, 8, 5, 11]
# necessary to add `list` to get some output
```

### Map returns an object

When you run `map` against a list it returns a map object not a list. This can present problems if you are not aware of it since it is not an entity that you can loop through.

The following map removes whitespaces from elements in a list:

```py
  lines = map(lambda x: x.strip(), lines)
```

In order to be able to run list-like operations against the resulting `lines` object we would need to convert it to a list:

```py
  lines = list(map(lambda x: x.strip(), lines))
```

## Filter

```py
data = [1, 3, 5, 2, 7, 4, 10]

d1 = list(filter(lambda i: i % 2 == 0, data))
print(d1)
#  [2, 4, 10]

def is_even(i):
    return i % 2 == 0


# Filter for even numbers using a named function
d2 = list(filter(is_even, data))

# [2, 4, 10]
```

## Chaining

```py
data = [1, 3, 5, 2, 7, 4, 10]
new_data = list(map(lambda i: i + 10, filter(is_even, data)))
print(new_data)
# new_data: [12, 14, 20]
```
