---
tags:
  - shell
---

# Variable indirection

> Write proper notes on this

```sh
function array_empty() {
    declare -n arr=$1
    # Proceed if array not empty:
    if [ ${#arr[@]} -gt 0 ]; then
        return 1 # array is not empty
    else
        return 0 # array is empty
    fi
}

my_array=(1 2 3)

function push() {
    # $1 = stack name
    local stack_name="$1"
    if [ "${stack_name}" ]; then # stack exists
        if array_empty "${!stack_name}"; then
            echo "stack is empty"
        else
            echo "stack is not empty"
        fi
    else
        echo "Error: ${stack_name} does not exist."
    fi
}

push "my_array"

```

In Bash scripting, ${!stack_name} is an example of indirect variable referencing
or variable indirection. It's a way to use a variable whose name is stored in
another variable.

Let's break it down:

`${stack_name}`: This syntax is used to reference the value of a variable. So if
stack_name="my_array", then ${stack_name} would return "my_array".

`${!stack_name}`: Adding the ! introduces indirection. Now, instead of getting
the value of stack_name, you get the value of the variable whose name is stored
in stack_name. So if stack_name="my_array" and my_array=(1 2 3), then
${!stack_name} would return (1 2 3).

So, in the context of your script, `${!stack_name} allows you to pass the name
of an array (as a string) to your push function, and then use that string to
indirectly reference the actual array within the function.
