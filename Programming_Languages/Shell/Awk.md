---
categories:
  - Programming Languages
tags:
  - shell
  - awk
---

# Awk

> Awk is a programming language designed for text processing and data extraction. It was created in the 1970s and remains widely used today for tasks such as filtering and transforming text data, generating reports, and performing basic calculations. Awk is known for its simplicity and versatility, making it a popular tool for Unix system administrators and data analysts.

## Invocation

We can use `awk` directly in `stdin` or we can reference `.awk` files for more elaborate scripts

```bash
# CLI
awk [program] file1, file2, file3

# Script file
awk -f [ref_to_script_file] file1, file2, file3
```

We can also obviously pipe to it.

## Syntactic structure

An `awk` program consists in a sequence of pattern-action statements and optional functional definitions. `awk` is line-oriented.

### Patterns and actions

The basic structure of an `awk` script is as follows:

```
pattern {action}
```

A **pattern** is what you want to match against. It can be a literal string or a regex. The **action** is what process you want to execute against the lines in the input that match the pattern.

The following script prints each line of input that contains the word "error":

```bash
/error/ {print} file.tx
```

`/error/` is the patttern and `{print}` is the action.

### Lines, records, fields

When `awk` receives a file it divides the lines into **records**.

Each line `awk` receives is broken up into a sequence of **fields**.

The fields are accessed by special variables:

- `$1` reads the first field, `$2` reads the second field and so on.

- The variable `$0` refers to the whole recordk

### Patterns and actions

### Variables

Variables are denoted with a leading `$`. The fields of input are denoted sequentially with `$1, $2, $3...`

This script prints the first and third fields of each line of input:

```bash
{ print $1, $2 }
```

https://zetcode.com/lang/awk/
