---
categories:
  - Programming Languages
tags: [python, OOP]
---

# Python modules

Modules in Python are very similar to modules in Node.js: a combination of several pieces of functionality (often written in a mix of different syntactic styles) bundled together to be used as a unit.

## Creating modules

### Naming modules

The name of a module is the name of its file, e.g. `utils.py` defines the module `utils`. When we import a module we do not need to specify the extension.

### Example module

Here is an example of a module. We will use this throughout.

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

> Whether we are importing our own local module, a third-party module or a built-in module native to Python, the syntax is the same.

To use the module defined in `utils.py`:

### Method one

```py
import utils
```

Now we can use the functionality provided by the module, e.g:

```py
import utils

utils.printer(utils.default_shape)

shape = utils.Shape("circle")
```

Here we have invoked the `printer()` function contained in the module. We have used it to print the `default_shape` variable in `utils` which is itself and instance of the `Shape` class, also defined in `utils`.

After this we have created a new instance of the `Shape` class in the file that imports `utils`.

### Method two

In the last example we used the name `utils` to reference our import. I prefer this because it shows the origin of the code you are using. But if we imported like so:

```py
from utils import *
```

Then we wouldn't need to prepend our use of `utils` functions with `utils`. Instead out code would look like this:

```py
from utils import *

printer(default_shape)

shape = Shape("circle")
```

### Importing a subset of the module

It doesn't look like you need to explicity export the values you want to be able to use once your module has been imported in Python. Everything seems to be exported and accessible.

However, you can choose to import only a subset of the module:

```py
from utils import Shape
```

And you can use an alias, e.g:

```py
from util import Shape as banana
```

## Main module as program entry point

If we have any freestanding code in a module. It will execute the moment the file it is imported into executes. Examples of this in the module example are the print function at the top and the instantiation of the `shape` object.

Typically you will only want this to happen when **the module is the entrypoint** to the program. In Python the entrypoint is known as the `main` module. This is analagous to `index.js` in a Node program.

When the module is the entry point it has a special name: `__main__`. We can test for this condition and only run code if the module is being run as the main module. This is a common pattern:

```py
if __name__ == "__main__":
    print("This runs only if the module is the main module")
```

`__name__` is a reference to the current module name.

> We do not need to name our module `main` for this to occur. Whenever an imported module is run it occupies the position of `__main__`

To ensure that certain code runs on initialisation we can define a special `main` function or class method that runs when the module is loaded. This is effectively the set-up code in the entry point, e.g:

```py
def main():
    printer(default_shape)
    shape = Shape("circle")
    printer(shape)

if __name__ == "__main__":
    main()
```
