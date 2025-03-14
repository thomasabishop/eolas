---
tags: [networks, procedural, Linux]
created: Friday, January 10, 2025
---

# View IP addresses

Use `ip` package to view the [IP addresses](IP_addresses.md) associated with
your current host:

```sh
ip address show
```

I am curently using ethernet on the computer I am writing this. This is listed
as follows:

```
enp0s31f6: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
link/ether 90:2e:16:53:98:b9 brd ff:ff:ff:ff:ff:ffinet
192.168.0.3/24 brd 192.168.0.255 scope global dynamic noprefixroute enp0s31f6
    valid_lft 83353sec preferred_lft 83353sec
```

The most important line is the third. This indicates my IP address
(`192.168.0.3/24`) including its subnet mask.
