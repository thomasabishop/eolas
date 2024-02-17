---
tags: [python]
---

# Lambdas in Python

In Python, anonymous functions like arrow-functions in JavaScript (`() => {}`)
are immediately invoked and unnamed. They are called lambdas.

Whilst they are unnamed, just like JS, the value they return can be stored in a
variable. They do not require the `return` keyword.

They are most often used unnamed with the functional methods
[map, filter](Map_and_filter_in_Python.md)
and reduce.

Here is the two syntaxes side by side:

```js
// JavaScript

const double = (x) => x * x;
```

```py
# Python

double = lambda x: x * x
```

Here is a lambda with multiple parameters:

```py
func = lambda x, y, z: x + y + z
print(func(2, 3, 4))
# 9
```

> Lambdas obviously enshrine functional programming paradigms. Therefore they
> should be pure functions, not mutating values or issueing side effects. For
> example, it would be improper (though syntactically well-formed) to use a
> lambda to `print` something
