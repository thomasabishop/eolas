---
categories:
  - Programming Languages
tags:
  - shell
---

# Passing arguments and options to Bash scripts

## Relation between commands and programs

Whenever we issue a command in bash we are running an executable program that
the command token references. This is why when we create our own bash scripts we
must run `chmod` to make them executable. When we issue a command like
`./do_something.sh` we are running an executable program.

When we run a program like `cd` or `npm` we don’t have to type `./cd.sh` or
`./npm.sh`. This is because a reference to the program file is already in our
[`$PATH`](/Programming_Languages/Shell/The_PATH.md).

In the case of `cd`, this is an in-built program and as such it will be sourced
from a binary and we have a reference to the binary in path. In the case of
`npm`, this is not an in-built program however in order to run it we must
already have it in our `PATH`.

## Passing arguments

A script is really just a function that runs when you source it. As such there
needs to be a way for you to pass data to the function so that it can actually
act like a function and take arguments. When we use for example `cd ./Desktop`
we are passing a directory name as an argument to the `cd` program. We can do
the same thing with our custom bash scripts.

To pass an argument we simply add the values after the script in the command.
For example:

```bash
./arguments.sh Thomas 33
```

We can use built-in variables to return information about the invocation of this
script:

```bash
#!/bin/bash

echo "File is called $0"
echo "The arguments provided are $@"
echo "The first argument is $1"
echo "The second argument is $2"
echo "Your name is $1 and you are $2 years old"
echo "There were $# arguments"
```

This outputs:

```
File is called ./arguments.sh
The arguments provided are Thomas 33
The first argument is Thomas
The second argument is 33
Your name is Thomas and you are 33 years old
There were 2 arguments.
```

Key points:

- `$0` designates the script or function that is being executed
- `$@` designates a list of all the arguments that are passed to the script
- `$1...` designates each individual argument
- `$#` gives us a count of the number of arguments

## Passing options

Options differ from arguments in that they are prepended with `-` and they can
be passed in any order. We use the `getops` program to parse the options that
the user inputs with their command.

We can demonstrate this with a script that takes in a username and password as
options.

We can handle an option-based input like:

```
some-program -u thomas -p password123
```

With the following construct:

```sh
while getopts u:p: option; do
  case $option in
    u) user=$OPTARG;;
    p) pass=$OPTARG;;
  esac
done

echo "user: $user / pass: $pass"
```

Which returns:

```
user: thomas / pass: password123
```

Here we set up a `while` loop against the `getopts` command to parse the options
in the stdin and store each one in a `option`. We run each `option` through a
case statement and individuate each one, storing them in dedicated local
variables via the global `$OPTARG` variable

### The role of the colons

Using a colon after each option means that the script will expect the given
option to have a value. If we put a colon _before_ each of the options we expect
this will allow us to view any option the user provides in our option handler.
This is useful when you are working with very many options, as with a
command-line program.

This version demonstrates a more exhaustive use case:

```sh
while getopts :u:p: option; do
  case $option in
    u) user=$OPTARG;;
    p) pass=$OPTARG;;
    a) echo "got the 'a' flag";;
    b) echo "got the 'b' flag";;
    ?) echo "Don't know what $OPTARG is!"
  esac
done

```
