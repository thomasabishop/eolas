---
tags:
  - Programming_Languages
  - shell
---

## Types

 > 
 > There is no typing in bash!

* Bash variables do not have types thus bash is neither loosely or strictly typed. Anything you apply the identity operator against becomes a character string variable.
* Bash is however able to distinguish numerical strings which is why arithmetic operations and comparisons work.
* Consequently there is no `null` type either. The closest thing is an empty string, i.e. `APPROX_NULL=""` .

## Variables

### Variables that hold character strings

As noted we use the equality symbol to create a variable:

````bash
PRIM_VAR_STR="My first variable"
PRIM_VAR_FLOAT="50.3"
PRIM_VAR_BOOL="true"
````

As there is no typing in bash, the names of these variables are purely notional.

To invoke a variable we use special brackets:

````bash
echo ${PRIM_VAR_STR} # My first variable
echo ${PRIM_VAR_FLOAT} # 50.3
echo ${PRIM_VAR_BOOL} # true
````

* there is no compunction to use capitals for variables but it can be helpful to distinguish custom variables from program variables (see below)
* quotation marks at declaration are also not strictly necessary however they can help avoid bugs. Also serves as a reminder that every type is basically a string at the end of the day

### Variables that hold references to programs

We can store a reference to a bash program with slightly different syntax:

````bash
user="$(whoami)"
````

When we want to invoke a program variable we don't need to use brackets:

````bash
echo $user # thomasbishop
````

 > 
 > Note that when we declare anything in bash (any time `=` is used) we **do not use spaces!** If you do, the variable will not be set.

## Declarations

You can achieve a sort of typing through the `declare` keyword, although bear in mind this is not enforced and you do not have to use it.

### `-r` : readonly

````bash
declare -r var1="I'm read only"
````

Roughly equivalent to a `const` : if you attempt to change the value of `var1` it will fail with an error message.

### `i` : integer

````bash
declare -i var2="43"
````

The script will treat all subsequent occurrences of `var2` as an integer

### `a` : array

````bash
declare -a anArray
````
