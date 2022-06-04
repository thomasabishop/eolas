---
tags:
  - Linux
  - Operating_Systems
---

# Devices

Devices pertain to disks and drives that either exist on the motherboard or that are plugged-in. 

Devices are files but they are different from ordinary files. There are two types: **block** and **stream**. Device files reside in the `/dev/` directory.

Some of the most important device files are:
* `hda` : a harddisk on a port
* `sda` : a harddisk on another port

> Device files are an interface to a driver which accesses the hardware. A driver is therefore part of the Linux kernel.

So when you see  `sda` listed for example, this isn't the harddisk itself, it is a file that communicates with a driver that controls how the kernel can interact with it. This is why when you add a new piece of hardware (such as a mouse for example) you have to install drivers (typically provided by the manufacturer) so that your kernel is able to interact with it and provide it with access to the CPU.

## `/dev/`

```
brw-rw----   1 root   disk   259,     1 Jun  4 11:00 nvme0n1p1
brw-rw----   1 root   disk   259,     2 Jun  4 11:00 nvme0n1p2
brw-rw----   1 root   disk   259,     3 Jun  4 11:00 nvme0n1p3
```