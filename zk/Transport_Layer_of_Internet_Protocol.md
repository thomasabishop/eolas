---
title: Transport_Layer_of_Internet_Protocol
tags: []
created: Tuesday, September 03, 2024
---

# Transport Layer of Internet Protocol

Transport Layer protocols provide a communications channel for data to be sent
between hosts. The Transport Layer is dependent upon the
[Internet Layer](Internet_Layer_of_Internet_Protocol.md) for addressing and
routing the data and the
[Link_Layer_of_Internet_Protocol](Link_Layer_of_Internet_Protocol.md) for
transferring the data to a specific host once it has reached the local network.

The protocol governing the Transport Layer is the **Transmission Control
Protocol** (TCP).

A TCP **fragment** fits within an IP packet's data section, giving us the
following iteration of the network stack:
