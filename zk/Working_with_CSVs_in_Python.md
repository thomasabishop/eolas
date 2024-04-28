---
id: sgtn
title: Working_with_CSVs_in_Python
tags: []
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

### Write

Use standard Pythonic "read" syntax:

```py
with open('./new_csv_file.csv', mode="w") as csv_file:
    write = csv.writer(csv_file)
```

The above will create the file as well, it doesn't need to be pre-existing.
