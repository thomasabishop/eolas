---
categories:
  - Programming Languages
tags:
  - shell
---

# `read`

`read` is primarily used to capture `stdin` from the user and automatically parse it as variables. It has a secondary use case as a command that the `stdout` is piped to. This enables you to capture the output of a command as one or more variables which you can then execute subsequent operations on.

## `stdin`

```bash
$ read var1 var2
$ thomas bishop # user inputs this
$ echo $var2
$ bishop
```

> If you don't specify variables, `read` will automatically parse using whitespace

## `stdout`

```bash
find -type -f  -not -path "./.git/" | read $fname
```
