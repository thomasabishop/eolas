---
tags:
  - shell
  - data-structures
---

# Arrays in Bash

We define an array as follows:

```bash
words=(here are some words)
```

We can also explicitly define an array using `declare` :

```bash
declare -a words=("element1" "element2" "element3")
```

## Index notation

We access specific array elements by their index using the same braces style we
use with variables:

```bash
echo "${words[2]}"

# element3
```

## Iterating through arrays

```bash
for i in "${words[@]}"
do
   echo "$i"
   # or do whatever with individual element of the array
done
# element1 element2 element3
```

Note that `@` here is a special symbol standing for all the members of the
`words` array.

## Sorting arrays

### Sorting an integer array highests to lowest

```bash
sorted_array=($(echo "${array[@]}" | tr " " "\n" | sort -nr))
```

Where `array` is the name of the original array. The sorted array will be stored
in the `sorted_array` array.

The `sort` command sorts the input in reverse numerical order (`-n` for
numerical sort and `-r` for reverse sort). The `tr` command is used to convert
the spaces in the array to newline characters so that each element is sorted on
a separate line.

## Pushing, appending to an array

We use the `+=` shorthand to add elements to a preexisting array:

```bash
preExistingArray=(1 2 3)
preExistingArray+=(4)
echo preExistingArray
# 1 2 3 4

```

> Note that we have to put the item we want to addend within array brackets

## Check if array empty

```sh
an_array=()

if [ -z "${another_array[@]}" ]; then
    echo "Array is empty"
else
    echo "Array is not empty"
fi
```

Here we pass all the elements of the array to a
[test](Test_values_in_Bash.md) condition which
tests for an empty string.

> NB: This will not immediately work in the context of a function. See below.

## Weirdness with functions

When you pass an array as an argument to a
[function](Functions_in_Bash.md) it will not
immediately be understood to be an array.

When we use `$1` to individuate the first function argument this is read as
string. So if you parsed an array argument as `$1`, any logic you have in the
function will work on the assumption that the argument is a string, not an
array.

To get round this we have to effectively _redeclare_ the argument as an array
before running any array logic. We do this through a **nameref** (a reference to
a variable). The nameref resolves to the value of the variable it references.
This allows you to indirectly manipulate the value of the original variable
through the nameref.

A nameref is created with the `-n` flag. The following function uses this method
to check if an array is empty:

```sh
function array_empty() {
    declare -n arr=$1
    if [ ${#arr[@]} -gt 0 ]; then
        echo "array is not empty"
    else
        echo "array is empty"
    fi
}

my_array=()
array_empty "my_array"
```

You'll notice when we invoke the function we pass the array as a string, this
facilitates the nameref operation in the function.

## Associational arrays / maps

With Bash 4 we gained an additional array-like data structure that is key-value
based and similar to maps in other languages.

```bash
declare -A rock=(["win"]="scissors" ["lose"]="paper")
```

We would then individuate a value with `"${rock[win]}"`

## Lists as implicit string arrays

When we use the term **list** in bash, we are not actually referring to a
specific type of data structure. Instead a **list variable** is really just a
normal variable wrapped in quote marks that has strings separated by spaces.
Despite the fact that this is not an actual iterative data structure, we are
still able to loop through variables of this type.

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

We are leveraging this aspect of Bash when we
[loop through each character in a string](Strings_in_bash.md#loop-through-each-character-in-a-string).
