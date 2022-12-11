---
categories:
  - Programming Languages
tags:
  - shell
---

# Redirection

## Redirecting outputs
The symbol `>` is called the **redirection operator** because it redirects the output of a command to another location. You most frequently use this when you want to save contents to a file rather than standard output.

```bash
ls | grep d* > result.txt
```

### Combining redirection with file descriptors

It is common practice to combine redirection with the [file descriptors](/Programming_Languages/Shell/File_descriptors.md) to redirect the output of `stdout` and `stderr`. A common case is to [redirect error output to `/dev/null`](/Programming_Languages/Shell/Redirect_to_dev_null.md).


## Redirecting inputs

We can also switch the direction of the redirection symbol and pass in a file to a command rather than command ouput to a file:

```bash
sql-processing-program < data.sql
```

## Appending 

We use `>>` to append contents on the next available line of a pre-existing file. Continuing on from the example above:

```bash
echo 'These are the files I just grepped' >> result.txt
```
