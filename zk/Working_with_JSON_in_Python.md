---
id: mjia
title: Working with JSON in Python
tags: [python, JSON]
created: Tuesday, June 25, 2024
---

# Working with JSON in Python

## `json.loads()`

Convert a string containing JSON data into the native Python dictionary object.
Equivalent to `JSON.parse()` in JavaScript.

Will error if the input string is not properly formatted JSON. This will be
`json.JSONDecodeError`, a subclass of the `ValueError`
[exception](./Error_handling_in_Python.md)

## `json.parse()`

Take a JSON-formatted dictionary and convert it into a string. The reverse of
`json.loads()` and equivalent to `JSON.stringify()` in JavaScript.

## JSON errors

The `.loads()` and `.parse()` methods will throw an error if the input string is

## Related notes
