---
id: rmvm
title: ROM versus disk loading
tags: [computer-architecture, memory]
created: Monday, June 24, 2024
---

# ROM versus disk loading

I will explore the concept via the practical examples of cartridge-based and
disk-based video games console.

When you insert a disk into an XBox, the game data is transferred from the disk
into the console's memory by the OS. When you insert a cartridge into a SNES,
there is no transferral of data. The game data is stored on a chip and this chip
is attached to the motherboard. From the point of view of the OS, it is just
another chip along with the others that comprise the motherboard.

The chief advantage with a ROM game is that the latency is greatly reduced. The
game data can be accessed as rapidly as any other data travelling along the
busses of the motherboard. With a disk, the bytes have to be transferred in a
buffer from the disk into a memory address and from there, accessed by the CPU.

With a ROM, the console CPU still uses its own memory to run the game (as with
disk-based consoles), it is just that the game data on the ROM can be loaded
into memory quicker because it is attached to the motherboard.

becomes part of the motherboard just like the other chips that comprise the
motherboard.

## Related notes
