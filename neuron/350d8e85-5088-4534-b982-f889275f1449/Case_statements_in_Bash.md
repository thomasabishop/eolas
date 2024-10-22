---
tags:
  - shell
---

# Case statements in Bash

Usage against a variable

```sh
animal="dog"
case $animal in
    bird ) echo "Avian";;
    dog|puppy ) echo "Canine";;
    * ) echo "No match";;
esac
```

Usage as part of a function:

```bash
function convertCharToInt {
    case $1 in
        A|X )
            echo 1 ;;
        B|Y )
            echo 2 ;;
        C|Z )
            echo 3 ;;
        *)
            echo ;;
    esac
}
```

Usage:

```bash
declare -i intValue = $(convertCharToInt B)
```
