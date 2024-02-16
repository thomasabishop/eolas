---
categories:
  - Programming Languages
tags:
  - shell
---

# Text manipulation

## Sorting strings: `sort`

If you have a `.txt` file containing text strings, each on a new line you can
use the sort function to quickly put them in alphabetical order:

```bash
sort file.txt
```

Note that this will not save the sort, it only presents it as a standard output.
To save the sort you need to direct the sort to a file in the standard way:

```bash
sort file.txt > output.txt
```

### Options

- `-r`
  - reverse sort
- `c`
  - check if file is already sorted. If not, it will highlight the strings which
    are not sorted

## Find and replace: `sed`

The `sed` programme can be used to implement find and replace procedures. In
`sed`, find and replace are covered by the substitution option: `/s` :

```bash
sed ‘s/word/replacement word/’ file.txt
```

This however will only change the first instance of word to be replaced, in
order to apply to every instance you need to add the global option: `-g` .

As sed is a stream editor, any changes you make using it, will only occur within
the standard output , they will not be saved to file. In order to save to file
you need to specify a new file output (using `> output.txt`) in addition to the
original file. This hasthe benefit of leaving the original file untouched whilst
ensuring the desired outcome is stored permanently.

Alternatively, you can use the `-i` option which will make the changes take
place in the source file as well as in standard input.

Note that this will overwrite the original version of the file and it cannot be
regained. If this is an issue then it is recommended to include a backup command
in the overall argument like so:

```bash
sed -i.bak ‘s/word/replacement word/’ file.txt
```

This will create the file `file.txt.bak` in the directory you are working within
which is the original file before the replacement was carried out.

### Remove duplicates

We can use the `sort -u` command can be used to remove duplicates:

```bash
sort -u file.txt
```

It is important to sort before attempting to remove duplicates since the `-u`
flag works on the basis of the strings being adjacent.

## Split a large file into multiple smaller files: `split`

Suppose you have a file containing 1000 lines. You want to break the file up
into five separate files, each containing two hundred lines. You can use `split`
to accomplish this, like so:

```bash
split -l 200 big-file.txt new-files
```

`split` will categorise the resulting five files as follows:

- new-file-aa,
- new-file-ab
- new-file-ac,
- newfile-ad,
- new-file-ae.

If you would rather have numeric suffixes, use the option `-d` . You can also
split a file by its number of bytes, using the option `-b` and specifying a
constituent file size.

## Merge multiple files into one with `cat`

We can use `cat` read multiple files at once and then append a redirect to save
them to a file:

```bash
cat file_a.txt file_b.txt file_c.txt > merged-file.txt
```

## Count lines, words, etc: `wc`

To count words:

```bash
wc file.txt
```

When we use the command three numbers are outputted, in order: lines, words,
bytes.

You can use modifiers to get just one of the numbers: `-l`, `-w` , `-b` .
