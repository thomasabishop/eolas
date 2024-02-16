---
categories:
  - Programming Languages
tags:
  - shell
---

> A symbolic link, also termed a soft link, is a special kind of file that
> points to another file. Unlike a hard link, a symbolic link does not contain
> the data in the target file. It simply points to another entry somewhere in
> the file system.

# Syntax

```
ln -s -f ~/[existing_file] ~/.[file_you_want_to_symbolise]
```

Real example:

```
ln -s -f ~/dotfiles/.vimrc ~/.vimrc
```
