---
categories:
  - Programming Languages
tags: [python, data-types]
---

# None in Python

`None` is not `null`, it is closer to `undefined` in JS. If you define a
variable as `None`, the variable exists, it is just not yet defined.

Using `None` is a pattern similar to using `let` in JS to name a variable and
definine it later on.

```python
temperature = None
```

If we logged `temperature` it would give us `None` rather than a null pointer
error.

With None we can use `is None` and `is not None`, special predicates for working
with `None` only. This is a akin to using `if (x !== undefined)` in TypeScript

```python
winner = None
print('winner:', winner)
# winner: None
print('winner is None:', winner is None)
# winner is None: True
print('winner is not None:', winner is not None)
# winner is not None: False
print(type(winner))
# <class 'NoneType'>
# Now set winner to be True
print('Set winner to True')
# Set winner to True
winner = True
print('winner:', winner)
# winner: True
print('winner is None:', winner is None)
# winner is None: False
print('winner is not None:', winner is not None)
# winner is not None: True
print(type(winner))
# <class 'bool'>
```
