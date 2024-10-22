---
id: 44li
tags: [python]
created: Wednesday, June 19, 2024
---

# Passing arguments to Python scripts

`sys.argv` is a list that contains the command-line arguments passed to a Python
scripts.

- `sys.argv[0]` = the name of script
- `sys.argv[1]` = the first argument
- `sys.argv[2]` = the second argument, and so on

Example invocation:

```sh
python3 ./my_script.py argument_one argument_two

```

```python
import sys

print(sys.argv[0])
print(sys.arg)
print(sys.argv[1])

# my_script.py
# ['my_script.py', 'argyment_one', 'argument_two']
# argument_one

```
