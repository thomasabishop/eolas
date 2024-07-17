---
title: Operating_system_API
tags: [operating-systems]
created: Wednesday, July 17, 2024
---

# Operating system API

A user can interact with the operating system either via the GUI or the shell.
(The UI is in fact an abstraction for interfacing with the shell.) When
_programs_ interact with the operating system they use the operating system's
API.

Every OS has an API. This specification details how a program should interact
with the OS, exposing functions, properties and data types.

Whether using the GUI or a terminal emulator, the shell translates the user's
commands into API calls. The API the invokes internal operating system code to
perform the action.

![OS API diagram](../img/OS-api.svg)

## Example: opening a file

A user can use a file explorer and the mouse to open a file. However a running
application doesn't have to do this. Instead it can call the OS API.

On a Unix-like system the applicaton would use the `open` API function to open
the file:

```
open("foo.txt", 0_WRONLY|0_CREAT)
```

This command makes the action write-only and creates the file because it does
not yet exist. When the user opens a file in their File Explorer, the
application translates their graphical actions into this API call.
