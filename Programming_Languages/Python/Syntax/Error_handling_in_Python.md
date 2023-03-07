---
categories:
  - Programming Languages
tags: [python]
---

# Error handling and exceptions in Python

Errors can typically occur in the following scenarios:

- A file or resource that is referred to does not exist
- A network connection fails
- A module import error occurs

In these scenarios you would want to allow for error handling, so that you can detect errors and respond appropriately.

## Difference between errors and exceptions.

Errors and exceptions are both types of runtime problems that can occur in the program however they slightly different from each other.

In essence, errors are problems in the program's code that prevent it from running. Exceptions are raised by the program itself when it encounters a problem at runtime that it can't handle.

<dl>
    <dt><b>Errors</b></dt>
    <dd> are problems that occur at runtime that prevent the program from executing successfully. Errors are usually caused by issues in the program's code, such as syntax errors or logical errors. Examples of errors in Python include NameError, SyntaxError, and TypeError.</dd>
    <dt><b>Exceptions</b></dt>
    <dd>are raised by the program itself when it encounters an unexpected situation at runtime that it cannot handle. These typically arise from user-interaction rather than as a result of errors that a programmer has made. Exceptions allow the program to gracefully handle errors and continue running without crashing. Examples of exceptions in Python include ZeroDivisionError, FileNotFoundError, and TypeError.</dd>
</dl>

## The Exception hierarchy

Errors and Exceptions are objects in Python and there is no real syntactic distinction between the two since all errors and exceptions in herit from a base exception class.

The root class is `BaseException` which all errors and exeptions extend as subclasses as demonstrated by this diagram:

![](/_img/python-exception-hierarchy.png)

## Exception syntax

There is a general procedure for handling exceptions denoted by certain keywords:

// TODO: Add difference between throw and exception object

- `try`
  - The process you want to run
- `except`
  - The errors that could occur. You can have multiple `except` clauses for different exceptions
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

// TODO: Get ChatGPT to give me a medium length overview
