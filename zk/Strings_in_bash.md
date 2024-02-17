---
tags:
  - shell
  - data-types
---

# Strings in bash

## Return a substring by index

```bash
myString="hello"
substring=${myString:0:3}
# hel
```

This is often used when looping through each character in a string.

## Loop through each character in a string

```bash
str="hallelujah"
stringLength=$(expr length str)

for (( i=0; i<=${stringLength}; i++ )); do
    echo "${str:$i:1}"
done
```
