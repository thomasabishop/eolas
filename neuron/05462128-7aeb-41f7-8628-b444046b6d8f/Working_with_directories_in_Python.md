---
tags: [python, file-system, procedural]
created: Friday, October 25, 2024
---

# Working with directories in Python

## List files in a directory

```py
# Here we list the file exts of files in a dir
import os
from pathlib import Path

with os.scandir("/a/directory") as dir:
    for entry in dir:
        print(Path(entry).suffix)
```

## List files without extension

```python

file = "/some/file/with/markdown.md"
return os.path.splitext(os.path.basename(file))[0]
# markdown
```

## Create a directory

```py
import os

os.makedirs("/name/of/directory")
```

### Check if directory exists, remove if so

```py
import os
import shutil

if os.path.isdir("/name/of/directory")
    shutil.rmtree(target_dir)
```

## Copy a nested directory from location to another

```py
import shutil

shutil.copytree("/source/dir", "/target/dir", dir_exist_ok=True)
```
