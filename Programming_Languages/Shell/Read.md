---
categories:
  - Programming Languages
tags:
  - shell
---

# `read`

The primary use of `read` is to capture user input from `stdin`. It is also often used frequently to parse strings or files that are redirected to it (with `<` and `<<`) or piped to it. In each case, what is read is stored as a variable.

`read` will parse line by line using a space (`\n`) as the default delimiter. You can use IFS to parse by other characters and/or [split the contents into an array](/Programming_Languages/Shell/Split_into_array.md).

## Example of capturing user input

```bash
$ read var1 var2
$ thomas bishop # user inputs this
$ echo $var2
$ bishop
```

> If you don't specify variables, `read` will automatically parse using whitespace

## Example of piping to `read`

This reads the files in a directory and passes the file names to `read`.

```bash
find -type -f  -not -path "./.git/" | read $fname
```

## Example of parsing a file

We will typically read from a source and then do something with each variable that `read` returns, e.g:

```bash
while read var; do
  if [var == 'something']; then
    # do something
done < './input-file.txt
```

## `$REPLY`

If you do not assign a variable name to store the value that `read` reads a default (`$REPLY`) is applied. You can reference this value in your code.

For example the following loop does something if `$REPLY` is equal to an empty string:

```bash
while read;
do
    ((count++))
    if [[ -z "$REPLY" ]]; then
        echo "$count"
    fi
done < "$input
```
