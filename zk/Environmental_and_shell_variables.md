---
categories:
  - Programming Languages
tags:
  - shell
---

## Important!

To understand the difference between environmental and shell variables know
that:

- You can spawn child shells from the parent shell that is initiated when you
  first open the terminal. To do this just run `bash` or `zsh` .
- This is a self-contained new instance of the shell. This means:
  - It **will have** access to environmental variables (since they belong to the
    parent / are global)
  - It **will not have** access to any shell variables that are defined in the
    parent.
- **How do you get back to the ‘upper’ parent shell?** Type `exit` .
- Note that:
  - Custom (user-created) shell variables **do not** pass down to spawned shell
    instances, nor do they pass up to the parent
  - Custom (user-created) environment variables do pass down to spawned shell
    instances but do not pass up to the parent. They are lost on `exit` .

Q. What methods are there for keeping track of, preserving, and jumping between
spawned instances? Is this even possible or do they die on `exit` .

## Questions, research

1. If you create a variable manually I guess it won’t make it to any config
   file. How would you create a persistent var that is added to the `.bashrc`
   and thus which would be initialised on every session? Is this where the path
   comes in?
1. What methods are there for keeping track of, preserving, and jumping between
   spawned instances? Is this even possible or do they die on `exit` ?

## What is the shell environment and what are environment variables?

- Every time that you interact with the shell you do so within an
  **environment**. This is the context within which you are working and it
  determines your access to resources and the behaviour that is permitted.

- The environment is an area that the shell builds every time that it starts a
  session. It contains variables that define system properties.

- Every time a
  [shell session](Shell-sessions-e6dd743dec1d4fe3b1ee672c8f9731f6)
  spawns, a process takes place to gather and compile information that should be
  available to the shell process and its child processes. It obtains the data
  for these settings from a variety of different files and settings on the
  system.

- The environment is represented by strings comprising key-value pairs. For
  example:

  ```bash
  KEY=value1:value2
  KEY="value with spaces":"another value with spaces"
  ```

  As the above shows, a key can have multiple related values. Each one is
  demarcated with a `:` . If the value is longer than a single word, quotation
  marks are used.

- The keys are **variables**. They come in two types: **environmental
  variables** and **shell variables:**

  - Environmental variables are much more permanent and pertain to things like
    the user and his path (the overall session)
  - Shell variables are more changeable for instance the current working
    directory (the current program instance)

Variables can be created via config files that run on the initialisation of the
session or manually created via the command line in the current session

## What are shell variables useful for?

Some deployment mechanisms rely on environmental variables to configure
authentication information. This is useful because it does not require keeping
these in files that may be seen by outside parties.

More generally they are used for when you will need to read or alter the
environment of your system.

## Viewing shell and environmental variables

To view the settings of your current environment you can execute the `env`
command which returns a list of the key-value pairs introduced above. Here are
some of the more intelligible variables that are returned when I run this
command:

```bash
SHELL=/usr/bin/zsh
DESKTOP_SESSION=plasma
HOME=/home/thomas
USER=thomas
PWD=/home/thomas/repos/bash-scripting
PATH=/home/thomas/.nvm/versions/node/v16.8.0/bin:/home/thomas/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/var/lib/snapd/snap/bin
```

However if you want to target a specific viable you need to invoke `printenv`
with the relevant key, for example:

```bash
printenv SHELL
# SHELL=/usr/bin/zsh
```

Note that `env` and `printenv` do not show all the shell variables, only a
selection. To view all the shell variables along with the environmental
variables use `set` .

## Creating, exporting and deleting variable shell and environment variables

- You set shell variables using the same syntax you would within a script file:

  ```bash
  TEST_SHELL_VAR="This is a test"
  set | grep TEST_SH
  TEST_SHELL_VAR='This is a test'

  # We can also print it with an echo, again exactly as we would with a shell script
  echo S{TEST_SHELL_VAR}
  ```

- We can verify that it is not an environmental variable based on the fact that
  following does not return anything:

  ```bash
  printenv | grep TEST-SH
  ```

- We can verify that this is a shell variable by spawning a new shell and
  calling it. Nothing will be returned from the child shell.

- You can upgrade a shell variable to an environment variable with `export` :

  ```bash
  export TEST_SHELL_VAR
  # And confirm:
  printenv | grep TEST_SH
  TEST_SHELL_VAR='This is a test'
  ```

- We can use the same syntax to create new environment variables from scratch:

  ```bash
  export NEW_ENV_VAR="A new var"
  ```

### Using config files to create variables

You can also add variables to config files that run on login such as your user
`.bashrc` / `.zshrc` . This is obviously best for when you want the variables to
persist and be accessible within every
[shell session](Shell-sessions-e6dd743dec1d4fe3b1ee672c8f9731f6).

## Important environmental and shell variables

### `PATH`

A list of directories that the system will check when looking for commands. When
a user types in a command, the system will check directories in this order for
the executable.

```bash
echo ${PATH}
# /home/thomas/.nvm/versions/node/v16.8.0/bin:/home/thomas/.local/bin:/usr/local/sbin:/usr/local/bin:
# /usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/var/lib/snapd/snap/bin
```

For example, if you wish to use `npm` commands globally (in any directory) you
will need to have the requisite Node executable in your path, which you can see
above.

### `SHELL`

This describes the shell that will be interpreting any commands you type in. In
most cases, this will be bash by default, but other values can be set if you
prefer other options.

```bash
echo ${SHELL}
# /usr/bin/zsh
```

### `USER`

The current logged in user.

```bash
echo ${USER}
# thomas
```

### `PWD`

The current working directory.

```bash
echo ${PWD}
# /home/thomas
```
