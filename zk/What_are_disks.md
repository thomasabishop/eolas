---
categories:
  - Linux
  - Operating Systems
tags:
  - disks
---

# What are disks?

A disk is a mass storage [block_device](/Operating_Systems/Devices.md) which we
can write to and read from.

## SCSI

- Small Computer System Interface, responsible for handling disk access on most
  Linux systems.
- It is a protocol that allows communicaton between printers, scanners and other
  peripherals in addition to harddisks.

## Disk schematic

The following diagram represents the basic anatomy of a disk device.

![](/_img/harddisk.png)

- A disk is divided up into [partitions](/Operating_Systems/Disks/Partitions.md)
  which are subsections of the overall disk. The kernel presents each partition
  as a [block device](/Operating_Systems/Devices.md) as it would with an entire
  disk.
- The disk dedicates a small part of its contents to a **partition table**: this
  defines the different partitions that comprise the total disk space.
- The **filesystem** is a database of files and directories: this comprises the
  bulk of the partition and is what you interact with in
  [user space](/Operating_Systems/User_Space.md) when reading and writing data.
