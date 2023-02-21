---
categories:
  - Programming Languages
tags:
  - shell
---

# Case statements in Bash

```bash
function convertCharToInt {
    case $1 in
        A | X )
            echo 1
        ;;

        B | Y )
            echo 2
        ;;

        C | Z )
            echo 3
        ;;
        *)
            echo 0
        ;;
    esac
}
```

Usage:

```bash
declare -i intValue = $(convertCharToInt B)
```
