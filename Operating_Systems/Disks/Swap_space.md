---
categories:
  - Linux
  - Operating Systems
tags:
  - memory
  - disks
---

# Swap space

A swap partition is a partition on a disk that is not intended to be used as a filesystem. Instead, it is a part of the disk that is used to augment the main memory.

If you run out of memory and have set up a swap partition, the OS will be able to move pieces of memory to and from disk storage. This is called _swapping_ because pieces of idle programs are swapped to the disk in exchange for active pieces residing on the disk.

## View current swap usage

If you have a swap space established, the command `free` will show current usage:

```bash
free
               total        used        free      shared  buff/cache   available
Mem:        16099420     3031572    10157652     1153144     2910196    11605820
Swap:        3145724           0     3145724
```

## Create a swap partition

To use an existing disk partition as a swap you can run the command `mkswap [device]` and then `swapon [device]` to register the space with the [kernel](/Operating_Systems/The_Kernel.md).

### Add to `fstab`

You will want the swap to be activated every time the OS boots so add the following line to the [fstab](/Operating_Systems/Disks/Filesystems.md#fstab), where `/sda3` is used as the example partition:

```bash
/dev/sda3e none swap sw 0 0
```

## Create a swap file

// Add info here
