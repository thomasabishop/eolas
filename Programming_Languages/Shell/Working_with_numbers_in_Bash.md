---
categories:
  - Programming Languages
tags:
  - shell
---

# Working with numbers in Bash

We distinguish:

- **arithmetic expansion** `$(( ))`
  - returns the result of literal numbers that can then be stored in a variable
- **artihmetic evaluation** `(( ))`
  - perform calculations on _existing_ variables

An example of expansion:

```bash
a=3
((a += 3))
echo $a
# 6
((a++))
# 7
```

> Note: we do not use a dollar-sign when referring to variables within arithmetic evaluation, there is no need. If we do, we get an error. This is because we are using an [expansion](/Programming_Languages/Shell/Expansions_and_substitutions.md), therefore the variables are already being interpreted as variables.

## Declaring variables as integers

It is good practice to safeguard against Bash treating numbers as strings to declare them as integers in addition to using arithmetic evaluation, e.g:

```bash
declare -i b=3
```

Whilst this isn't a strict type, it means we can do this:

```bash
b=$b+4
echo b
# 7
```

Without getting `3+4` in return

## No decimals in bash

Bash does not support decimal calculations natively. This is what you'd get for example:

```bash
echo $(( 1/3 ))
# 0 (not 0.33)
```

So work with decimals you should use `awk` or `bc` ("basic calculations").

Example of using `bc`:

```bash
declare -i c=1
declare -i d=3
e=$(echo "scale=3; $c/$d" | bc)
# 0.333
```

## Random numbers

Generate a pseudo-random number between 1 and 20:

```bash
echo $(( 1 + RANDOM % 10))
# 18
```
