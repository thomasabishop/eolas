---
categories:
  - Programming Languages
tags:
  - shell
---

# File descriptors

File descriptors are shorthand for `stdin`, `stdout` and `stderr`:

| File descriptor | Name            | Common abbreviation |
| --------------- | --------------- | ------------------- |
| 0               | Standard input  | `stdin`             |
| 1               | Standard output | `stdout`            |
| 2               | Standard error  | `stderr`            |

They are typically used when you want to redirect the output of the standard/input /output/error somewhere, e.g a file or as input to another program. A classic case is `[some_command] > /dev/null 2>&1`

They are all technically "files" which are open and which append themselves to every process that can run in the shell. For any command or program that you run, you will be able to access `0`, `1` and `2` for them. In this way they are similar to variables like [`$0`](/Programming_Languages/Shell/Passing_arguments_to_scripts.md#passing-arguments) and [`$@`](/Programming_Languages/Shell/Passing_arguments_to_scripts.md#passing-arguments). They have a universal meaning within the context of the shell runtime.
