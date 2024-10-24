---
id: 2w0e
tags: [Linux, networks]
created: Wednesday, June 12, 2024
---

# Set DNS settings

## Change the default DNS server

On Arch and most modern Linux distributions domain name resolution is handled
via the `systemd-resolved` #systemd configuration.

Within the system systemd files this will be handled in
`/etc/systemd/network/wired.network` or `/etc/systemd/network/wlan.network`
files etc.

In the file below I have turned of DHCP routing and specified the address of my
Pi-Hole device to handle domain name resolution:

```
#wlan.network

[Match]
Name=wl*

[Link]
RequiredForOnline=routable

[Network]
DHCP=yes
DNS=192.168.0.4
MulticastDNS=yes

[DHCPv4]
UseDNS=no
RouteMetric=600

[IPv6AcceptRA]
RouteMetric=600

```

This stops it using the default DNS server of my router and runs the resolutions
against Pi-Hole.

This should automatically update the two `resolv.conf` files (which should be in
syc), viz:

```
# File: /run/NetworkManager/resolv.conf
# Generated by NetworkManager
nameserver 192.168.0.4
nameserver fded:2060:8671:0:681:9bff:fe9b:37f0

```

```
# File: /etc/resolv.conf
# Generated by NetworkManager
nameserver 192.168.0.4
nameserver fded:2060:8671:0:681:9bff:fe9b:37f0

```

## Related notes

![Network scanning](./Network_scanning.md)
![Network debugging](Network_debugging.md)