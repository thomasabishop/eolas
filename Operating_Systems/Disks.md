---
tags:
  - Linux
  - Operating_Systems
---

# Disks
A disk is a mass storage [device](./Devices.md) which we can write to and read from.

## SCSI
* Small Computer System Interface, responsible for handling disk access on most Linux systems.
* Pronounced _scuzzy_. 
* It is a protocol that allows communicaton between printers, scanners and other peripherals in addition to harddisks. 
* The `/sda/` device that is the most common designation for the harddisk in Linux systems stands for *SCSI disk*.

## Disk schematic
The following diagram represents the basic anatomy of a disk device.

![](/img/harddisk.png)


* A disk is divided up into **partitions** which are subsections of the overall disk. The kernel presents each partition as a [block device](./Devices.md#Devices.md) as it would with an entire disk.
* The disk dedicates a small part of its contents to a **partition table**: this defines the different partitions that comprise the total disk space. 
* The **filesystem** is a database of files and directories: this comprises the bulk of the partition and is what you interact with in [user space](./User_Space.md) when reading and writing data. 

 ## Partitioning disks 

### Viewing current partitions
Whenever you install a Linux distribution on a real or virtual machine, you must partition the drive. There are three main tools to choose from: `parted`, `g(raphical)parted`, `fdisk`.

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
The two tools disclose that the main harddrive is `/dev/nvme0n1`  (equivalent to `sda` on older machines running Linux) and it has the standard three partitions:
* Boot partition (`/dev/nvme0n1p1`)
  * This takes up the smallest amount of space and exists in order to bootstrap the operating system: to load the kernel into memory when the machine starts. This is where your bootloader is stored and that will be accessed by the BIOS. In Linux this will be GRUB.
* Root dir (`/dev/nvme0n1p2`)
  * This is the domain of the [superuser](./User_Space.md#root-user-superuser). The part of the filesystem that you need sudo priveleges to access and where you manage users 
* Home dir (`/dev/nvme0n1p3`)


### Types of partition table
In general there are two types of partition table: MBR and GPT however each operating system has its own variations on these core types. 


## ! To cover

What is gpt/uefi/efi
ext-4 and dos etc
