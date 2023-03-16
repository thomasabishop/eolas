---
categories:
  - Programming Languages
tags:
  - shell
---

# Grep

## Purpose of `grep`

`grep` stands for “global regular expression print”. It allows you to search plain text data sets for strings which match a regular expression or pattern.

## Syntax

### Schematic

```bash
grep [options] [pattern] [source file] > [output file]
```

Note that above we redirect the file matches to a new file. You don't have to do this. If you omit the redirection, `grep` will output to standard output.

### Applied

```bash
grep -i -n "banana" fruits.txt > banana.txt
```

The above example searches, using regex, for strings matching the pattern “banana” in the file `fruits.txt` regardless of the character case (`-i` ensures this) and outputs its findings to the file `banana.txt`, with the line number where the match occurs appended to the output (`-n` takes care of this).

Note that for simplicity, you can chain optional values together, i.e. the options in the above example could be input as `-in`.

## Useful options

- ignore case: `i`
- count matches instead of returning actual match: `-c`
- precede each match with the line number where it occurs: `-n`
- invert the match (show everything that doesn't match the expression): `-v`
- search entire directories recursively: `-r`
- list file names where matches occur (in the scenario of a recursive match): `-l`

## `ripgrep`

`ripgrep` is generally faster however it does not come as default with Unix and only works recursively, i.e. it is designed to find strings within files within multiple directories not just single files or piped streams.

It also respects `.gitignore` files that it finds within directories by default and `node_modules` which is really handy.

Most of the standard `grep` options transfer over.
