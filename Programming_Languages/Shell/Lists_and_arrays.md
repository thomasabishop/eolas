---
categories:
  - Programming Languages
tags:
  - shell
  - data-structures
---

# Lists and arrays in Bash

## List variables

When we use the term **list** in bash, we are not actually referring to a specific type of data structure. Instead a **list variable** is really just a normal variable wrapped in quote marks that has strings separated by spaces. Despite the fact that this is not an actual iterative data structure, we are still able to loop through variables of this type.

```bash
A_STR_LIST="cat dog hamster"
AN_INT_LIST="1 2 3"
```

To iterate through a list variable, we can use a for loop:

```bash
for ele in $A_STR_LIST; do
    echo $ele
done
```

## Arrays

We define an array as follows:

```bash
words=(here are some words)
```

We can also explicitly define an array using `declare` :

```bash
declare -a words=("element1" "element2" "element3")
```

### Index notation

We access specific array elements by their index using the same braces style we use with variables:

```bash
echo ${words[2]}

# element3
```

### Iterating through arrays

```bash
for i in "${words[@]}"
do
   echo "$i"
   # or do whatever with individual element of the array
done
# element1 element2 element3
```

Note that `@` here is a special symbol standing for all the members of the `words` array.

### Sorting arrays

#### Sorting an integer array highests to lowest

```bash
sorted_array=($(echo "${array[@]}" | tr " " "\n" | sort -nr))
```

Where `array` is the name of the original array. The sorted array will be stored in the `sorted_array` array.

The `sort` command sorts the input in reverse numerical order (`-n` for numerical sort and `-r` for reverse sort). The `tr` command is used to convert the spaces in the array to newline characters so that each element is sorted on a separate line.

## Looping through file system

The following script loops through all files in a directory that begin with `l` and which are of the bash file type (`.sh`) :

```bash
for x in ./l*.sh; do
    echo -n "$x "
done
echo
```

## Associational arrays / maps

With Bash 4 we gained an additional array-like data structure that is key-value based and similar to maps in other languages.

```bash
declare -A rock=(["win"]="scissors" ["lose"]="paper")
```

We would then individuate a value with `"${rock[win]}"`
