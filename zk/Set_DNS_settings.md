---
id: 2w0e
title: Set DNS settings
tags: [Linux, networks]
created: Wednesday, June 12, 2024
---

# Set DNS settings

## Change the default DNS server

On Arch and most modern Linux distributions domain name resolution is handled
via the `systemd-resolved` #systemd configuration.

Within the system systemd files this will be handled in
`/systemd/network/wired.network` or `systemd/network/wlan.network` files etc.

In the file below I have turned of DHCP routing and specified the address of my
Pi-hole device to handle domain name resolution:

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

## Related notes
