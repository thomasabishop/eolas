---
tags:
  - Linux
  - Operating_Systems
  - disks
  - disk-partition
  - filesystems
  - harddisk
  - BIOS
  - UEFI
---

# Disks

A disk is a mass storage [device](./Devices.md) which we can write to and read from.

## SCSI
* Small Computer System Interface, responsible for handling disk access on most Linux systems.
* It is a protocol that allows communicaton between printers, scanners and other peripherals in addition to harddisks. 
## Disk schematic
The following diagram represents the basic anatomy of a disk device.

![](/img/harddisk.png)


* A disk is divided up into **partitions** which are subsections of the overall disk. The kernel presents each partition as a [block device](./Devices.md#Devices.md) as it would with an entire disk.
* The disk dedicates a small part of its contents to a **partition table**: this defines the different partitions that comprise the total disk space. 
* The **filesystem** is a database of files and directories: this comprises the bulk of the partition and is what you interact with in [user space](./User_Space.md) when reading and writing data. 

## Disk partitions

### Viewing current partitions
Whenever you install a Linux distribution on a real or virtual machine, you must partition the drive. There are three main tools to choose from: `parted`, `g(raphical)parted`, `fdisk`.

For a top-level overview of your disks and their main partitions you can run `lsblk` (_list block devices_):

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
The two tools disclose that the main harddrive is `/dev/nvme0n1`  (equivalent to `sda` on older machines running Linux) and it has the standard three partitions:
* Boot partition (`/dev/nvme0n1p1`)
  * This takes up the smallest amount of space and exists in order to bootstrap the operating system: to load the kernel into memory when the machine starts. This is where your bootloader is stored and that will be accessed by the BIOS. In Linux this will be GRUB.
* Root dir (`/dev/nvme0n1p2`)
  * This is the domain of the [superuser](./User_Space.md#root-user-superuser). The part of the filesystem that you need sudo priveleges to access and where you manage users 
* Home dir (`/dev/nvme0n1p3`)
  * The domain of the user(s)

### Types of partition table
In the Linux world there are two main types: MBR and GPT. The type of table used determines how the OS boots. So although partition tables are also responsible for the partitioning of non-bootable sectors of a disk, **they are distinguished by the boot system they implement**. 
If we look at the output from `parted` and `fdisk` above we see that the harddrive uses the GPT partition type.

#### Primary, extended and logical partitions
Most standard partition tables allow for primary, extended and logical partitions. The primary partition is the part of the harddisk that contains the operating system and is thus described as 'bootable' and may be called the 'boot partition'. During the bootstrapping process this is injected into memory as the [kernel](The_Kernel.md). 

The extended partition is basically everything other than the primary partition. This is typically subdivided into other partitions that are called *logical* partitions. This is because they physically reside in the same sector of the disk (the extended partition) but are treated as virtual and independent disks.  

In our example above:
* `/dev/nvme0n1p1`  is the primary/boot partition
* `/dev/nvme0n1p2` and `/dev/nvme0n1p3` comprise the extended partition and by themselves are each logical partitions.  

 

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

### Creating a partition table

To demonstrate the process of partitioning a harddrive I am going to repartition an external SATA drive as if it were being primed for a fresh Linux install.

Let's take a look at the disk in its current form:

```
$ fdisk -l

  Disk /dev/sda: 465.74 GiB, 500079525888 bytes, 976717824 sectors
  Disk model: My Passport 071A
  Units: sectors of 1 * 512 = 512 bytes
  Sector size (logical/physical): 512 bytes / 512 bytes
  I/O size (minimum/optimal): 512 bytes / 512 bytes
  Disklabel type: gpt
  Disk identifier: 9993F1BB-626C-485F-8542-3CC73BB40953

  Device      Start       End   Sectors   Size Type
  /dev/sda1      40    409639    409600   200M EFI System
  /dev/sda2  409640 976455639 976046000 465.4G Apple HFS/HFS+
```
(This disk was previously used as a backup disk for MacOS so in addition to the extended partition which has a proprietary file system type (Apple HFS) it has a primary partition which would load the recovery OS. In contrast to my main harddrive this uses the standard SCSI prototcol and thus the partitions are prepended with `sda`.)


#### 1. Unmount existing partitions

```bash
umount /dev/sda1
umount /dev/sda2
```
#### 2. Deleting the existing partitions
```bash
# Load the disk into fdisk
$ sudo fdisk /dev/sda

# Select delete and run for each partition
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
So now the disk has no partitions, just the physical disk space and no mountpoints. We are ready to re-partition.

#### 3.  Re-partition the disk
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

We can now confirm out new partitions:

```bash
$ lsblk
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
sda           8:0    0 465.7G  0 disk 
├─sda1        8:1    0   100G  0 part 
└─sda2        8:2    0 365.7G  0 part 
```

> Whilst we have created our partitions we cannot yet mount them. This is because we have not yet set up a filesystem on the partitions. This is the next step. 

### Filesystems
We cannot yet mount or interact with the partitions we have created. This is because we have not added a filesystem to each partition.

> A filesytem is a form of [database](/Databases/Basic_database_concepts.md); it supplies the structure to transform a simple block device into the sophisticated hierarchy of files and subdirectories that users can understand.

Linux recognises many types of filesystems. The native Linux filesystem is the **ext4** (Fourth Extended Filesystem). Another common filesystem is **FAT** (File Allocation Table). Instances of this include _MSDOS_,_EXFAT_,_FAT-32_. They originate from Microsoft systems 

### Creating a filesystem

Remember we have two partitions on our external drive: `sda1` and `sda2`. We are going to use the `mkfs` utility to create an EXT4 system on both.  

```bash
mkfs -t ext4 /dev/sda1
mkfs -t ext4 /dev/sda2
```

### Mounting a filesystem 
We can now mount our filesystems. Whem we mount, we must specify the following criteria with the request:

* The name of the device we want to mount.
  * This will be the name or the partition. However the names (`sda` etc) assigned by the OS can change. In these cases and with GPT-based partitions you can use the UUID.
* The filesystem type (optional)
* The **mount point**  
  * This is the place within the existing filesystem where you want to mount the partition.
  * This can be anywhere, but in the example we will use the `/mnt' directory
  * When you mount to a directory, this directory _becomes_ the disk you have mounted, you will not see it as a subdirectory within the the mount point, you will just see the contents of the disk itself 

```bash
umount -t /dev/sda1 /mnt
```

## BIOS and UEFI 

BIOS and UEFI are both firmware that is installed directly on the motherboard of the computer. They are firmware because they are software that is permanent and programmed into read-only memory.

In the context of disks, their most crucial role is locating the operating system on the harddisk and loading it into memory so that the bootstrapping process can begin. However they are also responsible for the computer clock and the management of peripherals. 

As we can see from the `fdisk` readout, the boot partition uses EFI, the storage partition associated with UEFI. 

Whilst UEFI is installed on the hardware, most of its configuration is stored in the EFI partition on the disk, whereas with BIOS, everything is on the chip. This make booting faster with UEFI.

Even though most modern computers use UEFI, it may still be referred to as BIOS for user-continuity. This is like on Windows. With Linux you have to explicitly create your boot process so the two are clearly distinguishable. 
