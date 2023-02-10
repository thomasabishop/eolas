---
categories:
  - Programming Languages
tags:
  - shell
---

# Test values in Bash

`test` is a built-in command that is used to compare values or determine whether something is the case.

We can use the command `test` but it is more common to test a condition implicity by using square brackets. The square brackets are an alias for `test`. We use this alias when we use `IF` logic.

When we run a test the result we get back is a return status of a `0` or a `1`. `0` indicates that the test was a success and `1` means failure. (Bear in mind this is in contrast to most all other programming languages.)

If we run a test in the command line we won't get a `0` or a `1` or back, there will just be silence from the shell. We can explicitly invoke the return value with variable `$?`, e.g:

```bash
[ -d ~ ] # is the home directory a directory?
echo $?
0   # yes

[ -d /bin/zsh ] # is this binary a directory?
echo $
01  # no
```

## Test structures

Many tests can be run with flags as a shorthand like we saw above:

### File operators

```
-a FILE        True if file exists.
-d FILE        True if file is a directory.
-e FILE        True if file exists.
-h FILE        True if file is a symbolic link.z
-s FILE        True if file exists and is not empty.
-N FILE        True if the file has been modified since it was last read.
```

### String operators

```
-z STRING      True if string is empty.
-n STRING      True if string is not empty.
```

## Differences between comparing numbers and strings

- `=` is reserved for comparing strings
- For numbers we use, e.g, `[ 4 -lt 5 ]`

## Negation

We can negate a test condition with `!`:

```bash
[ ! 4 -lt 3 ]; echo $?
0
```

## Extended test: `[[...]]`

When we use **double brackets** we are using _extended_ `test`.

The extended test supports the standard `test` comparisons and adds other features:

- The use of Boolean operators:
  ```
  [[ -d ~ || -a /bin/mash ]]; echo $?
  ```
