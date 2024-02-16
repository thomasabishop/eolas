---
categories:
  - Programming Languages
tags: [python, types]
---

# Type hinting in Python

With type hinting we can add type information to variables, functions, and
classes. This is not enforced by the Python interpreter but can be used by
external tools like `mypy` to check the code.

Prior to 3.10, to use types you would have to import the types you wanted `from`
the `typing` module. With later versions you can use them directly without
importing from `typing`.

## Basic syntax

### Variables

```py
name: str = "John"
age: int = 30
```

### Functions

```py
def greet(name: str) -> str:
    return "Hello, " + name
```

### Classes

// TODO: Add examples

## Complex data types

We can type complex data types such as dictionaries, lists, tuples etc.

The following function takes a tuple comprising two integers as a parameter and
returns a list of ints:

```py
def populate_pair_values(pair: tuple[int, int]) -> list[int]:
    return [i for i in range(pair[0], pair[1] + 1)]
```

## Custom dictionary types

We can create custom dictionary types in the manner of TypeScript types and
interfaces as follows:

```py
class ArticleInfo(TypedDict):
    timestamp: str
    article_title: str
    link: str
```

We could then use it thus:

```py
def parse_articles() -> list[ArticleInfo]:
```

## Optional types

`Optional` can be used to indicate that a variable can be `None` or the
specified type.

```py
from typing import Optional

def find_index(numbers: list[int], target: int) -> Optional[int]:
    try:
        return numbers.index(target)
    except ValueError:
        return None
```

The function above returns an `int` or `None`.

Post 3.10, we don't need to use `Optional`, we can use a union to cover the
`None` case. Refactoring the previous example:

```py
def find_index(numbers: list[int], target: int) -> int | None:
    try:
        return numbers.index(target)
    except ValueError:
        return None
```

## Union types

`Union` can be used to indicate that a variable can be one of several types.

```py
from typing import Union

def add(a: Union[int, float], b: Union[int, float]) -> Union[int, float]:
    return a + b
```

The function above returns an `int` or `float`.

> Note that in the case of `Optional` and `Union` the type is specified using
> square brackets. This is a syntactic covnention and does not denote that the
> return type is a list. Below is an example of how we would use type hinting to
> indicate that the return type actually is a list:

```py
from typing import List, Union
def my_function() -> List[int]:
    return [1, 2, 3]

# And to show a return type of a list of integers or floats:

def my_function() -> List[Union[int, float]]:
    return [1, 2, 3]
```

Post 3.10 we can use `|` syntax instead of importing `Union`. E.g:

```py

def add(a: int | float, b: int | float) -> int | float:
    return a + b
```
