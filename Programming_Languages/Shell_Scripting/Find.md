---
categories:
  - Programming Languages
tags:
  - shell
---

# `find`

`find` can be used both to locate files and run operations on the files it finds.

## Main syntax

### No options

Without options specified, `find` alone will return a recursive index of all the files in the directory from which it is run.

### Sub-directory

If we pass a directory to `find` it will repeat the above process but specifically for that directory.

```bash
$ find i3
i3
i3/config
```

### Filters

We can specify flags as filters (known as 'tests' within the program).

#### Type

Filter by type: file or directory

```
$ find -type d # return dirs only
$ find -type f # return files only
```

Within a specified directory:

```bash
$ find i3 -type f
```

#### Filename

This is the most frequent use case: filter files by name with globbing.

```bash
$ find -name "config"
./.git/config
./i3/config
```

```bash
$ find -name "*.js"
```

The same, but case insensitive: `iname`

```bash
$ find -iname "*.JS"
```

#### Path

As above but this time includes directory names in the match. `ipath` is the case-insensitive version.

```bash
$ find -path "utils*"
utils.js
utils/do-something.js
```

### Operators

We can combine `find` commands by using logical operators: `-and`, `-or`, `-not`. For example:

```bash
$ find -not -name "*.js" -type f
./app/index.html
./app/style.css
./dist/index.html
./dist/style.c


dfdf
```

## Actions

Using the `exec` keyword we can run a program against the files that are returned from `find`.

In this syntax we use `{}` as a placeholder for the path of the file that is matched. We use `;` (escaped) to indicate the end of the operation.

### Examples

This script deletes the files that match the filter criteria:

```bash
$ find -name "*.js" -exec rm {} \;
```

This script finds all the files with the substring 'config' in their name and writes their file size to a file.

```bash
find -name '*config*' -exec wc -c {} \; > config-sizes
```
