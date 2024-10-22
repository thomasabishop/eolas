---
tags: [operating-systems]
created: Wednesday, July 17, 2024
---

# Operating system API

A user can interact with the operating system either via the GUI or the
[shell](Intro_to_the_Unix_shell.md). (Both ultimately access the OS via the
shell since the UI is an abstraction layer of the shell.)

When _programs_ interact with the operating system they use the **operating
system's API** directly. The GUI and shell also invoke the OS API but the access
is mediated.

Every OS has an API. This specification details how a program should interact
with the OS, exposing functions, properties and data types.

Whether using the GUI or a terminal emulator, the shell translates the user's
commands into API calls. The API the invokes internal operating system code to
perform the action.

![OS API diagram](static/OS-api.svg)

## Example: opening a file

A user can use a file explorer and the mouse to open a file. Or they can open
the file by invoking it from the terminal.

A running application doesn't have to do this. If it's remit includes opening
files, it can do so by calling the OS API.

On a Unix-like system the applicaton would use the `open` API function to open
the file:

```
open("foo.txt", 0_WRONLY|0_CREAT)
```

This command makes the action write-only and creates the file because it does
not yet exist. When the user opens a file in their File Explorer, the
application translates their graphical actions into this API call.

## Different OSs have different APIs

Unix-like and Linux operating systems use variations on the **Portable Operating
System Interface** (POSIX) standard. This defines the OS API and also the rules
for the shell's behaviour and its included utilities.

Variations on this include _Cocoa_, macOS's API and Android's _Android Platform_
API.

Windows has its own API called _The Windows API_. The original version was
16-bit called _Win16_, then when it moved to 32-bits it became _Win32_. When it
moved to an x86 [instruction_set_architecture](Instruction_set_architectures.md)
it became _Win64_. Starting with Windows 10, it introduced the _Universal
Windows Platform_ which aims to make app development consistent accross
different devices that run Windows.
