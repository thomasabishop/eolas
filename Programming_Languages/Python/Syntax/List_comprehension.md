---
categories:
  - Programming Languages
tags: [python]
---

# List comprehension

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

// TODO: Compare with how the same would be achieved with lambdas
