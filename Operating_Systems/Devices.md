---
tags:
  - Linux
  - Operating_Systems
---

# Devices

Devices are hardware that require access to the CPU in order to function. Devices can either be external and pluged-in or internal to the motherboard. The most common type of device that you will work with are 
[disks](./Disks.md). 

Devices are files but they have some different capabilities that ordinary files. There are two types: **block** and **stream**. Device files reside in the `/dev/` directory.

Some of the most important device files are:
* `hda` : a harddisk on a port
* `sda` : a harddisk on another port

> Device files are an interface to a driver which accesses the hardware. A driver is therefore part of the Linux kernel.

So when you see  `sda` listed for example, this isn't the harddisk itself, it is a file that communicates with a driver that controls how the kernel can interact with it. This is why when you add a new piece of hardware (such as a mouse for example) you have to install drivers (typically provided by the manufacturer) so that your kernel is able to interact with it and provide it with access to the CPU.

## Listing devices 

The following `ls` within the `dev` directory shows my main harddrive partitions:
```
brw-rw----   1 root   disk   259,     1 Jun  4 11:00 nvme0n1p1
brw-rw----   1 root   disk   259,     2 Jun  4 11:00 nvme0n1p2
brw-rw----   1 root   disk   259,     3 Jun  4 11:00 nvme0n1p3
```
> Since device files are files we can interact with them using standard file programs like `ls` and `cat`. 

The [mode](../Programming_Languages/Shell_Scripting/File_permissions_and_execution.md#what-the-output-means) is different from ordinary files. Each device file is prepended with `b, p, c, s` before the standard permissions. These stand for the major types of devices: _block, character, pipe_ and _socket_. 
<dl>
  <dt>block</dt>
  <dd>These devices transfer data as large fixed-size blocks. These are the most common device type and include harddrives and filesystems. As the data can be split up into discrete blocks of data, this facilitates quick random access from the kernel. </dd>
  <dt>character</dt>
  <dd>These devices transfer data one character at a time.The data is not in discrete chunks, it is a continuous stream of characters. And example of a stream device file is a printer however many character devices (such as `/dev/null`) are not physically connected to the machine.</dd>
  <dt>pipe<dt>
  <dd></dd>
  <dt>socket<dt>
  <dd></dd>
</dl>

TODO: Add details on pipes and sockets once I understand them. 
