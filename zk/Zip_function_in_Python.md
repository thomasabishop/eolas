---
tags: [python, data-structures]
---

# `zip`

The `zip` function returns a zip object when you pass in two iterator data types
(typically two lists). This is an iterator of tuples where the first item in
each passed iterator is paired together, and then the second item in each passed
iterator are paired together, and so on.

## Example

```py
a = ("John", "Charles", "Mike")
b = ("Jenny", "Christy", "Monica", "Vicky")

x = zip(a,b)

print(x)
# <zip object at 0x1514af34c340>

# To display the resulting tuple in a readable format:

print(tuple(x))

(('John', 'Jenny'), ('Charles', 'Christy'), ('Mike', 'Monica'))
```

As indicated above, if the input iterators are of equal lengths, Python will
ignore the value in iterator B that doesn't have an equivalent index in iterator
A.

## Real-life example

```py
prompts = [
    "Enter title",
    "Enter author",
    "Enter publication date",
    "Enter year you read the book"
]

keys = ["Title", "Author", "Publication_date", "Date_read"]

book = {}

for key, prompt in zip(keys,prompts):
    book[key] = input(prompt + ": ")

```

Here I take the `prompts` and `keys` lists, collate them via `zip` and then loop
through them to populate the `book` dictionary, which contains properties
sourced from the `keys` list and values from the user's answers to the
`prompts`.
