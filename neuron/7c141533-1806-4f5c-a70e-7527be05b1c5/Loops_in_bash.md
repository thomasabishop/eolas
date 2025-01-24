---
tags:
  - shell
---

# Loops in Bash

## Traditional for loop

```bash
for (( i=0; i<=5;i++  )); do
  echo $i
done

# 1 2 3 4 5
```

## `for..in`: loop through an array

```bash
for element in "${arr[@]}"
do
    echo "$element"
done
```

## While loop

> `while` loops execute while a condition is true (0)

We can use a `while` loop as a condition in two senses:

- execute while a given condition obtains
- expand and execute a given command as long as the final command in the `while'
  for the command has an exit status of zero (i.e. truthy)

Here is an exampe of using `while` in the former case:

```sh
declare -i n=0
while (( n<10 ))
do
  echo "n:$n"
  (( n++ ))
done
```

Here is an example of using `while` in the latter case:

```sh
while read line;
do
    # something
done < "$file_to_read"
```

## Until loop

> `until` loops execute until a condition is false (1)

```sh
declare -i m=0
until (( m==10 )): do
  echo "m:$m"
  (( m++ ))
done
```

This gives us the same output as `n` with the while loop but here it runs so
long as `m==10` is false. As soon as `m` is equal to 100, the condition becomes
true and hence the loop stops.
