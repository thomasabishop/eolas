---
tags: [python, file-system, procedural]
created: Friday, October 25, 2024
---

# Writing to files in Python

We create a file object with `open()` and use the `write` method:

```py
# Open file in write mode
file = open("example.txt", "w")

# Write some text to the file
file.write("Hello, this is an example text written using Python.")

# Close the file
file.close()
```

Alternatively we use `with open` which automatically closes the file:

```py

with open("example.txt", "w") as file
    file.write('some lines')

```

> Note that in the above example, if the file does not already exist, it will
> create it. If it does exist, it will overwrite its contents with the new data.
> So we use `write` to create new files as well as to write to existing files.
