---
categories:
  - Linux
  - Operating Systems
tags:
  - disks
---

# The boot process

The primary or boot
[partition](Disks.md#primary-extended-and-logical-partitions) of a harddisk
contains a bootloader. It is the job of the bootloader to locate the
[kernel](/Operating_Systems/The_Kernel.md) on the harddrive and inject it into
memory so that they operating system can start. This is the boot process.

## Boot loaders

The boot loader loads the kernel into memory from the disk and then starts the
kernel with a set of kernel parameters.

Like the kernel itself, the boot loader requires a driver in order to access the
disk but it can't use the same one as the kernel since at this point, the kernel
is not yet loaded into memory. So it has its own special driver: this is either
the BIOS or the UEFI firmware.

A boot loader's core functionality includes the ability to do the following:

- select from multiple kernels
- switch between sets of kernel parameters
- provide support for booting other operating systems

### BIOS and UEFI

BIOS and UEFI are both firmware that is installed directly on the motherboard of
the computer. They are firmware because they are software that is permanent and
programmed into read-only memory.

In the context of disks, their most crucial role is locating the operating
system on the harddisk and loading it into memory so that the bootstrapping
process can begin. However they are also responsible for the computer clock and
the management of peripherals.

As we can see from the `fdisk` readout, the boot partition uses EFI, the storage
partition associated with UEFI.

```bash
Device            Start        End   Sectors   Size Type
/dev/nvme0n1p1     2048    1001471    999424   488M EFI System
/dev/nvme0n1p2  1001472   59594751  58593280  27.9G Linux filesystem
/dev/nvme0n1p3 59594752 1000214527 940619776 448.5G Linux filesystem
```

Whilst UEFI is installed on the hardware, most of its configuration is stored in
the EFI partition on the disk, whereas with BIOS, everything is on the chip.
This make booting faster with UEFI.

Even though most modern computers use UEFI, it may still be referred to as BIOS
for user-continuity. This is like on Windows. With Linux you have to explicitly
create your boot process so the two are clearly distinguishable.

### GRUB

The de facto standard boot loader for Linux is GRUB: Grand Unified Boot Loader.

![](/img/grub.jpg)

You see the GRUB default menu when you first start a Linux machine. It will
offer you various options for loading your installed OS or other OSs. GRUB is a
filesystem like the main disk. If you press `e` in this screen you can view and
edit specific boot parameters. Pressing `c` gives you access to the GRUB command
line interface. This allows you to interact with GRUB in the same way as you
would with any other filesystem, allowing for advanced configuration.

## The boot sequence

1. The machine's BIOS or boot firmware (in the case of UEFI) loads and runs a
   boot loader. It finds the bootloader by looking for the part of the disk that
   contains either the MBR or GPT sector.
2. The boot loader finds the kernel image on disk, loads it into memory and
   starts it.
3. The kernel initializes the devices and its drivers.
4. The kernel mounts the root filesystem.
5. The kernel starts a program called **init**. It has a
   [process id](/Programming_Languages/Shell_Scripting/Processes.md#processes-ps)
   of 1. This is the point at which [user space](User_Space.md) starts.
6. Init sets the rest of the system processes in motion.
7. At the end of the boot process, init starts a process allowing you to log in.

## Boot diagnostics

Linux keeps a log of the boot process as part of the [journal]() log of
everything that happens on disk. We can use the command `journalct -k` to view
the diagnostics generated during the boot. Here is a selection:

```
Jul 07 07:12:58 archbish kernel: Linux version 5.18.5-arch1-1 (linux@archlinux) (gcc (GCC) 12.1.0, GNU ld (GNU Binutils) 2.38) #1 SMP PREEMPT_DYNAMIC Thu, 16 Jun 2022 20:40:45 +0000
Jul 07 07:12:58 archbish kernel: Command line: BOOT_IMAGE=/boot/vmlinuz-linux root=UUID=2ee6b834-0857-49dc-b8ba-a24d46d228ae rw loglevel=3 quiet
Jul 07 07:12:58 archbish kernel: x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
Jul 07 07:12:58 archbish kernel: x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
Jul 07 07:12:58 archbish kernel: x86/fpu: Supporting XSAVE feature 0x020: 'AVX-512 opmask'
Jul 07 07:12:58 archbish kernel: x86/fpu: Supporting XSAVE feature 0x040: 'AVX-512 Hi256'
Jul 07 07:12:58 archbish kernel: x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
Jul 07 07:12:58 archbish kernel: x86/fpu: xstate_offset[5]:  832, xstate_sizes[5]:   64
Jul 07 07:12:58 archbish kernel: x86/fpu: xstate_offset[6]:  896, xstate_sizes[6]:  512
Jul 07 07:12:58 archbish kernel: x86/fpu: xstate_offset[7]: 1408, xstate_sizes[7]: 1024
Jul 07 07:12:58 archbish kernel: x86/fpu: xstate_offset[9]: 2432, xstate_sizes[9]:    8
Jul 07 07:12:58 archbish kernel: x86/fpu: Enabled xstate features 0x2e7, context size is 2440 bytes, using 'compacted' format.
Jul 07 07:12:58 archbish kernel: signal: max sigframe size: 3632
Jul 07 07:12:58 archbish kernel: BIOS-provided physical RAM map:
Jul 07 07:12:58 archbish kernel: BIOS-e820: [mem 0x0000000000000000-0x000000000009efff] usable
Jul 07 07:12:58 archbish kernel: BIOS-e820: [mem 0x000000000009f000-0x00000000000fffff] reserved
Jul 07 07:12:58 archbish kernel: BIOS-e820: [mem 0x0000000000100000-0x000000008ef6efff] usable
Jul 07 07:12:58 archbish kernel: BIOS-e820: [mem 0x000000008ef6f000-0x000000008f03efff] type 20
Jul 07 07:12:58 archbish kernel: BIOS-e820: [mem 0x000000008f03f000-0x0000000093f2efff] reserved
Jul 07 07:12:58 archbish kernel: BIOS-e820: [mem 0x0000000093f2f000-0x0000000094b2efff] ACPI NVS
Jul 07 07:12:58 archbish kernel: BIOS-e820: [mem 0x0000000094b2f000-0x0000000094bfefff] ACPI data
Jul 07 07:12:58 archbish kernel: BIOS-e820: [mem 0x0000000094bff000-0x0000000094bfffff] usable
Jul 07 07:12:58 archbish kernel: NX (Execute Disable) protection: active
Jul 07 07:12:58 archbish kernel: efi: EFI v2.70 by Lenovo
Jul 07 07:12:58 archbish kernel: efi: ACPI=0x94bfe000 ACPI 2.0=0x94bfe014 SMBIOS=0x90cbd000 SMBIOS 3.0=0x90cb0000 TPMFinalLog=0x9498f000 MEMATTR=0x8aa30018 ESRT=0x8ab9c000
Jul 07 07:12:58 archbish kernel: SMBIOS 3.2.0 present.
Jul 07 07:12:58 archbish kernel: DMI: LENOVO 20W4000NUK/20W4000NUK, BIOS N34ET40W (1.40 ) 06/25/2021
Jul 07 07:12:58 archbish kernel: tsc: Detected 2400.000 MHz processor
Jul 07 07:12:58 archbish kernel: tsc: Detected 2419.200 MHz TSC
Jul 07 07:12:58 archbish kernel: e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
Jul 07 07:12:58 archbish kernel: e820: remove [mem 0x000a0000-0x000fffff] usable
Jul 07 07:12:58 archbish kernel: last_pfn = 0x45f800 max_arch_pfn = 0x400000000
Jul 07 07:12:58 archbish kernel: x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT
Jul 07 07:12:58 archbish kernel: last_pfn = 0x94c00 max_arch_pfn = 0x400000000
Jul 07 07:12:58 archbish kernel: esrt: Reserving ESRT space from 0x000000008ab9c000 to 0x000000008ab9c150.
Jul 07 07:12:58 archbish kernel: e820: update [mem 0x8ab9c000-0x8ab9cfff] usable ==> reserved
```

We can see that the first thing that is registered is the OS image that contains
the kernel. From this point on, the kernel is active and doing its work.

## Initial kernel actions

The diagnostics above are a running commentary provided by the kernel itself
about its actions. The details will be specific to the machine in question but
the general sequence is as follows for all operating systems:

1. CPU inspection
2. Memory inspection
3. Device bus discovery
4. Device discovery
5. Auxiliary kernel subsystem setup (networks etc)
6. Mounting of the root filesystem
7. Starting of user space
