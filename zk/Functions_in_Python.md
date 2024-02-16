---
categories:
  - Programming Languages
tags: [python]
---

# Functions in Python

- Convention is to leave a double line-break after a function definition (but
  not with nested functions - here, a single linebreak is sufficient)
- Scope within functions is demarcated by indents, as everything in Python
- We use a docstring _within_ the function body, to document our function. This
  text will then show up in Intellisense etc.

## Basic examples

```py

# No params, no return
def print_msg():
    """ A function that prints hello world """
    print('Hello World!')

print_msg()
# Hello World!

print(type(print_msg))
# <class 'function'>

# Params, no return
def print_my_msg(msg):
    """ A simple function to print a message """
    print(msg)

print_my_msg('Good day')
# Good day

# Params and return
def square(n):
    return n * n

print(square(2))
# 4

result = square(4)
print(result)

# 16

```

## Default parameters

```py
def greeter(name, message='Live Long and Prosper'):
    print('Welcome', name, '-', message)

greeter('Eloise')

# Welcome Eloise - Live Long and Prosper
```

## Optional parameters

````py
def func_with_optional(non_optional, optional_param=None):
  if optional_param is not None:
    # Do something with specific value
  else:
    # Run standard process


## Function with arbitrary parameter list

```python
def greeter(*args):
    for name in args:
        print('Welcome', name)

greeter('John', 'Denise', 'Phoebe', 'Adam', 'Gryff', 'Natalia')

"""
Welcome John
Welcome Denise
Welcome Phoebe
Welcome Adam
Welcome Gryff
Welcome Natalia
"""
````

## Scoping

Function variables are locally scoped by default.

They can access variables that are outer to them and can redefine them within
their own scope _and_ within the global scope using the keywords `global` and
`nonlocal`.

Below a global variable is accessed and changed but only internally within a
function scope

```py
max = 100
print('initial value of max:', max)

def print_max():
    global max
    max = max + 1
    print('inside function:', max)


print_max()
print('outside function:', max)

"""
initial value of max: 100
inside function: 101
outside function: 101
"""
```

Below a higher-scoped variable is redefined from within the lower scope:

```py
def myfunc1():
  x = "John"
  def myfunc2():
    nonlocal x
    x = "hello"
  myfunc2()
  return x

print(myfunc1())

# hello
```

We cannot however redefine a global variable from a function scope permanently.
It will remain whatever it is in global scope, after the function has run.
