---
title: Internet_Layer_of_Internet_Protocol
tags: [network, internet]
created: Thursday, August 15, 2024
---

# Internet Layer of the Internet Protocol Suite

The Internet Layer is concerned with establishing the basis for the connection
and communication between hosts accross the internet.

In order for the data to get from a machine on one local network to a machine on
another local network, each machine must have a way of identifying and
interfacing with the other.

The Internet Layer utilises the **Internet Protocol** to determine how devices
will be publicly identified to devices on other networks and how different
devices on the same local network will be distinguished from outside of this
network. This is achieved through Internet Protocol (IP) addresses.

## Packets

Data is sent accross the internet between hosts as _packets_. These packets,
when sent and received within the
[Link Layer](Link_Layer_of_Internet_Protocol.md) on the local network, are
enclosed within a Link Layer frame (in its payload section):

![Internet Layer packet](../img/internet-layer-packet.png)

Like a frame, an IP packet has a header and a payload. The payload comprises the
data between sent between hosts. The header contains a source IP address and a
destination IP address and also specifies which version of the Internet Protocol
is being used.

// Separate entry on anatomy of IP address
