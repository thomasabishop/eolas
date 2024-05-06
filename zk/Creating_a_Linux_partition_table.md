---
id: h7f8
title: Creating_a_Linux_partition_table
tags: [disks]
created: Monday, May 06, 2024
---

## Creating a partition table

To demonstrate the process of partitioning a harddrive I am going to repartition
an external SATA drive as if it were being primed for a fresh Linux install.

Let's take a look at the disk in its current form:

```
$ fdisk -l

  Disk /dev/sda: 465.74 GiB, 500079525888 bytes, 976717824 sectors
  Disk model: My Passport 071Aumount /dev/sda2
  Disklabel type: gpt
  Disk identifier: 9993F1BB-626C-485F-8542-3CC73BB40953

  Device      Start       End   Sectors   Size Type
  /dev/sda1      40    409639    409600   200M EFI System
  /dev/sda2  409640 976455639 976046000 465.4G Apple HFS/HFS+
```

(This disk was previously used as a backup disk for MacOS so in addition to the
extended partition which has a proprietary file system type (Apple HFS) it has a
primary partition which would load the recovery OS. In contrast to my main
harddrive this uses the standard SCSI prototcol and thus the partitions are
prepended with `sda`.)

#### 1. Unmount existing partitions

```bash
umount /dev/sda1
umount /dev/sda2
```

#### 2. Deleting the existing partitions

```bash
# Load the disk into fdisk
$ sudo fdisk /dev/sda
Command (m for help): d
Partition number (1,2, default 2): 1
Partition 1 has been deleted.
Command (m for help): d
Selected partition 2
Partition 2 has been deleted.

# Verify deletion with p(rint) command
Command (m for help): p
Disk /dev/sda: 465.74 GiB, 500079525888 bytes, 976717824 sectors
Disk model: My Passport 071A
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 9993F1BB-626C-485F-8542-3CC73BB40953

# Write the changes to disk with w(rite)
w

# Check execution:
$ lsblk

NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
sda           8:0    0 465.7G  0 disk
```

So now the disk has no partitions, just the physical disk space and no
mountpoints. We are ready to re-partition.

#### 3. Re-partition the disk

We are going to create a GPT partition table

```bash
$ sudo fdisk /dev/sda
Command (m for help): g
Created a new GPT disklabel (GUID: E316B1A9-6F73-FB41-8CBB-FA4E3C448F2B).

Command (m for help): n
Partition number (1-128, default 1):
First sector (2048-976717790, default 2048):

# Just press enter here

# The last sector is where we put the actual size we want for the partition
Last sector, +/-sectors or +/-size{K,M,G,T,P} (2048-976717790, default 976715775): +100G
Created a new partition 1 of type 'Linux filesystem' and of size 100 GiB.

# For the second and final partition, we follow the same steps but don't add a partition size, since it will default to what is left.

Command (m for help): n
Partition number (2-128, default 2):
First sector (209717248-976717790, default 209717248):
Last sector, +/-sectors or +/-size{K,M,G,T,P} (209717248-976717790, default 976715775):

Created a new partition 2 of type 'Linux filesystem' and of size 365.7 GiB.

# Check the partitions with p(rint)
Command (m for help): p
Disk /dev/sda: 465.74 GiB, 500079525888 bytes, 976717824 sectors
Disk model: My Passport 071A
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 92739978-F7D2-5042-9758-C1429B5C8E11

Device         Start       End   Sectors   Size Type
/dev/sda1       2048 209717247 209715200   100G Linux filesystem
/dev/sda2  209717248 976715775 766998528 365.7G Linux filesystem

# Then write with w
Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.
```

We can now confirm our new partitions:

```bash
$ lsblk
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
sda           8:0    0 465.7G  0 disk
├─sda1        8:1    0   100G  0 part
└─sda2        8:2    0 365.7G  0 part
```

#### Naming a partition

By default each partition will have its GUID as its name, but you can add a
human friendly name with:

```bash
sudo e2label /dev/sda1 my_human_name
```

> Whilst we have created our partitions we cannot yet mount them. This is
> because we have not yet set up a filesystem on the partitions. This is the
> next step.

## Related notes

![Linux disk partitions](./Linux_disk_partitions.md)
