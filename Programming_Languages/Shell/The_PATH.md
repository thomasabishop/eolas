---
categories:
  - Programming Languages
tags:
  - shell
---

# The `$PATH`

We know that `$PATH` is an [environment variable](/Programming_Languages/Shell/Environmental_and_shell_variables.md). This variable keeps track of directories **where executables are found**.

Whenever any command is run, the shell looks up the directories contained in the `PATH` for the target executable file and runs it. We can see this is the case by using the `which` command which traces the executable of bash commands. Take the `echo` program:

```bash
which echo
# echo: shell built-in command
```

Or `npm` :

```bash
which npm
/home/thomas/.nvm/versions/node/v19.4.0/bin/npm
```

By default the path will always contain the following locations:

- `/usr/bin`
- `/usr/sbin`
- `/usr/local/bin`
- `/usr/local/sbin`
- `/bin`
- `/sbin`

All the inbuilt terminal programs reside at these locations and most of them are at `/usr/bin`. This is why they run automatically without error. If you attempt to run a program that doesn’t reside at these locations then you will get an error along the lines of `program x is not found in PATH`.

## Structure of the PATH

```bash
/home/thomas/.nvm/versions/node/v19.4.0/bin:
/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:
/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
```

## Adding to the PATH

Only the default directories load to the PATH on every session. How then can we add custom directories to the path without them being lost every time we start a new session? Remember that the user config `.bashrc` loads on init for every bash session. Therefore, if we set the custom path in this file, it will be created every time we start a session. This is why when you add a new program it often ask you to append a script to the bottom of your `.bashrc` .

For example, at the bottom of my `.zshrc` on my work computer I have:

```bash
export CHROME_BIN=/mnt/c/Program\\ Files\\ \\(x86\\)/Google/Chrome/Application/chrome.exe
```

This enables me to access the Chromium binaries from my terminal session (needed for running Angular tests) but it doesn’t add it to the path, it creates an environment variable on every session.

For demonstration, let’s add a user’s desktop directory to the PATH.

First we go to the `.bashrc` and add the `export` command. Remember that this is the command for creating a new environment variable:

```bash
export PATH="$PATH=:~/Desktop"
```

We force a reload of the `.bashrc` with the command:

```bash
source ~/.bashrc
```

Then we can check this directory has been added to the path with an echo

```bash
echo $PATH
...:~/Desktop
```
