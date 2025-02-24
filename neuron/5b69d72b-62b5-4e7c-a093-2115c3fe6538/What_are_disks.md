---
tags:
  - disks
  - computer-architecture
---

# What are disks?

A disk is a mass storage [block_device](Devices.md) which we
can write to and read from.

## SCSI

- Small Computer System Interface, responsible for handling disk access on most
  Linux systems.
- It is a protocol that allows communicaton between printers, scanners and other
  peripherals in addition to harddisks.

## Disk schematic

The following diagram represents the basic anatomy of a disk device.

![](static/harddisk.png)

- A disk is divided up into [partitions](Partitions.md)
  which are subsections of the overall disk. The kernel presents each partition
  as a [block device](Devices.md) as it would with an entire
  disk.
- The disk dedicates a small part of its contents to a **partition table**: this
  defines the different partitions that comprise the total disk space.
- The **filesystem** is a database of files and directories: this comprises the
  bulk of the partition and is what you interact with in
  [user space](User_Space.md) when reading and writing data.
