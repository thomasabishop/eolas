---
categories:
  - Programming Languages
tags:
  - shell
---

## **Types of shell session**

Shell sessions can be one of or several instances of the following types:

- **login shell**
  - A session that must be authenticated such as when you access remote resources using SSH
- **non-login shell**
  - Not the above
- **interactive shell**
  - A shell session that runs in the terminal and thus that the user can _interact_ with
- **non-interactive shell**
  - A shell session that runs without a terminal

If you are working with a remote server you will be in an **interactive login shell**. If you run a script from the command line you will be in a **non-interactive non-login shell**.

## Shell sessions and access

The type of shell session that you are currently in affects the [environmental and shell variables](https://www.notion.so/Environmental-and-shell-variables-04d5ec7e8e2b486a93f002bf686e4bbb) that you can access. This is because the order in which configuration files are read on initialisation differs depending on the type of shell.

- a session defined as a non-login shell will read `/etc/bash.bashrc` and then the user-specific `~/.bashrc` file to build its environment.
- A session started as a login session will read configuration details from the `/etc/profile` file first. It will then look for the first login shell configuration file in the user’s home directory to get user-specific configuration details.

In Linux, if you want the environmental variable to be accessible from both login and non-login shells, you must put them in `~/.bashrc`
