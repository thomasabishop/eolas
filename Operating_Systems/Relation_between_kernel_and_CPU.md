---
categories:
  - Linux
  - Operating Systems
  - Hardware
tags:
  - kernel
  - CPU
---

# Relation between the kernel and CPU

It can be confusing to understand how the kernel and CPU interact with one another. Whilst it is true to say the kernel mediates between the hardware and user processes, this led me to think that the kernel was somehow 'over and above' the actions of the CPU. This is wrong and if you think about it, how could this be since any process, kernel included, requires the processor? The kernel is executed by and loaded into the CPU just like any other instruction in the [fetch, decode, execute cycle](/Computer_Architecture/CPU/Fetch_decode_execute.md) of the CPU.

However as a process, the kernel is the 'first amongst equals' given that it is the core embodiment of the operating system. At boot time, the kernel is injected into memory and at this point the CPU _looks to this address_ in memory in order to source its first instruction. That's how the kernel gets going. It is the first instruction that the CPU fetches and this is what allows the kernel to play its mediatory role. However most of the fetch, decode, execute cycles of the CPU take place independently of the kernel.

![](/img/kernel-cpu-interaction.svg)

> Fetch decode and execute refer to processor pipeline stages. They occur automatically as part of normal processor operation, the kernel doesn’t generally have any direct control over how that happens...When the boot loader loads the kernel, it points the CPU’s program counter to an entry point in the kernel’s code. From there, the CPU will continue executing (fetching decoding and executing) kernel code until you point the program counter to a userspace program, where it will continue executing userspace code until an interrupt points the program counter back into kernel code. That’s basically what the CPU will be doing from boot up to shut down; switching between executing kernel code and executing userspace code ([Reddit](https://www.reddit.com/r/osdev/comments/wdskj5/how_does_kernel_decide_if_use_cpu_or_gpu_after/))

This is because of [context switching](), when the CPU is running its cycle, the kernel is idle waiting for it to complete. Once control switches back to the kernel it can then run its next duty which will be either process, memory or device management or system calls. Then it will hand control over to either the processor or user space.
