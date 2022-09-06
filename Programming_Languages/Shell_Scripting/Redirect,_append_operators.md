---
categories:
  - Programming Languages
tags:
  - shell
---

## Redirection operator

The symbol `>` is called the **redirection operator** because it redirects the output of a command to another location. You most frequently use this when you want to save contents to a file rather than standard output.

```bash
ls | grep d* >> result.txt
```

## Appending operator

We use `>>` to append contents on the next available line of a pre-existing file. Continuing on from the example above:

```bash
echo 'These are the files I just grepped' >> result.txt
```
