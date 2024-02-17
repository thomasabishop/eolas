---
tags:
  - shell
---

# Expansions and substitutions

Bash is weird in that parentheses, braces and brackets are used not just as
markers for different code blocks but as the designators of commands in their
own right. The type of bracket you use effects how your input is interpreted.

Below are the main forms of expansion and substitution:

| Representation | Name                 |
| -------------- | -------------------- |
| `~` .          | Tilde expansion      |
| `{..}`         | Brace expansion      |
| `${...}`       | Parameter expansion  |
| `$(...)`       | Command substitution |
| `$((...))`     | Arithmetic expansion |

## Brace expansion: `{..}`

Brace expansion is for changing a smaller part of a greater whole
programmatically. This is best understood by looking at examples:

```
echo c{a,o,u}t
cat cot cut
```

```
echo /tmp/{1..3}/file.txt
/tmp/1/file.txt  /tmp/2/file.txt /tmp/3/file.txt
```

```bash
echo {1..5}
1 2 3 4 5

echo {5..1}
5 4 3 2 1

echo {a...c}
a b c
```

We can also set sequences. If we wanted to count to twenty in intervals of two

```bash
echo {1..20..2}
1 3 5 7 9 11 13 15 17 19
```

> Note that we type _two_ dots **not** an elipsis

### Example use case

We might use brace expansion to generate sequential file names using a
pre-defined naming scheme, eg.

```
touch file_{01..12}{a..d}
ls

file_01a
file_01b
file_01c
file_01d
file_02a
file_02b
...
file_12d
```

The syntax here basically means: for each of the elements in the first list, run
the second list against them.

## Parameter expansion: `${...}`

We use most frequently for returning the value of stored
[variables](Variables_and_data_types.md).
Techically we do not have to use the braces, we can retrieve with just `$var`
however it's better to use them to minimise interpretation fuck-ups which happen
a lot.

When the braces are used, this allows us to transform the values before they are
returned such as only returning from the 6th character: `${var:6}`.

## Command substition: `$(...)`

Command substitution (circle-brackets) allows us to put the output of one
command inside another. Bash runs the bracketed command in a
[sub-shell](Shell_sessions.md) and then returns it
to the main user shell.

For example:

```bash
echo "The current directory is $(pwd)."
```

## Arithemtic expansion: `$((...))`

We use arithmetic expansion when we want to calculate numerical values

See
[Working with numbers in Bash](Working_with_numbers_in_Bash.md)
for more.
