---
tags: [python, file-system, procedural]
created: Friday, October 25, 2024
---

# File system error handling in Python

The [error handler](Error_handling_in_Python.md) in the case of a file not being
found:

```py
try:
    with open('filename.txt', 'r') as file:
    contents = file.readlines()
    for line in lines:
        print(line)
except FileNotFoundError as err:
    print("File does not exist")
    print(err)
```
