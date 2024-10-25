---
tags: [python, file-system, procedural]
created: Friday, October 25, 2024
---

# Appending to files in Python

```py
file = open("example.txt", "a")
file.write('Add something to the end of the file')
file.close()
```

```py
with open("example.txt", "a"):
    file.write("Add something to the end of the file")
file.close()
```
