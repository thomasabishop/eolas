---
categories:
  - Programming Languages
tags: [python, testing]
---

## Testing Python code

### `pytest`

Pytest is the most popular testing library for Python.

It is not included with the Python standard library so it must be installed with [pip](/Programming_Languages/Python/Concepts/Python_package_management.md). While it does not include a declaration library, it is robust enough to handle most scenarios having a rich and expressive set of constructs and decorators that let you declare what your tests should do, under what conditions they should run, and how they should interact with the rest of your system.

### Using `pytest`

- Pytest will automatically detect test files so long as they are named appropriately. E.g. for a module called `lorem`, it will detzect the unit test files `lorem_test.py` and `test_lorem.py`.
- In order to detect tests it should be run from a directory level above them

### Examples

Here is a basic example of using pytest for a local module callled `palindrome`:

```py
from palindrome.palindrome import is_palindrome


def test_is_palindrome():
    assert is_palindrome('soros')
    assert is_palindrome('torot')
    assert not is_palindrome('chair')
```
