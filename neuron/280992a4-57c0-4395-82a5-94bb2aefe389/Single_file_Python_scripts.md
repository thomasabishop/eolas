---
id: atzw
tags: []
created: Friday, April 26, 2024
---

# Single file Python scripts

## Basic architecture

```py
#! /usr/local/bin/python3

import sys

if __name__ == "__main__":
    all_args = sys.argv
    specific_arg = sys.argv[0]
    # Main functionality...
```

When you run a script (module) Python assigns the string `__main__` to the
`__name__` attribute to the script that is being executed.

If you run the script as an import into another script, the `__name__` attribute
of the imported module is set to the module name, not `__main__`.

Everything can go under the `__main__` conditional, or, for better readability,
you can define a `main` function that is then invoked, e.g:

```py

def main():
    # Do some stuff


if __name__ == "__main__":
    main()

```

## Related notes

![Python modules and imports](static/Python_modules_and_imports.md)
