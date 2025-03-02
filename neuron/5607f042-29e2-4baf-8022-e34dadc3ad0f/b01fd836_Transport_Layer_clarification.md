---
tags: [networks, internet]
created: Sunday, March 02, 2025
---

# b01fd836_Transport_Layer_clarification

The Transport Layer is a _logical_ representation of the connection between two
hosts on the Internet. It does not include the entire path (through various
routers) from source to destination. This detail is assumed and is the concern
of the Internet Layer - the next layer down.

When applications communicate accross via TCP they "perceive" a simple direct
connection however this abstracts the fact that the data may:

- be split into dozens of packets
- travel through different physical pathways and different routers
- face congestion, packet loss and network failure.
