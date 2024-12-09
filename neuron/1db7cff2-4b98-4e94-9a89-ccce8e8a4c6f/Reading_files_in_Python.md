---
tags: [python, file-system, procedural]
created: Friday, October 25, 2024
---

# Reading files in Python

Once a file object has been intialised with `open()` there are several ways in
which the content can be read:

| Read method | Behaviour                                                                                                                                |
| ----------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `read`      | Return the entire contents of the file as a single string.                                                                               |
| `readline`  | Read the contents of a file a line at a time. You would combine this with a loop so that you can do something with each individual line. |
| `readlines` | Return a list of all the lines in a file. Each line will be an element in the list.                                                      |

## Read

`read` reads the entire contents of a file and returns it as a single string.

`read()` reads the entire file into memory at once, so it may not be suitable
for very large files that exceed the available memory of your system. In such
cases, you can use the `readline()` method to read the file line by line
instead.

The basic syntax is as follows:

```py
# Open the file for reading
file = open('filename.txt', 'r')

# Read the entire contents of the file
contents = file.read()

# We could also limit the read to a number of characters:
contents = file.read(100)

# Close the file
file.close()
```

Once we have the file contents stored, we can then interact with it. The
standard way of doing this is to parse it line by line. For example, say we were
reading a CSV:

```py
lines = content.split(',')
for line in lines:
    if line: # if the line is not empty
        # do something with line
```

## Readline

> The readline() method in Python is used to read a single line from a file. It
> is typically used when you want to process a file line by line, rather than
> reading the entire file into memory at once.

`readline()` returns the line including the newline character at the end of the
line, so you may need to strip this character off using the strip() method
before processing the line further.

```python
# Open the file for reading
file = open('filename.txt', 'r')

# Loop through the file, reading one line at a time
line = file.readline()
while line:
    # Strip off the newline character
    line = line.strip()

    # Do something with the line
    print(line)

    # Read the next line
    line = file.readline()

# Close the file
file.close()
```

## Readlines

The `readlines()` method is used to read all the lines of a file and return them
as a list of strings, where each element of the list is a line from the file.

```py
# Open the file for reading
file = open('filename.txt', 'r')

# Read all the lines of the file and store them in a list
lines = file.readlines()

# Loop through the lines and print them to the console
for line in lines:
    print(line)

# Close the file
file.close()
`
```
