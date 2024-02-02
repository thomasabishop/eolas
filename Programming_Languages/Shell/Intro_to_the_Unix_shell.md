---
categories:
  - Programming Languages
tags:
  - shell
---

## Unix based systems

Many operating systems are based on the UNIX software architecture. macOS/OSX
(Darwin) and GNU/Linux are two very popular examples. Most web servers run a
version of Linux as their native OS thus a knowledge of command line for UNIX
systems is invaluable for web developers. Windows systems are not UNIX based so
everything that is written here is not applicable to the Windows command line
program Command Prompt although there are obvious conceptual overlaps.

UNIX was initially developed by AT&T and is still owned by them. GNU (the basis
for Linux) is a recursive acronym for ’GNU is not UNIX’. Functionally it is the
same as Unix however, it just doesn’t contain the proprietary code.

## Key terms

### Kernal

The kernel is the central part of an operating system. It manages the operations
of the computer and the hardware; most notably memory and CPU time. There are
two types of kernels: a **micro-kernel**, which only contains basic
functionality; and a **monolithic kernel**, which contains many device drivers.

### Shell

A shell is a user interface for access to an operating system’s services. In
general, operating system shells use either a command-line interface or GUI,
depending on a computer’s role and particular operation. It is named a shell
because it is the outermost layer around the operating system kernel

### Bash

Bash is a Unix shell and command language written by Brian Fox for the GNU
Project as a free software replacement for the Bourne shell. First released in
1989, it has been distributed widely as the default login shell for most Linux
distributions and Apple’s macOS.

## What is the command line?

Command line is both a general computing concept and a specific utility. In its
general sense, engaging with a computer via command line means inputting
abbreviated written commands into a console or terminal window on a computer.
The computer then runs these commands on the basis of the instructions you have
given.

You can get the computer to ‘do things’ (make files, connect to networks etc)
via command line and you can use it to check the status of systems within your
computer.

This mode of engagement contrasts with the engagement facilitated by modern
graphical user interfaces (GUIs) where the user navigates via a combination of
keyboard and mouse inputs and interacts with windows whose functionality is
usually self-explanatory and therefore more user-friendly. Command line predates
GUIs but it is considered a more efficient and expansive means of interacting
with the whole of your computer especially if you are a developer or programmer.

In the more specific sense, the ‘command line’ refers to the location in the
console window where you input your commands. The command line consists in a
user name and the current directory you are in followed by a dollar sign and a
cursor waiting for input.

## Basic orientation

When you are using command line you are always situated somewhere within a file
system. Typically this will be your own user files. directory structure By
default you are always in your home directory, this is represented by the tilda
symbol: `~`. This is why you see the tilda symbol as part of the command line.
In command line, we do not use the term ‘folders’, instead they are called
directories. (I will follow this convention from hereon.) You do not have to
worry too much about remembering the names of specific folders and files you can
always ask the computer to display them to you by using `ls` argument or `pwd`.

## Command line syntax

The syntax of the language used to input commands is analogous to the grammar of
natural languages. We have a verb that is operative on an object/noun and which
can be modified through adverbs. The syntax of a command sequence is as follows:

1. Command (verb): what we want to do
1. Option (adverb): modifying the command - always starts with a hyphen
1. Argument (noun/object): what we want our command to operate on

We will see that not all commands require arguments, but this is the general
structure
