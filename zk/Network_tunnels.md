---
tags: [networks, VPN]
created: Monday, February 24, 2025
---

# Network tunnels

A network tunnel is a
[Transport Layer](./Transport_Layer_of_Internet_Protocol.md) mechanism whereby
data packets can travel across a network they would otherwise not be able to
access. Similarly how an underground physical tunnel can be use to travel across
an inaccessible geographic region.

It is a broad concept of which there are various specific instances. However
many involve creating a tunnel by wrapping a packet that cannot traverse a given
network within the payload of a packet that can.

For instance, an organisation may use [IPv6](./IP_addresses.md) addresses but
want to send them over an IPv4 network. To achieve this they would enclose the
packets within IPv4 packets.

Similarly the scenario of a VPN. A user with a UK IP address wants to access a
server in the US that has a firewall blocking non-US IPs. The user can bypass
this restriction by connecting to a VPN running US servers. The UK packets are
transferred under the aegis of the VPN's US IP.

For more detail see
[How tunnelling works with VPNs](./How_tunneling_works_with_VPNs.md).
