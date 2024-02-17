---
categories:
  - Programming Languages
tags:
  - shell
---

# Redirection

## Redirecting outputs

The symbol `>` is called the **redirection operator** because it redirects
`stdout` to another program or file. You most frequently use this when you want
to save contents to a file rather than standard output.

```bash
ls | grep d* > result.txt
```

### Combining redirection with file escriptors

It is common practice to combine redirection with the
[file descriptors](File_descriptors.md) to redirect
the output of `stdout` and `stderr`. A common case is to
[redirect error output to `/dev/null`](Redirect_to_dev_null.md).

Redirection defaults to interpreting `>` as the redirection of `stdout` (`1`);

## Redirecting inputs

We can also switch the direction of the redirection symbol and pass in a file to
a command rather than command ouput to a file:

```bash
sql-processing-program < data.sql
```

We can redirect a string with three carets:

```bash
program <<< "this is a string input"
```

## Appending

We use `>>` to append contents on the next available line of a pre-existing
file. Continuing on from the example above:

```bash
echo 'These are the files I just grepped' >> result.txt
```
