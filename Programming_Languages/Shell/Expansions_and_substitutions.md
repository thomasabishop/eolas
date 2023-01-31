---
categories:
  - Programming Languages
tags:
  - shell
---

# Expansions and substitutions

Bash is weird in that parentheses, braces and brackets are used not just as markers for different code blocks but as the designators of commands in their own right. The type of bracket you use effects how your input is interpreted.

Below are the main forms of expansion and substitution:

| Representation | Name                 |
| -------------- | -------------------- |
| `~` .          | Tilde expansion      |
| `{...}`        | Brace expansion      |
| `${...}`       | Parameter expansion  |
| `$(...)`       | Command substitution |
| `$((...))`     | Arithmetic expansion |

## Brace expansion

Brace expansion is for changing a smaller part of a greater whole programmatically. This is best understood by looking at examples:

```
echo c{a,o,u}t
cat cot cut
```

```
echo /tmp/{1..3}/file.txt
/tmp/1/file.txt  /tmp/2/file.txt /tmp/3/file.txt
```

```
echo {1..5}
1 2 3 4 5

echo {5..1}
5 4 3 2 1

echo {a...c}
a b c
```

We can also set sequences. If we wanted to count to twenty in intervals of two:

```
echo {1..20..2}
1 3 5 7 9 11 13 15 17 19
```

> Note that we type _two_ dots **not** an elipsis

## Example use case

We might use brace expansion to generate sequential file names, eg.

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
