---
tags: [python, JSON]
created: Tuesday, June 25, 2024
---

# Working with JSON in Python

## `json.loads()`

Convert a string containing JSON data into the native Python dictionary object.
Equivalent to `JSON.parse()` in JavaScript.

Will error if the input string is not properly formatted JSON. This will be
`json.JSONDecodeError`, a subclass of the `ValueError`
[exception](Error_handling_in_Python.md)

## `json.dumps()`

Take a JSON-formatted dictionary and convert it into a string. The reverse of
`json.loads()` and equivalent to `JSON.stringify()` in JavaScript.

## `json.dump()`

Not to be confused with the above. Output a Python dictionary as JSON, for
instance to create a `.json` file:

```py
data = { "key": "value"}
with open("some/directory/output.json", "w") as f:
    json.dump(data, f, indent=4)
```
