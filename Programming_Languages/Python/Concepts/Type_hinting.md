---
categories:
  - Programming Languages
tags: [python, types]
---

# Type hinting in Python

With type hinting we can add type information to variables, functions, and classes. This is not enforced by the Python interpreter but can be used by external tools like `mypy` to check the code.

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

// TODO: Give examples of lists, tuples, dictionaries, sets

## Custom dictionay types

We can create custom dictionay types in the manner of TypeScript types and interfaces as follows:

```py
class ArticleInfo(TypedDict):
    timestamp: str
    article_title: str
    link: str
```

We could then use it thus:

```py
def parse_articles() -> List[ArticleInfo]:
```

## Optional types

`Optional` can be used to indicate that a variable can be `None` or the specified type.

```py
from typing import Optional

def find_index(numbers: List[int], target: int) -> Optional[int]:
    try:
        return numbers.index(target)
    except ValueError:
        return None
```

The function above returns an `int` or `None`.

## Union types

`Union` can be used to indicate that a variable can be one of several types.

```py
from typing import Union

def add(a: Union[int, float], b: Union[int, float]) -> Union[int, float]:
    return a + b
```

The function above returns an `int` or `float`.

> Note that in the case of `Optional` and `Union` the type is specified using square brackets. This is a syntactic covnention and does not denote that the return type is a list. Below is an example of how we would use type hinting to indicate that the return type actually is a list:

```py
from typing import List, Union
def my_function() -> List[int]:
    return [1, 2, 3]

# And to show a return type of a list of integers or floats:

def my_function() -> List[Union[int, float]]:
    return [1, 2, 3]
```
