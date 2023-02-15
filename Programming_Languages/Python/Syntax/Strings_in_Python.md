---
categories:
  - Programming Languages
tags: [python, data-types]
---

# Strings in Python

> Generally, anything that changes a string will be a method on the `str` class, rather than a built-in function like `len()`, as such it will use dot notation

- Strings are **immutable**: string operations produce a new string.

```python
# Working with Strings

my_variable = 'Bob'
print(my_variable)
# Bob

my_variable = "Eloise"
print(my_variable)
# Eloise

# A multi line string
my_variable = """
Hello
  World
"""
print(my_variable)
"""
Hello
  World
"""

my_string = 'Hello World'
print(len(my_string))
# 11

string_1 = 'Good'
string_2 = " day"
string_3 = string_1 + string_2
print(string_3)
# Good day

msg = 'Hello Lloyd you are ' + str(21)
print(msg)
# Hello Lloyd you are 21

# Range of String operations
msg = 'Hello World'
print(msg.replace("Hello", "Goodbye"))
# Goodbye World

print('Edward Alan Rawlings'.find('Alan'))
# 7

print('Edward John Rawlings'.find('Alan'))
# -1

print('James' == 'James') # prints True
print('James' != 'John') # prints True

print("msg.startswith('H')", msg.startswith('H'))
# msg.startswith('H') True

print("msg.endswith('d')", msg.endswith('d'))
# msg.endswith('d') TRUE

print('some_string.upper()', msg.upper())
# some_string.upper() HELLO WORLD

print('sub string: ', 'Hello-World'[1:5])
# sub string: ello

# String interpolation
user_age = input("Please enter your age: ")
print(f'You are {user_age}')
```
