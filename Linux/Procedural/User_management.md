---
categories:
  - Linux
tags: []
---

# User management

## Switch user

If already logged in as a user you can switch users with the command
`su - [username]`.

## Login as root

If you are logged in as a standard user, if you use `su -` without specifying a
username, then it will assume you wish to log in as root.

If you wish to login as root in the tty at startup, then use `root` as the
username.
