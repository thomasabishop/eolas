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

`awk` is a line-oriented language.

An `awk` program consists in a sequence of **pattern: action** statements and optional functional definitions.

For most of the examples we will use this list as the input:

```
cloud
existence
ministerial
falcon
town
sky
top
bookworm
bookcase
war
Peter 89
Lucia 95
Thomas 76
Marta 67
Joe 92
Alex 78
Sophia 90
Alfred 65
Kate 46
```

### Patterns and actions

The basic structure of an `awk` script is as follows:

```
pattern {action}
```

A **pattern** is what you want to match against. It can be a literal string or a regex. The **action** is what process you want to execute against the lines in the input that match the pattern.

The following script prints the line that matches `Joe`:

```bash
awk '/Joe/ {print}' list.txt
```

`/Joe/` is the patttern and `{print}` is the action.

### Lines, records, fields

![](/_img/awk-outline.png)

When `awk` receives a file it divides the lines into **records**.

Each line `awk` receives is broken up into a sequence of **fields**.

The fields are accessed by special variables:

- `$1` reads the first field, `$2` reads the second field and so on.

- The variable `$0` refers to the whole record

So, in the picture `cloud existence ministerial` corresponse to `$1` `$2` `$3`

## Basic examples

**_Match a pattern_**

```bash
awk '/book/ { print }' list.txt
# bookworm
# bookcase
```

**_Print all words that are longer that five characters_**

```bash
awk 'length($1) > 5 { print $0 }' list.txt
```

For the first field of every line (we only have one field per line), if it is greater than 5 characters print it. The "every line" part is provided for via the all fields variable - `$0`.

We actually don't need to include the `{ print $0 }` action, as this is the default behaviour. We could have just put `length($1) > 5  list.txt`

**_Print all words that do not have three characters_**

```bash
awk '!(length($1) == 3)' list.txt
```

Here we negate by prepending the pattern with `!` and wrapping it in parentheses.

**_Return words that are either three characters or four characters in length_**

```
awk '(length($1) == 3) || (length($1) == 4)' list.txt
```

Here we use the logical OR to match against more than one pattern. Notice that whenever we use a Boolean operator such as NOT or OR, we wrap our pattern in parentheses.

**_Match and string-interpolate the output_**

```bash
awk 'length($1) > 0  {print $1, "has", length($1), "chars"}' list.txt

# storeroom has 9 chars
# tree has 4 chars
# cup has 3 chars
```

**_Match against a numerical property_**

```bash
awk '$2 >= 90 { print $0 }' scores.txt

# Lucia 95
# Joe 92
# Sophia 90
```

This returns the records where there is a secondary numerical field that is greater than 90.

https://zetcode.com/lang/awk/
