---
categories:
  - Operating Systems
  - Linux
tags:
---

# Basic model of a \*nix operating system

We can abstract the Linux OS into three operational levels or tiers, from the
bottom up:

<dl>
<dt>User processes: user space</dt>
<dd>The running programs that the kernel manages. Also known as the user space which is the memory that the kernal assigns for user processes. Comprising:
<ul>
    <li>Graphical user interface</li>
    <li>Servers</li> 
    <li>Shell</li>    
  </ul>
<dt>Kernel: kernel space</dt>
</dd>
<dd>The core of the operating system. Software residing in memory that tells the CPU where to look for its next task. Acts as a mediator and primary interface between the hardware and the user processes. Known as kernel space: the memory that the kernel allocates for itself. Comprising:
  <ul>
    <li>System calls</li>
    <li>Process management</li> 
    <li>Memory management</li>    
    <li>Device drivers</li>    
  </ul>
</dd>
<dt>Hardware</dt>
<dd>The base: one or more CPUs and RAM memory performing computations and writing to memory. Comprising:
  <ul>
    <li>Processor (CPU)</li>
    <li>Main memory (RAM)</li> 
    <li>Disks</li>    
    <li>Network ports</li>    
  </ul>
</dl>

!! Add info on kernel mode and user mode
https://www.geeksforgeeks.org/user-mode-and-kernel-mode-switching/
