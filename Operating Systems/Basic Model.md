---
tags:
  - os
  - Linux
---

# Basic model of a (*nix) operating system

We can abstract the Linux OS into three operational levels or tiers, from the bottom up:

<dl>
<dt>User processes</dt>
<dd>The running programs that the kernel manages. Also known as the user space. Comprising</dd>
<ul>
    <li>Graphical user interface</li>
    <li>Servers</li> 
    <li>Shell</li>    
  </ul>
<dt>Kernel</dt>
<dd>The core of the operating system. Software residing in memory that tells the CPU where to look for its next task. Acts as a mediator and primary interface between the hardware and the user processes. Comprising:
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
