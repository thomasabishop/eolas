---
tags:
  - Linux
  - Operating_Systems
  - disks
  - harddisk
---

# Disks
A disk is a mass storage [device](./Devices.md) which we can write to and read from.

## SCSI
* Small Computer System Interface, responsible for handli;w
* It is a protocol that allows communicaton between printers, scanners and other peripherals in addition to harddisks. 
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

## BIOS and UEFI 

BIOS and UEFI are both firmware that is installed directly on the motherboard of the computer. They are firmware because they are software that is permanent and programmed into read-only memory.

In the context of disks, their most crucial role is locating the operating system on the harddisk and loading it into memory so that the bootstrapping process can begin. However they are also responsible for the computer clock and the management of peripherals. 

As we can see from the `fdisk` readout, the boot partition uses EFI, the storage partition associated with UEFI. 

Whilst UEFI is installed on the hardware, most of its configuration is stored in the EFI partition on the disk, whereas with BIOS, everything is on the chip. This make booting faster with UEFI.

Even though most modern computers use UEFI, it may still be referred to as BIOS for user-continuity. This is like on Windows. With Linux you have to explicitly create your boot process so the two are clearly distinguishable. 
## File systems

File systems are what the computer relies on to ascertain the location and positioning of files on the disk. In Linux it is customary to use FAT-32 for the boot partition and ext-4 for the extended partition. In other operating systems you would do the same but most likely use NFTS for the extended partition.