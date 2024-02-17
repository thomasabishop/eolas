---
tags: [python, OOP]
---

# Python modules

## Distinguishing _modules_ from _packages_

Modules and packages in Python are very similar to modules in Node.js: a
combination of several pieces of functionality (often written in a mix of
different syntactic styles) bundled together to be used as a unit.

- A **module** is basically just a script - a single Python file that you can
  import using the `import` statement
- A **package** is a _collection of modules_

A package is a whole directory which has an `__init__.py` at its root which
designates it as a package (this can be empty, but it is necessary to have this
file for the interpreter to understand that the directory is a package).

## Creating modules

### Naming modules

The name of a module is the name of its file, e.g. `utils.py` defines the module
`utils`. When we import a module we do not need to specify the extension.

### Example module

Here is an example of a module.

```py
"""utils module"""

print('Hello I am the utils module')


def printer(some_object):
    print('printer')
    print(some_object)
    print('done')


class Shape:

    def __init__(self, id):
        self.id = id

    def __str__(self):
        return 'Shape - ' + self.id


default_shape = Shape('square')


def _special_function():
    print('Special function')

```

## Importing modules

> Whether we are importing our own local module, a third-party module or a
> built-in module native to Python, the syntax is the same.

- If the module is in the same directory as the file you wish to import it into,
  you can just directly import with:
  ```py
  import utils
  utils.specialFunction
  shape = utils.Shape('circle')
  ```
- If the module you want to import is in a subdirectory, you will need to make
  that subdirectory a package in order to be able to import from it. This means
  adding an `__init__.py`. Then you can use the following import syntax:
  ```py
  from subdir import utils
  ...
  ```

### Different import syntax

- If you don't want to have to prepend the imported module's name when using it
  (e.g. `utils.specialFunction`). You can import like so:

  ```py
  from utils import *
  specialFunction()
  ```

- By default an import makes everything in the module available, however you can
  choose to import only a subset. E.g.:
  ```py
  from utils import Shape
  #  or with an alias:
  from utils import Shape as lorem
  ```

## `__main__`

The `__main__` attribute is important in Python.

### Usage in scripts/modules

When you run a script (module) Python assigns the string `__main__` to the
`__name__` attribute to the script that is being executed.

If you run the script as an import into another script, the `__name__` attribute
of the imported module is set to the module name, not `__main__`. This is why,
when we import we say `import [module_name]` and not `import __main__`.

When used with a module, `__main__` indicates code that should be run straight
away when the given script file is run. You won't always want to execute
everything in the module file on execution so you can put this stuff outside of
`__main__`

Typically you will only want immediate execution to happen when **the module is
the entrypoint** to the program.

We indicate this with `__main__` as follows:

```py
if __name__ == "__main__":
    print("This runs only if the module is the main module")
```

### Usage in packages

The only real difference with packages is that you can also define a
`__main__.py` file in the root of the package directory.

This functions in the same manner as `__main__` in an individual module however
this time it is not the entry point for a single script but the entrypoint of
the package as a whole.

> When the package is run directly as a script, the code in `__main__.py` is
> executed, just like it would be if it were a standalone script. This allows a
> package to be run as a script, as well as letting it contain modules that can
> be imported separately.

You can of course still have individual entrypoints for the modules that
comprise the package.

### Running the package as a package

If you want to run the whole package at once, rather than individually importing
the modules that belong to it. You can run the following from the command-line:

```
python -m package_name
```

With this, Python will try to locate the `__main__.py` file and execute it as
though it were a standalone script.

### Using a `main()` function

To ensure that certain code runs on initialisation we can define a special
`main` function or class method that runs when the module or package is
loaded.We would put the main set-up logic in `main` and coordinate the execution
of the module or package through it.

```py
def main():
    printer(default_shape)
    shape = Shape("circle")
    printer(shape)

if __name__ == "__main__":
    main()
```

### Example

```py
'''palindrome module'''

def is_palindrome(inp):
    inp_list = list(inp)
    inp_list_len = len(inp_list)
    for i in range(inp_list_len):
        if inp_list[i] != inp_list[inp_list_len - 1 - i]:
            return False
    return True


def main():
    palindrome_one = "soros"
    palindrome_two = "torot"
    not_palindrome = "chair"

    print(is_palindrome(palindrome_one))
    print(is_palindrome(palindrome_two))
    print(is_palindrome(not_palindrome))


if __name__ == '__main__':
    main()
```
