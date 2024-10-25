---
tags: [python, file-system, procedural]
created: Friday, October 25, 2024
---

# File CRUD operations in Python

Most create, delete, move etc operations invoke the inbuilt `os` module.

// Add directory CRUD operations in Python

## Renaming files (moving)

```py
import os
os.rename('original-file-name.txt', 'new-file-name.txt')
```

## Deleting files

```py
import os
os.remove('file-name.txt')
```
