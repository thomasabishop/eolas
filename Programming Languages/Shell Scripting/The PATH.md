---
tags:
  - Programming_Languages
  - shell
---

We know that `$PATH` is an [environment variable](Environmental%20and%20shell%20variables.md). It is an important one because it keeps track of certain directories. Not just any directories but the directories **where executables are found**.

Whenever any command is run, the shell looks up the directories contained in the `PATH` for the target executable file and runs it. We can see this is the case by using the `which` command which traces the executable of bash commands. Take the `echo` program:

````bash
which echo
/home/trinity/.nvm/versions/node/v16.10.0/bin/npm
````

Or `npm` :

````bash
which npm
/home/trinity/.nvm/versions/node/v16.10.0/bin/npm
````

By default the path will always contain the following locations:

* `/usr/bin`
* `/usr/sbin`
* `/usr/local/bin`
* `/usr/local/sbin`
* `/bin`
* `/sbin`

All the inbuilt terminal programs reside at these locations and most of them are at `/usr/bin`. This is why they run automatically without error. If you attempt to run a program that doesn’t reside at these locations then you will get an error along the lines of ‘program x is not found in PATH’.

## Structure of the PATH

````bash
/home/trinity/.nvm/versions/node/v16.10.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/wsl/lib:/mnt/c/Python39/Scripts/:/mnt/c/Python39/:/mnt/c/Windows/system32:/mnt/c/Windows:/mnt/c/Windows/System32/Wbem:/mnt/c/Windows/System32/WindowsPowerShell/v1.0/:/mnt/c/Windows/System32/OpenSSH/:/mnt/c/Program Files/dotnet/:/mnt/c/Program Files/nodejs/:/mnt/c/ProgramData/chocolatey/bin:/mnt/c/Users/thomas.bishop/AppData/Local/Microsoft/WindowsApps:/mnt/c/Users/thomas.bishop/AppData/Local/Programs/Microsoft VS Code/bin:/mnt/c/Users/thomas.bishop/AppData/Local/Programs/Hyper/resources/bin:/mnt/c/Users/thomas.bishop/AppData/Roaming/npm
````

## Adding to the PATH

Only the default directories load to the PATH on every session. How then can we add custom directories to the path without them being lost every time we start a new session? Remember that the user config `.bashrc` loads on init for every bash session. Therefore, if we set the custom path in this file, it will be created every time we start a session. This is why when you add a new program it often ask you to append a script to the bottom of your `.bashrc` .

For example, at the bottom of my `.zshrc` on my work computer I have:

````bash
export CHROME_BIN=/mnt/c/Program\\ Files\\ \\(x86\\)/Google/Chrome/Application/chrome.exe
````

This enables me to access the Chromium binaries from my terminal session (needed for running Angular tests) but it doesn’t add it to the path, it creates an environment variable on every session.

For demonstration, let’s add a user’s desktop directory to the PATH.

First we go to the `.bashrc` and add the `export` command. [Remember](https://www.notion.so/Environmental-and-shell-variables-04d5ec7e8e2b486a93f002bf686e4bbb) that this is the command for creating a new environment variable:

````bash
export PATH="$PATH=:~/Desktop"
````

We force a reload of the `.bashrc` with the command:

````bash
source ~/.bashrc
````

Then we can check this directory has been added to the path with an echo

````bash
echo $PATH
...:~/Desktop
````

## Relation between commands and programs

Whenever we issue a command in bash we are really running an executable program that is associated with the command. After all, this is why when we create our own bash scripts we must run `chmod` to make them executables.

When we issue `./file.sh` we are running an executable program.

How come, however that when we use a program like `cd` or `npm` we don’t have to type `./cd.sh` or `./npm.sh` ?
