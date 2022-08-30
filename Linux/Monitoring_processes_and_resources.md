---
categories:
  - Linux
tags: [sytems-programming]
---

# Monitoring processes and resources

## Processor time and memory usage: `top`, `htop` etc

We can use [ps](/Programming_Languages/Shell_Scripting/Processes.md) to list the currently running processes but it does not provide much information about the resource metrics or how the process changes over time. We can use `top` to get more information.

`top` provides an interactive interface for the information that `ps` displays. It updates in real time and shows the most active processes based on the CPU time that they are utilising. You can also order by memory usage.

_Here I have pressed `u` to show only the processes associated with my user:_

![](/img/htop.png)

### Main commands

| Command | Action                          |
| ------- | ------------------------------- |
| -u      | Show processes by selected user |
| M       | Sort by memory usage            |
| P       | Sort by cumulative CPU usage    |
| ?       | View key and explanation        |

## Files being used by active processes: `lsof`

`lsof` stands for _list open files_. It lists opened files and the processes using them. Without modifiers it outputs a huge amount of data. The best way to use it is to execute it against a specific PID. For example the below output gives me some useful info about which files VS Code is using:

![](/img/lsof.png)

## System calls: `strace`

A system call is when a process requests a service from the [kernel](/Operating_Systems/The_Kernel.md), for instance an I/O operation to memory. We can trace these system calls with `strace`.
