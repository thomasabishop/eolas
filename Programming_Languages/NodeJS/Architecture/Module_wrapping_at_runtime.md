---
categories:
  - Programming Languages
tags:
  - backend
  - node-js
---

## The Module Wrapper Function

When Node runs each of our module files are wrapped within an
immediately-invoked function expression that has the following parameters:

```js
(function (exports, require, module, __filename, __dirname))

```

This is called the **module wrapper function**

Note that one of these parameters is the
[module object](Modules.md#structure-of-a-module).

Within any module we can access these parameters: you can think of them as
metadata about the module itself. `__filename` and `__dirname` are particularly
useful when writing to files and modifying directories.
