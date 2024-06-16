---
tags:
  - shell
---

# read

The primary use of `read` is to capture user input from `stdin`. It can also be
used to parse strings or files that are redirected to it (with `<` and `<<`) or
piped to it. In each case, what is read is stored as a variable.

`read` will parse line by line using a space (`\n`) as the default delimiter.
You can use IFS to parse by other characters and/or
[split the contents into an array](Split_into_array.md).

## Example of capturing user input

When we use `read` to gather user input, the script will pause until the input
is provided.

```bash
echo "What is your name?"
read name

echo "What is your password?"
read -s pass

read

```

> If you don't specify variables, `read` will automatically parse using
> whitespace

## Example of piping to read

Here we use [find](Find_Bash_command.md) to collate the files in
the current directory and then pipe them to read.

```bash
find -type -f  -not -path "./.git/" | read $fname
```

## Example of parsing a file

We will typically read from a source and then do something with each variable
that `read` returns, e.g:

```bash
while read line; do
  if [ var == 'something' ]; then
    # do something
done < './input-file.txt
```

## $REPLY

If you do not assign a variable name to store the value that `read` reads a
default (`$REPLY`) is applied. You can reference this value in your code.

For example the following loop does something if `$REPLY` is equal to an empty
string:

```bash
while read;
do
    ((count++))
    if [[ -z "$REPLY" ]]; then
        echo "$count"
    fi
done < "$input
```
