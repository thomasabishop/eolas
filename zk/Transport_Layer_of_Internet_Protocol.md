---
tags: [internet, networks, ports]
created: Tuesday, September 03, 2024
---

# Transport Layer of the Internet Protocol

Transport Layer protocols provide a communications channel for data to be sent
between hosts. The Transport Layer is dependent upon the [Internet
Layer](./Internet_Layer_of_Internet_Protocol.md routing the data and the
[Link_Layer_of_Internet_Protocol](./Link_Layer_of_Internet_Protocol) for
transferring the data to a specifichost once it has reached the local network.

The protocol governing the Transport Layer is the **Transmission Control
Protocol** (TCP).

A TCP **fragment** fits within an IP packet's data section, giving us the
following iteration of the network stack:

![Transport layer fragment](../img/transport-layer-segment.png)

The segment header contains a destination network port number. The port number
identifies the specific service or process on the host device which will receive
the data.

A useful analogy:

_The IP address is like the street address of an office building. The port
number is like the office number of a specific worker within the building. Once
a letter arrives at the building, the mail processing office (like the OS) is
not the intended recipient. Instead the mail worker passes on the letter to the
intended recipient. Likewise, the OS examines the port number and delivers the
inbound data to the process listening on the specified port._

## Ports

A host with a single IP address can have multiple active ports, each used for
performing a different type of activity on the network.

Both servers and clients possess ports. A server will have a dedicated port
which it listens for requests on (typically port 80 or port 443). A client will
have an "ephemeral" port where it listens for responses from a server. They are
ephemeral because they are open only temporarily to receive a response to a
certain request and are assigned dynamically by the networking components of the
OS.

An IP address plus a port (e.g: 192.168.2.1:3000) constitutes an **endpoint**.
An instance of an endpoint is a **socket**.

If multiple clients connect to the same endpoint each has its own socket (for
instance on a host that is a server). A socket can listen for new connections or
it can represent an established, ongoing connection.
