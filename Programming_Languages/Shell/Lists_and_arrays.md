---
categories:
  - Programming Languages
tags:
  - shell
---

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

## Looping through file system

The following script loops through all files in a directory that begin with `l` and which are of the bash file type (`.sh`) :

```bash
for x in ./l*.sh; do
    echo -n "$x "
done
echo
```
