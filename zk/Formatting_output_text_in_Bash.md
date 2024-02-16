---
categories:
  - Programming Languages
tags:
  - shell
---

# Formatting output text in Bash

We can use the `-e` flag with `echo` to have greater control over the output of
text. `-e` allows us to use linebreaks, tabs and other formattings within a
string.

## Output text in columns

```bash
echo -e  "Name\t\tNumber"; echo -e "Thomas\t\t123";

Name		Number
Thomas		123
```

## Break text over several lines

```bash
echo -e "This text\nbreaks over\nthree lines"

This text
breaks over
three lines
```

## Colour outputs

![](/img/terminal_colours.png)

```bash
echo -e "\033[31;40mColoured Text\033[0m"
```

The coloured section is prepended by `\033[` and ended with `[0m`. The
foreground colour is given first, and then the background colour.

We can also change the text style. We do this by adding an extra value after the
first square bracket:

```bash
echo -e "\033[4;31;40mColoured Text\033[0m"
```

This underlines the output.

We can create a script that simplifies the construction of colour-formatted
text, e.g

```bash
ulinered="\033[4;31;40m"
red="\033[31;40m"
none="\033[0m"

echo -e $ulinered"ERROR:"$none$red" Something went wrong."$none
```
