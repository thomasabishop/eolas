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

Therefore in these operations you would want to define explicit error handling contingencies, so that you can detect errors and respond appropriately.

## Difference between errors and exceptions.

Errors and exceptions are both types of runtime problems that can occur in the program however they slightly different from each other.

In essence, errors are problems in the program's code that prevent it from running. Exceptions are raised by the program itself when it encounters a problem at runtime that it can't handle.

<dl>
    <dt><b>Errors</b></dt>
    <dd> are problems that occur at runtime that prevent the program from executing successfully. Errors are usually caused by issues in the program's code, such as syntax errors or logical errors. Examples of errors in Python include NameError, SyntaxError, and TypeError.</dd>
    <dt><b>Exceptions</b></dt>
    <dd>are raised by the program itself when it encounters an unexpected situation at runtime that it cannot handle. Exceptions allow the program to gracefully handle errors and continue running without crashing. Examples of exceptions in Python include ZeroDivisionError, FileNotFoundError, and TypeError.</dd>
</dl>

## The Exception hierarchy

Errors and Exceptions are objects in Python and there is no real syntactic distinction between the two since all errors and exceptions in herit from a base exception class.

The root class is `BaseException` which all errors and exeptions extend as subclasses:

![](/_img/python-exception-hierarchy.png)
