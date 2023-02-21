---
categories:
  - Programming Languages
tags:
  - shell
---

# Quote marks in Bash

## Single-quotes (aka _strong_ quotes)

Bash will interpret everything in the string as a literal:

```bash
echo 'The directory is $(pwd)'
# The directory is $(pwd)
```

## Double-quotes

Bash will interpret strings as strings but will interpret expansions and substitutions as executable processes:

```bash
$pointlessVar='directory'

echo "The ${pointlessVar}"

# The directory is /home/thomas
```

It is therefore generally best to use double quotes whenever we wish to return mixed values.
