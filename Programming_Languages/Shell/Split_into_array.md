---
categories:
  - Programming Languages
tags:
  - shell
---

# Splitting input into an array

## `readarray`

`readarray` makes it really easy to split input into an array based on new lines.
Say we have this file as input:

```
123
456
789
```

Then we can split like so:

```bash
readarray -t name_for_array < ./input.text

# Print all elements
echo "${name_for_array[@]}"

# Print element by index

echo "${name_for_array[1]}"
456
```

If we want to read direct from string within bash file:

```bash
readarray -t new_name_for_array <<< "here
is
some
text"

echo "${new_name_for_array[1]}"
is
```

> The _-t_ flag removes the trailing newline

Add more: https://linuxhint.com/split-string-array-bash/

## `read`

For different delimiters we have to use `read`, combined with `IFS` the **Internal Field Separator**.

For example, to split by comma:

```plaintext
# comma-input.txt
something, something else, something more
```

```bash
IFS=',' read -a arr < ./comma_inputs.txt
```