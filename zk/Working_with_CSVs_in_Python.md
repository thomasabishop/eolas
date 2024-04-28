---
id: sgtn
title: Working_with_CSVs_in_Python
tags: [python, csv]
created: Sunday, April 28, 2024
---

# Working_with_CSVs_in_Python

## Core package

```py
import csv
```

## Read and write to CSV

### Read

Use standard Pythonic "read" syntax:

```py
with open('./path.csv', mode="r") as csv_file:
    reader = csv.reader(csv_file)
```

### Parse values

Having created the `reader` object, you can then loop through this as an
iterable:

```py
for row in reader:
    print(row)
```

Will return something like:

```csv
column something, column something else, ...
```

Which we can individuate with:

```py
print(row[0])
# column something
```

We can also parse the rows as a dictionary for easier individuation. We do this
by creating a `DictReader` rather than the default `reader`:

```py
...
dict_reader = csv.DictReader(csv_file)
```

Now we can use the header row values to individuate particular columns.

Say we have a CSV with the following headers:

```csv
name, profession
```

We can individuate thus:

```py
for row in dict_reader
    name = row["name"]
```

### Write

Use standard Pythonic "read" syntax:

```py
with open('./new_csv_file.csv', mode="w") as csv_file:
    writer = csv.writer(csv_file)
```

The above will create the file as well, it doesn't need to be pre-existing.

This creates the writer object. To actually write a row:

```py
some_list = ['thomas', 'engineer']
for element in some_list:
    writer.writerow(element)
```
