---
tags:
  - disks
---

# Linux disk partitions

A disk is divided up into partitions which are subsections of the overall disk.
The kernel presents each partition as a [block device](Devices.md#Devices) as it
would with an entire disk.

The disk dedicates a small part of its contents to a **partition table**: this
defines the different partitions that comprise the total disk space.

## Viewing current partitions

Whenever you install a Linux distribution on a real or virtual machine, you must
partition the drive. There are three main tools to choose from: `parted`,
`g(raphical)parted`, `fdisk`.

For a top-level overview of your disks and their main partitions you can run
`lsblk` (_list block devices_):

```bash
$ lsblk

NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
sda           8:0    0 465.7G  0 disk
├─sda1        8:1    0   200M  0 part
└─sda2        8:2    0 465.4G  0 part /run/media/thomas/ganesh
nvme0n1     259:0    0 476.9G  0 disk
├─nvme0n1p1 259:1    0   488M  0 part
├─nvme0n1p2 259:2    0  27.9G  0 part /
└─nvme0n1p3 259:3    0 448.5G  0 part /home
```

We can use `parted -l` to view the partition table for the current machine:

```bash
Model: SKHynix_HFS512GDE9X081N (nvme)
Disk /dev/nvme0n1: 512GB
Sector size (logical/physical): 512B/512B
Partition Table: gpt
Disk Flags:

Number  Start   End     Size    File system  Name  Flags
 1      1049kB  513MB   512MB   fat32              boot, esp
 2      513MB   30.5GB  30.0GB  ext4
 3      30.5GB  512GB   482GB   ext4
```

We can use `fdisk -l` to get slightly more info:

```bash
disk /dev/nvme0n1: 476.94 GiB, 512110190592 bytes, 1000215216 sectors
Disk model: SKHynix_HFS512GDE9X081N
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 08175E77-CB9F-C34A-9032-DF29A3F8F0FE

Device            Start        End   Sectors   Size Type
/dev/nvme0n1p1     2048    1001471    999424   488M EFI System
/dev/nvme0n1p2  1001472   59594751  58593280  27.9G Linux filesystem
/dev/nvme0n1p3 59594752 1000214527 940619776 448.5G Linux filesystem
```

The two tools disclose that the main harddrive is `/dev/nvme0n1` (equivalent to
`sda` on older machines running Linux) and it has the standard three partitions:

- Boot partition (`/dev/nvme0n1p1`)
  - This takes up the smallest amount of space and exists in order to bootstrap
    the operating system: to load the kernel into memory when the machine
    starts. This is where your bootloader is stored and that will be accessed by
    the BIOS. In Linux this will be GRUB.
- Root dir (`/dev/nvme0n1p2`)
  - This is the domain of the [superuser](User_Space.md#root-user-superuser).
    The part of the filesystem that you need sudo priveleges to access and where
    you manage users
- Home dir (`/dev/nvme0n1p3`)
  - The domain of the user(s)

## Types of partition table

In the Linux world there are two main types: MBR and GPT. The type of table used
determines how the OS boots. So although partition tables are also responsible
for the partitioning of non-bootable sectors of a disk, **they are distinguished
by the boot system they implement**. If we look at the output from `parted` and
`fdisk` above we see that the harddrive uses the GPT partition type.

#### Primary, extended and logical partitions

Most standard partition tables allow for primary, extended and logical
partitions. The primary partition is the part of the harddisk that contains the
operating system and is thus described as 'bootable' and may be called the 'boot
partition'. During the bootstrapping process this is injected into memory as the
[kernel](The_Kernel.md).

The extended partition is basically everything other than the primary partition.
This is typically subdivided into other partitions that are called _logical_
partitions. This is because they physically reside in the same sector of the
disk (the extended partition) but are treated as virtual and independent disks.

In our example above:

- `/dev/nvme0n1p1` is the primary/boot partition
- `/dev/nvme0n1p2` and `/dev/nvme0n1p3` comprise the extended partition and by
  themselves are each logical partitions.

<dl>
  <dt>MBR</dt>
  <dd> 
    <ul>
      <li>Stands for Master Boot Record</li> 
      <li>Uses BIOS in the boot process</li> 
      <li>Can only works with disks up to 2TB in size</li> 
      <li>Only supports 4 primary partitions. This means the number of operating systems you install is limitied to this number.</li> 
      <li>This is the first 512 bytes of a storage device, preceding the first partition.</li>
    </ul> 
  </dd>
  <dt>GPT</dt>
  <dd>
  <ul>
      <li>Stands for GUID Partition Table </li>
      <li>Gradually replacing MBR</li>
      <li>Uses UEFI instead of BIOS</li>
      <li>As name indicates, every partition on disk has its own globally-unique identifier</li>
      <li>Vastly more partitions available than with MBR (dependent on operating system)</li>
      <li>Offers greater recovery options and anti-corruption safeguards</li> 
    </ul>
</dd>
</dl>

## Related notes

![Creating a Linux partition table](./Creating_a_Linux_partition_table.md)
