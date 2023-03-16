---
categories:
  - Programming Languages
tags:
  - shell
---

# Passing arguments to scripts

## Relation between commands and programs

Whenever we issue a command in bash we are really running an executable program that is associated with the command. This is why when we create our own bash scripts we must run `chmod` to make them executable. When we issue a command like `./file.sh` we are running an executable program.

When we run a program like `cd` or `npm` we don’t have to type `./cd.sh` or `./npm.sh`. This is because a reference to the program file is already in our `$PATH`.

In the case of `cd`, this is an in-built program and as such it will be sourced from a binary and we have a reference to the binary in path. In the case of `npm`, this is not an in-built program however in order to run it we must already have it in our `PATH`.

## Passing arguments

A script is really just a function that runs when you source it. As such there needs to be a way for you to pass data to the function so that it can actually act like a function and take arguments. When we use for example `cd ./Desktop` we are passing a directory name as an argument to the `cd` program. We can do the same thing with our custom bash scripts.

To pass an argument we simply add the values after the script in the command. For example:

```bash
./arguments.sh Thomas 33
```

We can use built-in variables to return information about the invocation of this script:

```bash
#!/bin/bash

echo "File is called $0"
echo "The arguments provided are $@"
echo "The first argument is $1"
echo "The second argument is $2"
echo "Your name is $1 and you are $2 years old"
```

This outputs:

```
File is called ./arguments.sh
The arguments provided are Thomas 33
The first argument is Thomas
The second argument is 33
Your name is Thomas and you are 33 years old
```

Key points:

- `$0` designates the script or function that is being executed
- `$@` designates a list of all the arguments that are passed to the script
- `$1...` designates each individual argument
