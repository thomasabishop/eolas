---
categories:
  - Programming Languages
tags:
  - shell
  - data-types
---

# Data types in Bash

> There is no typing in Bash

- Bash variables do not have types thus bash is neither loosely or strictly typed. Anything you apply the identity operator against becomes a character string variable.
- Bash is however able to distinguish numerical strings which is why arithmetic operations and comparisons work.
- Consequently there is no `null` type either. The closest thing is an empty string, i.e. `APPROX_NULL=""` .

## Declarations

You can achieve a sort of typing through the `declare` keyword, although bear in mind this is not enforced and you do not have to use it.

### `-r` : readonly

```bash
declare -r var1="I'm read only"
```

Roughly equivalent to a `const` : if you attempt to change the value of `var1` it will fail with an error message.

### `i` : integer

```bash
declare -i var2="43"
```

The script will treat all subsequent occurrences of `var2` as an integer

### `a` : array

```bash
declare -a anArray
```
