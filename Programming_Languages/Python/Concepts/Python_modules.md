---
categories:
  - Programming Languages
tags: [python, OOP]
---

# Python modules

Modules in Python are very similar to modules in Node.js: a mix of several pieces of functionality (often written in a mix of syntactic styles) bundled together to be used as a unit.

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

shape =Shape("circle")
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
