---
tags: [python]
---

# Error handling and exceptions in Python

Errors can typically occur in the following scenarios:

- A file or resource that is referred to does not exist
- A network connection fails
- A module import error occurs

In these scenarios you would want to allow for error handling, so that you can
detect errors and respond appropriately.

## Difference between errors and exceptions.

Python distinguises between errors and exceptions.

- An error typically indicates a situration where something goes wrong before
  the execution of the program begins.
- An exception arises during the execution of the program

In contrast to a error, when an exception occurs, the program doesn't
necessarily stop immediately. Instead, Python provides a way to handle the
exception, allowing you to potentially recover from it, or at least, to handle
it gracefully before the program stops.

However if you do not implement exception handling, the program will stop
immediately when an exception occurs, similar to a error.

## The Exception hierarchy

Errors and Exceptions are objects in Python and there is no real syntactic
distinction between the two since all errors and exceptions in herit from a base
exception class.

The root class is `BaseException` which all errors and exeptions extend as
subclasses as demonstrated by this diagram:

![](/img/python-exception-hierarchy.png)

## Exception syntax

### Difference between `raise` and `except`:

- `raise` is used to explicitly trigger an exception - it means that you are
  signalling that an exception condition _has_ occured in your program.
- `except` is used in conjunction with `try`blocks to catch and handle
  exceptions. Here you are saying "I think this _might_ cause an exception, so
  let's be prepared to handle it".

Exaple of `raise`:

```py
x = -10
if x < 0:
    raise ValueError("The value should not be negative!")
```

Example of `except`:

```py
try:
    result = 10 / 0
except ZeroDivisionError:
    print("You can't divide by zero!")

```

### Scaffolding exception handling

There is a general procedure for handling exceptions denoted by certain
keywords:

- `try`
  - The process you want to run
- `except`
  - The errors that could occur. You can have multiple `except` clauses for
    different exceptions
- `else`
  - Some code you want to run after each of the `except` clauses have run
  - It must be written after the `except` clauses
  - It runs **if and only if** no exceptions were raised
  - If `try` succeeds or an exception is thrown, `else` will not run
- `finally`
  - What you want to run at the end of the `try, except, else` sequence

```py
try
    run_calculation(7)
except ZeroDivisionError:
    print('something')
except IndexError:
    print('something')
except FileNotFoundError:
    print('something')
except Exception:
    print('something')
else
    # Do something after the exception blocks
finally
    # Do concluding action
```

## Custom exceptions

You can create your own custom exceptions by creating a class that inherits from
the `Exception` class.

```py
class CustomError(Exception):
    pass

try:
    raise CustomError("This is a custom exception!")
except CustomError as e:
    print(f"Caught an exception: {e}")
```
