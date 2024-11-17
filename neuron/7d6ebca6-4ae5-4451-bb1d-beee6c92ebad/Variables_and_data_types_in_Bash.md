---
tags:
  - shell
---

# Variables and datatypes in Bash

## Types

## Variables

We use the equality symbol to create a variable:

```bash
stringVar="My first variable"
floatVar="50.3"
boolVar="true"
```

As there is no typing in bash, the names of these variables are purely notional.

To invoke a variable we use special brackets:

```bash
echo ${stringVar} # My first variable
echo ${floatVar} # 50.3
echo ${boolVar} # true
```

- Quotation marks at declaration are also not strictly necessary however they
  can help avoid bugs. Also serves as a reminder that every type is basically a
  string at the end of the day

## Common operations

### Check if a variable exists

```sh
if [ -v variable_name ]; then
    echo "The variable exists."
else
    echo "The variable does not exist."
fi
```

### Check if a variable is set (defined)

```sh
if [ -z "${variable_name+x}" ]; then
    echo "The variable does not exist."
else
    echo "The variable exists."
fi
```

## Parameter expansion

Still not very clear on this.
