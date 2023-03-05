---
categories:
  - Programming Languages
tags:
  - shell
---

# Functions in Bash

- We don't name function parameters in the function declaration. Instead we have an implied index of arguments: `$1, $2, $3,...`. When the function is called, the first value after the function name becomes `$1` by default.

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
