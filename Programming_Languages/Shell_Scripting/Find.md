---
tags:
  - Programming_Languages
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

### Filename
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