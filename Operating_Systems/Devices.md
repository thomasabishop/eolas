---
tags:
  - Linux
  - Operating_Systems
---

# Devices

Devices pertain to [disks](./Disks.md) and drives that either exist on the motherboard or that are plugged-in. 

Devices are files but they are different from ordinary files. There are two types: **block** and **stream**. Device files reside in the `/dev/` directory.

Some of the most important device files are:
* `hda` : a harddisk on a port
* `sda` : a harddisk on another port

> Device files are an interface to a driver which accesses the hardware. A driver is therefore part of the Linux kernel.

So when you see  `sda` listed for example, this isn't the harddisk itself, it is a file that communicates with a driver that controls how the kernel can interact with it. This is why when you add a new piece of hardware (such as a mouse for example) you have to install drivers (typically provided by the manufacturer) so that your kernel is able to interact with it and provide it with access to the CPU.

Disks are the most frequent device that you will work with, such as during a fresh install when you first partition the harddrive. 

## `/dev/`

The following `ls` shows my main harddrive partitions:
```
brw-rw----   1 root   disk   259,     1 Jun  4 11:00 nvme0n1p1
brw-rw----   1 root   disk   259,     2 Jun  4 11:00 nvme0n1p2
brw-rw----   1 root   disk   259,     3 Jun  4 11:00 nvme0n1p3
```
The [mode](../Programming_Languages/Shell_Scripting/File_permissions_and_execution.md#what-the-output-means) is different from ordinary files. Each device file is prepended with `b, p, c, s` before the standard permissions. These stand, respectively, for _block, character, pipe_ and _socket_. 
<dl>
  <dt>block</dt>
  <dd>Can be split up into discrete blocks of data facilitating quick random access from the kernel. An example of a block device file is a disk</dd>
  <dt>character</dt>
  <dd>The data is not in discrete chunks, it is a continuous stream of characters. And example of a stream device file is a printer</dd>
</dl>

TODO: Add details on pipes and sockets once I understand them. 
