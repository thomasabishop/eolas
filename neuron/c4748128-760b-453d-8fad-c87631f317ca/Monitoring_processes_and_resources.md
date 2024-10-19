---
tags:
  - systems-programming
  - Linux
  - procedural
---

# Monitoring processes and resources

## General purpose diagnostic programs (memory, CPU, I/O)

### `top`/`htop`

We can use [ps](Processes.md) to list the
currently running processes but it does not provide much information about the
resource metrics or how the process changes over time. We can use `top` to get
more information.

`top` provides an interactive interface for the information that `ps` displays.
It updates in real time and shows the most active processes based on the CPU
time that they are utilising. You can also order by memory usage.

_Here I have pressed `u` to show only the processes associated with my user:_

![](/static/htop.png)

### Main commands

| Command | Action                          |
| ------- | ------------------------------- |
| -u      | Show processes by selected user |
| M       | Sort by memory usage            |
| P       | Sort by cumulative CPU usage    |
| ?       | View key and explanation        |

### Understanding the categories

- `Main/IO`
  - The first covers all processes. The second focuses on input/output processes
    (i.e. reading and writing to disks and other devices)
- `PRI`
  - This stands for _priority_. This metric reflects the kernel's current
    schedule priority for the process. The higher the value, it is less likely
    that the kernel will schedule the process if there are competing processes
    that require CPU time. The lower the value, the greater priority this
    process has over others.
- `NI`
  - This stands for _nice value_. This metric exists in order to allow
    administrators to nudge or influence the priority of a given process. You
    cannot directly tell the kernel to _do x now instead of y_ but you can make
    what are effectively suggestions by manipulating the nice value.
  - The kernel adds the nice value to the current priority value for the given
    process to determine its next time slot. When you increase the nice value of
    process _P_ you are being "nicer" to the other processes by influencing the
    priority of _P_ downwards so that the other processes receive greater
    precedence from the kernel.
  - By default, the nice value will be 0. To reduce priority of PID 1234, you
    would use:
    ```bash
    $ renice 20 1234
    ```
- `VIRT`
  - The total amount of
    [virtual memory](Virtual_memory_and_the_MMU_in_Linux.md) used by
    the process including: program code, data, shared libraries, pages that have
    been swapped, pages that have been mapped but not used.
- `RES`
  - Stands for _resident size_
  - The non swapped _physical_ memory the process has used
- `SHR`
  - The size of the process's
    [shared pages](Virtual_memory_and_the_MMU_in_Linux.md#shared-pages)
- `S`
  - Status:
    - S for sleeping (idle)
    - R for running
    - D for disk sleep

### `vmstat`

`vmstat` provides similar metrics to `htop` but tells you more about the memory
state and the activities of the kernel in a single row.

The default output is a single line with the averages since boot. You can add a
delay parameter (in secs) which will then output at that interval, allowing you
to see memory usage in realtime, e.g:

```
$ vmstat 5
procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
 2  0      0 4326768 334228 5050952    0    0     8    19   80   10  4  1 94  0  0
 0  0      0 4365520 334260 5054468    0    0     0   125 2140 3434  4  1 94  0  0
 1  0      0 4382400 334276 5068940    0    0     0    77 2102 3988  3  1 95  0  0
 1  0      0 4434000 334288 5052908    0    0     0    25 2859 4278  6  1 92  0  0
 0  0      0 4391576 334304 5086484    0    0     0   110 2899 6480  8  3 90  0  0

```

- `procs`
  - The number of runnable processes (`r`) and the number of blocked (`b`)
    processes
- `memory`
  - The core memory output distinguishing:
    - Total kbs swapped to disk
    - Total kbs free
    - Total kbs currently in
      [buffer](Role_of_memory_in_computation.md#relation-between-cache-and-buffers)
      and not written
    - Total amount of virtual memory in the
      [cache](Role_of_memory_in_computation.md#relation-between-cache-and-buffers)
- `swap`
  - Distinguishes amount of memory
    [swapped](Swap_space.md) in (`si`) to memory and
    swapped out (`so`) to disk
- `io`
  - Disk actions
  - Amount of data read from harddisk (`bi`)
  - Amount of data written to harddisk (`bo`)
- `system`
  - The number of times the kernel switches to kernel code
- `cpu`
  - Percentage of the different CPU behaviours:
    - Responding to user tasks (`us`)
    - Time that it is idle (`id`)

## Files being used by active processes: `lsof`

`lsof` stands for _list open files_. It lists opened files and the processes
using them. Without modifiers it outputs a huge amount of data. The best way to
use it is to execute it against a specific PID. For example the below output
gives me some useful info about which files VS Code is using:

![](/static/lsof.png)

## System calls: `strace`

A system call is when a process requests a service from the
[kernel](The_kernel.md), for instance an I/O operation to
memory. We can trace these system calls with `strace`.

## CPU performance

We can use the `uptime` program to assess overall CPU performance in the form of
a load average.

> Load average is the number of active processes currently ready to run. It is
> an estimate of the number of processes that are capable of using the CPU at
> any given time.

`Uptime` gives you three load averages:

```bash
$ uptime
11:19:16 up 14 days,  3:53,  1 user,  load average: 0.84, 0.57, 0.50
```

- The three numbers are load averages for the past 1 minute, 5 minutes and 15
  minutes respectively.

- A load average close to 0 is usually a good sign because it means that your
  processor isn't being challenged and you are conserving power. Anything equal
  to or above 1 means that a single process is using the CPU nearly all the
  time. You can identify that process with `htop` and it will obviously be near
  to the top. (This is often caused by Chrome and Electron-based software.)

## Memory status

We know that processes primarily interact with virtual memory in the form of
pages which are then translated to physical blocks by the kernel via the
[MMU](Virtual_memory_and_the_MMU_in_Linux.md). There are several tools
which provide windows onto this process.

### System page size

We can view the overall system page size which is a representation of the amount
of virtual memory available:

```bash
$ getconf PAGE_SIZE
4096
```

This will typically be the same for all Linux systems.

### `free` : available physical memory

`free` displays the total amount of free and¬used physical and swap memory in
the system, as well as the
[buffers and caches](Role_of_memory_in_computation.md#relation-between-cache-and-buffers)
used by the kernel.

```bash
$ free
              total        used        free      shared  buff/cache   available
Mem:        16099420     5931512     5039344     2046460     5128564     7781904
Swap:        3145724           0     3145724
```
