---
tags: [shell, procedural]
created: Tuesday, March 04, 2025
---

# lsof

`lsof` stands for _list open files_. It lists opened files and the processes
using them.

## Directory

```sh
lsof /home/thomas
```

```
COMMAND    PID   USER  FD   TYPE DEVICE SIZE/OFF    NODE NAME
pipewire  1025 thomas cwd    DIR  253,0     4096 7340035 /home/thomas
wireplumb 1026 thomas cwd    DIR  253,0     4096 7340035 /home/thomas
```

## Pass in a pid

```sh
lsof -p 1175
```

```
COMMAND    PID   USER  FD      TYPE             DEVICE SIZE/OFF    NODE NAME
at-spi-bu 1175 thomas cwd       DIR              253,0     4096 7340035 /home/thomas
at-spi-bu 1175 thomas rtd       DIR              259,2     4096       2 /
at-spi-bu 1175 thomas txt       REG              259,2    26760 1225154 /usr/lib/at-spi-bus-launcher
```

## Networking

### List programs using or listening to ports

```sh
lsof -i
```

```
COMMAND    PID   USER  FD   TYPE DEVICE SIZE/OFF NODE NAME
signal-de 3250 thomas  39u  IPv4 149863      0t0  TCP archlinux:44304->ac88393aca5853df7.awsglobalaccelerator.com:https (ESTABLISHED)
slack     3602 thomas  18u  IPv4 138442      0t0  TCP archlinux:57950->ec2-18-169-55-40.eu-west-2.compute.amazonaws.com:https (ESTABLISHED)
firefox   6177 thomas 147u  IPv4 138842      0t0  TCP archlinux:cresco-control->93.243.107.34.bc.googleusercontent.com:https (ESTABLISHED)
```

### Filter by specific port

```sh
lsof -i:22
lsof -i4:22 # limit to IPv4 addresses

```

```
COMMAND    PID   USER   FD   TYPE  DEVICE SIZE/OFF NODE NAME
sshd     45448   root    3u  IPv4  640237      0t0  TCP *:ssh (LISTEN)
sshd     45448   root    4u  IPv6  640239      0t0  TCP *:ssh (LISTEN)
sshd    185660   root    4u  IPv4 2554538      0t0  TCP static.18.113.203.116.clients.your-server.de:ssh->0542cb12.skybroadband.com:57744 (ESTABLISHED)

```
