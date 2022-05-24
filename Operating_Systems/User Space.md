---
tags:
  - Operating_Systems
  - Linux
---

# User space

User space is the portion of the main memory that the kernel allocates for user processes. 

There is a hierarchy within the user space with several different groups of user processes:

<dl>
<dt>Basic services</dt>
<dd>Run at the bottom level and therefore are closest to ther kernel. Comprises small components that perform single, uncomplicated tasks. Examples include network configuration, the communication bus, and diagnostic logging</dd> 
<dt>Utiility services</dt>
<dd>The middle level: larger components such as mail, print, and database services</dd>
<dt>Services controllable by the user</dt>
<dd>The top level: complicated tasks that the user controls directly such as using a web-browser, editing a text file</dd>
</dl>

## What is a user?
> A user is an entity that can run processes and own files.

At the level of users, a user is associated with a user name however the kernel does not manage usernames, it identifies users via numeric identifiers called **user IDs**. 

Users exist in order to support permissions and access boundaries. A user may terminate or modify the behaviour of its own processes (within limits) but cannot interfere with another user's proceses. In addition, users may own files and choose whether to share them with other users. 

### Root user (superuser)
A Linux system normally has a number of users in addition to the ones that correspond to the real human users. The most important is **root**. The root user _can_ terminate and alter another user's processes and access any file on the local system. 

A person who can operate as root is an administrator on a typical user system. 