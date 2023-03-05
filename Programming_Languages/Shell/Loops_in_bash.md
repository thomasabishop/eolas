---
categories:
  - Programming Languages
tags:
  - shell
---

# Loops in bash

## Loop through an array

```bash
for element in "${arr[@]}"
do
    echo "$element"
done
```

## Traditional for loop with upper and lower increment range

```bash
for (( i=0; i<=5;i++  )); do
  echo $i
done

# 1 2 3 4 5
```
