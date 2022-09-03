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

### Understanding the categories

- `Main/IO`
  - The first covers all processes. The second focuses on input/output processes (i.e. reading and writing to disks and other devices)
- `PRI`
  - This stands for _priority_. This metric reflects the kernel's current schedule priority for the process. The higher the value, it is less likely that the kernel will schedule the process if there are competing processes that require CPU time. The lower the value, the greater priority this process has over others.
- `NI`
  - This stands for _nice value_. This metric exists in order to allow administrators to nudge or influence the priority of a given process. You cannot directly tell the kernel to _do x now instead of y_ but you can make what are effectively suggestions by manipulating the nice value.
  - The kernel adds the nice value to the current priority value for the given process to determine its next time slot. When you increase the nice value of process _P_ you are being "nicer" to the other processes by influencing the priority of _P_ downwards so that the other processes receive greater precedence from the kernel.
  - By default, the nice value will be 0. To reduce priority of PID 1234, you would use:
    ```bash
    $ renice 20 1234
    ```
- `VIRT`
  - The total amount of [virtual memory](/Operating_Systems/Virtual_memory_and_the_MMU.md) used by the process including: program code, data, shared libraries, pages that have been swapped, pages that have been mapped but not used.
- `RES`
  - Stands for _resident size_
  - The non swapped _physical_ memory the process has used
- `SHR`
  - The size of the process's [shared pages](/Operating_Systems/Virtual_memory_and_the_MMU.md#shared-pages)

## Files being used by active processes: `lsof`

`lsof` stands for _list open files_. It lists opened files and the processes using them. Without modifiers it outputs a huge amount of data. The best way to use it is to execute it against a specific PID. For example the below output gives me some useful info about which files VS Code is using:

![](/img/lsof.png)

## System calls: `strace`

A system call is when a process requests a service from the [kernel](/Operating_Systems/The_Kernel.md), for instance an I/O operation to memory. We can trace these system calls with `strace`.

## CPU performance

We can use the `uptime` program to assess overall CPU performance in the form of a load average.

> Load average is the number of active processes currently ready to run. It is an estimate of the number of processes that are capable of using the CPU at any given time.

`Uptime` gives you three load averages:

```bash
$ uptime
11:19:16 up 14 days,  3:53,  1 user,  load average: 0.84, 0.57, 0.50
```

- The three numbers are load averages for the past 1 minute, 5 minutes and 15 minutes respectively.

- A load average close to 0 is usually a good sign because it means that your processor isn't being challenged and you are conserving power. Anything equal to or above 1 means that a single process is using the CPU nearly all the time. You can identify that process with `htop` and it will obviously be near to the top. (This is often caused by Chrome and Electron-based software.)

## Memory status

We know that processes primarily interact with virtual memory in the form of pages which are then translated to physical blocks by the kernel via the [MMU](/Operating_Systems/Virtual_memory_and_the_MMU.md). There are several tools which provide windows onto this process.

### System page size

We can view the overall system page size which is a representation of the amount of virtual memory available:

```bash
$ getconf PAGE_SIZE
4096
```

This will typically be the same for all Linux systems.

### Page faults

There are two kinds of error that can occur with relation to paged memory:

- minor page faults
  - The desired page is in main memory but the MMU doesn't currently know where it is
- major page faults
  - The desired page is not in main memory at all. Therefore the kernel must fetch it from disk

Minor page faults are very common and are to be expected; they resolve quickly. On the other hand too many major page faults can slow the system down both because of the time-costly process of fetching data from disk and because it demands more kernel resources to locate the missing page, which puts other processes on hold.
