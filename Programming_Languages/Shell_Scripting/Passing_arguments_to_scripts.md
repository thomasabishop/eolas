---
tags:
  - Programming_Languages
  - shell
---
# Passing arguments to scripts
## Relation between commands and programs

Whenever we issue a command in bash we are really running an executable program that is associated with the command. This is why when we create our own bash scripts we must run `chmod` to make them executables. When we issue a command like `./file.sh` we are running an executable program.

How come, however that when we use a program like `cd` or `npm` we don’t have to type `./cd.sh` or `./npm.sh` ? Remember from our discussion of the `PATH` environment variable that whenever we use inbuilt commands like `ls` and `cd` we are automatically sourcing them from the binary directory because we have these directories in our `PATH` . Hence the shell knows in advance what these commands mean. In the case of custom scripts, these aren’t typically added to the `PATH` so we have to source them in order to run them.

## Passing arguments

If you think about it, a script is really just a function that runs when you source it. As such there needs to be a way for you to pass data to the function so that it can actually act like a function and take arguments. When we use for example `cd ./Desktop` we are passing a directory name as an argument to the `cd` program. We can do the same thing with our custom bash scripts.

To pass an argument we simply add the values after the script in the command. For example:

````bash
./arguments.sh Thomas 33
````

The script is as follows:

````bash
#!/bin/bash

echo "File is called $0"
echo "The arguments provided are $@"
echo "The first argument is $1"
echo "The second argument is $2"
echo "Your name is $1 and you are $2 years old"
````

This outputs:

````
File is called ./arguments.sh
The arguments provided are Thomas 33
The first argument is Thomas
The second argument is 33
Your name is Thomas and you are 33 years old
````

Some points to note on syntax. The `$` is used to individuate the script itself and its arguments.

* Each argument passed is accessible from an index starting at `1` (`$1`)
* The script itself occupies the `0` position, hence we are able to log the name of the script at line 1 `$0` )
* To log the arguments as a group (for instance to later loop through them) we use `$@` .
* To get the number of arguments use `$#`
