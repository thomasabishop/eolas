---
categories:
  - Programming Languages
tags:
  - shell
---

# Functions in Bash

We don't name function parameters in the function declaration. Instead we have
an implied index of arguments: `$1, $2, $3,...`. When the function is called,
the first value after the function name becomes `$1` by default, then the
subsequent arguments.

```bash
function expandRange() {
    declare -a expandedRange=()
    for (( i=$1; i<=$2; i++ )); do
        expandedRange+=($i)
    done
    echo "${expandedRange[@]}"
}
```

```bash
expandedRange=$(expandRange 1 4)
echo $expandedRange
# 1 2 3 4
```

## Get all arguments as an array

We can access all the arguments passed to a function using the `$@` syntax we
encountered before when
[passing arguments to scripts](Passing_arguments_to_Bash_scripts.md).
(Here a function is a kind of script in miniature so the process is the same.)

```sh
function numberThings() {
  i=1
  for f in "$@"; do
    echo $i: "$f"
    (( i++ ))
  done
}
```

## Local variables

```sh
var1="I'm variable 1"

function myfunction() {
  var2="I'm variable 2"
  local var3="I'm variable 3"
}

myfunction
echo $var1
echo $var2
echo $var3

# I'm variable 1
# I'm variable 2
```

> The convention is to put functions at the top of the script, after the shebang
> and after the global variables
