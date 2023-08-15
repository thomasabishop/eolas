---
categories: [Programming Languages]
tags: []
---

# Guide to YAML

- Data description language
- Alternative to XML and JSON
- Easy to read by humans and process by code

## Main rule

> Never use tabs for indentation, use two spaces

## Available data types

- strings
- numbers
- booleans
- arrays
- maps (key, value pairs)

### Example

````yaml
# Basic scalar data types
age: 51
greeting: Hello, world
length: 182.3
happy: true
``

```yaml
# array
pets:
  - cat
  - dog

# nested array
pets:
  - cat
  - dog
    - staffy
    - pitty
````

```yaml
# map
languages:
  - java: advanced
  - python: average
  - javascript: basic
```

### Strings

- Don't have to use quotes unless string contains reserved YAML characters (dashes, colons etc)
- Can use single or double quotes

### Multi-line text

Two methods:

```yaml
# Literal block preserves new line characters
literal_block: |
  Lorem ipsum dolar sit avcc lorem dolar 
  Blah blah
  Blah
```

```yaml
folded_block: >
  Each different line
  will be folded back on itself so you don't
  have to keep scrolling to the right
```
