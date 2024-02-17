---
categories:
  - Programming Languages
tags:
  - shell
---

# File permissions and executables

Every Unix file has a set of permissions that determine whether you can read,
write or run (execute) the file.

## Viewing file permissions

In order to see file permissions within the terminal, use the `-l` or `-rfl`
with the `ls` command. Remember this command can be applied at both the
directory and single-file level. For example:

```bash
drwxr-xr-x  7 thomas thomas 4096 Oct  2 19:22 angular-learning-lab
drwxr-xr-x  5 thomas thomas 4096 Oct 17 18:05 code-exercises
drwxr-xr-x  5 thomas thomas 4096 Sep  4 16:15 js-kata
drwxr-xr-x  9 thomas thomas 4096 Sep 26 18:10 sinequanon
drwxr-xr-x 12 thomas thomas 4096 Sep 19 17:41 thomas-bishop
drwxr-xr-x  5 thomas thomas 4096 Sep  4 19:24 ts-kata
```

### What the output means

The first column of the permissions output is known as the file's _mode_. The
sequence from left to right is as follows:

```
-       - - -                 - - -                 - - -
type    user permissions      group permissions     other permissions
```

<dl>
  <dt>type</dt>
  <dd>The file type. A dash just means an ordinary file. `d` means directory </dd>
 
  <dt>user permissions</dt>
  <dd>read, write or execute. A dash means 'nothing': the permissions for that slot in the set have not be assigned</dd>

  <dt>group and other</dt>
  <dd>group is obviously what anyone belonging to the current file's user group can do. Everyone else (outside of the user and the group) is covered by the other permissions, sometimes known as 'world' permissions</dd>
</dl>

## Modifying permissions: `chmod`

We use `chmod` for transferring ownership and file permissions quickly from the
command-line.

### Octal notation

`chmod` uses octal notation. Each numeral refers to a permission set. There are
three numerals. The placement denotes the user group. From left to right this
is:

- user
- group
- everyone else.

If you are working solo and not with group access to files, you can disregard
assigning the other numerals, by putting zeros in as placeholders.

[Permission codes](685254916b2642f189e6316b876e09c9)

### Example

```bash
$ chmod -v 700 dummy.txt
$ ls -l dummy.txt
$ -rwx------  1 thomasbishop  staff  27 13 May 15:42 dummy.txtExample
```

### Useful options

`-v` → verbose: tell the user what `chmod` is doing

`-r` → work recursively, i.e apply the action to directories as well as files

`-f` →silent: suppress most error messages

## Running bash files

In most cases, especially when you are working alone, the most frequent codes
you are going to need are 700 and 600. When shell scripting, you need to make
your scripts executable for them to work, therefore you should always
`chmod 700` when creating a `.sh` file.

Then to invoke the script from the shell you simply enter:

```bash
./your-bash-script.sh
```
