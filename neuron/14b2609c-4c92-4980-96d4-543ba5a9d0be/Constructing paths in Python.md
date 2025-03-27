---
tags: [python]
created: Sunday, March 16, 2025
---

# Constructing paths in Python

Rather than hard-coding paths it's better to use path construction operators.

In the past this was done with `os.path` but a more modern library is `pathlib`.

```python
import os
import pathlib
from pathlib import Path
```

I'll show both, side by side.

## Get directory of the current script

```py
SCRIPT_DIR = Path(__file__).parent.absolute()
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file))
```

## Get the user home directory

```py
HOME_DIR = Path.home
HOME_DIR = os.environ.get("HOME")
```

## Construct a path from $HOME

```py
HOME_DIR = Path.home
HOME_DIR = os.environ.get("HOME")

SUB_DIR = HOME_DIR / "repos" / "systems-obscure" / "src"
SUB_DIR = os.path.join(HOME_DIR, "repos", "systems-obscure", "src")
```

## Access root directories

It's less straightforward to access directories that are not children of
`$HOME`.

For instance to access mounted drives:

```py
EXT_HD = Path("/media/samsung-T3")
EXT_HD_DIR = EXT_HD / "music"

EXT_HD = "/media/samsung-T3"
EXT_HD_DIR  = os.path.join(EXT_HD, "music")
```
