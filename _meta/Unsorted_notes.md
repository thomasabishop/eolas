### Difference in import types Python

import x
requires dot notation to individuate different components in the module

from x import y

import a component directly from the module
removes the need to use dot notation to indviduate

### Complex filter function using lambdas

```py
def update_entries(old, new):
    """Merge old and new data, removing dupes"""
    combined = old + new
    seen = set()

    filter_func = lambda x: not (tuple(x) in seen or seen.add(tuple(x)))

    unique_combined = list(filter(filter_func, combined))
```

#### ChatGpt explanation

Certainly, the line

```python
filter_func = lambda x: not (tuple(x) in seen or seen.add(tuple(x)))
```

creates a lambda function that takes a single argument `x`, where `x` is expected to be a list. The function converts `x` to a tuple and checks for its existence in the `seen` set.

Here is a breakdown of the logic:

1. `tuple(x)`: This converts the list `x` to a tuple because lists are unhashable and cannot be stored in a set. Tuples, being immutable, can be stored in a set.

2. `tuple(x) in seen`: This checks whether the tuple form of `x` is already in the `seen` set.

3. `seen.add(tuple(x))`: This adds the tuple form of `x` to the `seen` set. The `add` method of a set returns `None`.

4. `tuple(x) in seen or seen.add(tuple(x))`: This combines the above two steps. The `or` operator returns the first "truthy" value it encounters, or the last value otherwise. Since `seen.add()` returns `None`, which is "falsy," this part will return `True` if `tuple(x)` was already in `seen`, and `None` otherwise. Importantly, if `tuple(x)` was not already in `seen`, it will be added.

5. `not (...)`: The `not` negates the result. So if `tuple(x) in seen` was `True`, `not True` would be `False`, causing the filter to skip this item. If `tuple(x) in seen` was `False`, `not None` would be `True`, causing the filter to include this item and also adding it to `seen`.

In summary, the lambda function acts as a filter that only returns `True` for the first occurrence of each unique list `x`, after converting it to a tuple for hashability and set membership tests. After a unique list has been seen once, any subsequent occurrences will cause the lambda function to return `False`, effectively filtering them out.
