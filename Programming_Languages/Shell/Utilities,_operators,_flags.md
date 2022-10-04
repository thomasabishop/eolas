---
categories:
  - Programming Languages
tags:
  - shell
---

The following are useful built-in utility methods that you can use for checking and validation in the course of your bash scripts.

## Flags

### Prevent newline

Prevent bash from adding a new line after an echo:

```bash
echo 'Your name is Thomas'
echo 'and you are 33 years old'

# Your name is Thomas
# and you are 33 years old
```

```bash
echo -n 'Your name is Thomas '
echo 'and you are 33 years old'

# Your name is Thomas and you are 33 years old
```

## Operators

### Mathematical

```bash
-lt , -gt,
```
