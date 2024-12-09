---
id: rmvm
tags: [computer-architecture, memory]
created: Monday, June 24, 2024
---

# ROM versus disk loading

I will explore the concept via the practical examples of cartridge-based and
disk-based video games console.

When you insert a disk into an Xbox, the game data is typically read from the
disk and transferred into the console's memory by the OS. If the game is
installed to the hard drive, this initially involves transferring substantial
amounts of data to speed up future access. When you insert a cartridge into a
console like the SNES, the data is not transferred in the same way. Instead, the
cartridge contains a ROM chip that, when inserted, integrates directly with the
motherboard. From the operating system’s point of view, this ROM chip behaves as
an extension of the system’s memory architecture.

The primary advantage of a ROM-based game is significantly reduced latency. The
game data can be accessed as rapidly as any other data moving along the buses of
the motherboard. With a disk, the data must first be read into a buffer and then
transferred to a memory address where it can be accessed by the CPU.

With a ROM, while the console CPU still uses its own RAM to run the game
(similar to disk-based systems), the game data on the ROM can be loaded into
this RAM more quickly because it is directly attached to the motherboard. This
makes the ROM cartridge effectively a fast, directly connected storage device.

However, despite its speed, the limitation of a ROM cartridge is its storage
capacity—it can hold only as much data as the chip can accommodate. In contrast,
a disk can store much more data. This larger storage capacity allows not just
for bigger and more complex games but also for the possibility of expanding the
game through additional data downloaded to the console's hard drive. Such
expansions or patches represent additional data from the console’s storage that,
combined with the original disk data, are synthesized in memory at runtime for
enhanced or updated gameplay experiences.

(Note however that modern cartridge-based consoles like the Nintendo Switch can
also combine ROM-data with expanded data from the console HDD, sourced from the
internet.)

Both disks and ROMs are forms of static storage in the context of a game
console. While disks can technically be overwritten with new data, in practice,
manufacturers implement various locks and protections to prevent this. Any
changes or additions to the game, such as patches or expansions, are not written
back to the original disk. Instead, these updates are stored on the console's
hard drive.

Therefore, if you download an expansion for a game on your Xbox, the original
disk remains unchanged as when you first purchased it. Consequently, if you were
to take that disk and load it on another Xbox, it would not include any of the
expansions or updates. The game would function in its original form, as the
additional content and updates reside solely on the hard drive of the first
console where they were downloaded.

## Related notes
