---
tags: [python]
created: Friday, October 25, 2024
---

# With open in Python

We use the `open()` method to create a **file object** that allows us to read,
write and append to files.

The general syntax is as follows:

```py
file_object = open(<file_name>, <access_mode>)
```

`<file_name>` is a path to the file you want to read, create or modify. The
`<access_mode>` denotes the mode in which to open the file. The most frequently
used are:

- `r`
  - [read](Reading_files_in_Python.md)
- `w`
  - [write](Writing_to_files_in_Python.md)
- `a`
  - [append](Appending_to_files_in_Python.md)

When we have finished with an I/O operation, such as reading from or writing to
a file, we must call `file.close()` to terminate the process. This removes the
reference to the file from memory.

A more pythonic and concise way of reading files and closing them is to use
`with...as` syntax. When this phrasing is used, a self-contained context is
created for the I/O operation that closes the file automatically.

```py
with open('filename.txt', 'r') as file:
    contents = file.read()
    print(contents)
```
