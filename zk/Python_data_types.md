---
title: Python data-types
categories:
  - Programming Languages
tags: [python, data-types]
---

# Python data-types

- Python is dynamically typed rather than untyped. It updates the types on the
  fly as you are writing your code.
- Type-hints in the editor like `-> str` mean "at the moment it is a string". It
  doesn't mean you can't redefine the value as something else.
- Each data type in Python inherits off of a built-in class, similar to
  prototypes in JS

The core data-types are as follows:

- [str](/Programming_Languages/Python/Syntax/Strings_in_Python.md)
- bool
- float
- double

We can identify types using the built-in `type()` function:

```python
# Integer number
my_variable = 422
print(my_variable)
print(type(my_variable))
# <class 'int'>

# String type
my_variable = 'Natalia'
print(my_variable)
print(type(my_variable))
# <class 'str'>

# Boolean type
my_variable = True
print(my_variable)
print(type(my_variable))
# <class 'bool'>
```

## Converting data-types

For every data-type there is a corresponding converter method, e.g:

```python
a_string = '32'
print(f'a_string {a_string} is {type(a_string)}')
an_int = int(a_string)

print(f'an_int {a_string} is {type(an_int)}')
a_float = float(a_string)

print(f'a_float {a_string} is {type(a_float)}')
another_string = str(42)

print(f'another_string {a_string} is {type(another_string)}')
```
