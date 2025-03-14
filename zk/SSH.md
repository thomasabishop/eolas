---
tags: [encryption, shell, server-management]
created: Tuesday, March 04, 2025
---

# SSH

SSH is the de facto standard for remote access to a Unix machine.

`ssh` is the client which you use to connect to another machine.

`sshd` is the server that manages incoming client requests for access.

## sshd

Typically the SSH server will be turned off.

To run at boot:

```sh
sudo systemctl enable sshd
```

To start immediately:

```sh
sudo systemctl start sshd
```

The `sshd` configuration is found in the directory `/etc/ssh`.

The config file is `/etc/ssh/sshd_config`.

Mostly you can leave this alone but the following is a useful property to set:

```
PermitRootLogin no
```

See [Disable non-root ssh access](./Disable_non-root_ssh_access.md) for more.

## Known hosts

Within your home directory at `./ssh/known_hosts` you will find a record of all
the public keys of the servers you have connected. This file exists for both
servers and clients, e.g:

```sh
cat ./ssh/known_hosts
# systemsobscure.net ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKn6vyv9b+Nk5r
# YVSAk5KvsTiC24K6uSpzCHzgLNoqt2
```

This shows the public key of my server at `systemsobscure.net` along with
others.

## Authorized keys

On servers only, there is also an `authorized_keys` file which shows the
server's own public keys that it presents to clients.

If I go to my server I see that this key matches the one I have on my client
computer `known_hosts`:

```sh
sudo cat /etc/ssh/ssh_host_ed25519_key.pub
# ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKn6vyv9b+Nk5rYVSAk5KvsTiC24K6uSpzCHzgLNoqt2 root@self-host-server

```

Each user on a server will also have a `~/.ssh` directory also containing an
`authorized_keys` file. This contains the public keys of clients who are allowed
to connect to that user account.

Hence I see the same public key of my desktop client machine in both places.

## How the tunnel is created
