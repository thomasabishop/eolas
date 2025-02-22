---
tags: [shell]
created: Saturday, February 22, 2025
---

# Capturing program error in Bash

If you want to capture possible error immediately after running the command, use
`!`:

```sh
if ! grep "pattern" file.txt; then
    echo "Pattern not found"
fi
```

This just checks the exit code. If you want the actual error too:

```sh
if ! ERROR=$(grep "pattern" file.txt 2>&1); then
    echo "Pattern not found: $ERROR"
fi
```

If you want to store the outcome of a command and refer to it later, use `$?`.
This built-in variable captures the exit status of the last executed command (0
for success, non-zero for failure):

```sh
ls -a
status=$?  # Store immediately if needed later
if [ $status -ne 0 ]; then
    # handle the error case
else
    # command was successful (exit code = 0)
fi
```

Note: `$?` will be overwritten by any command that runs after the one you're
interested in. If you need to check multiple commands' statuses, store $?
immediately after each command:

```sh
command1
status1=$?
command2
status2=$?

if [ $status1 -ne 0 ] || [ $status2 -ne 0 ]; then
    echo "One of the commands failed"
fi
```

Again, this just checks the exit code, to capture the error:

```sh
error_msg=$(command 2>&1)
status=$?
if [ $status -ne 0 ]; then
    echo "Failed: $error_msg"
fi
```
