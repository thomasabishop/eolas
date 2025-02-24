---
tags: [fleeting, networks, ARPANET, packet-switching]
created: Tuesday, October 22, 2024
---

# 385af4b4_Baran_distributed_networks

## Paul Baran's concept of a distributed network and influence on architecture of the ARPANET

Baran worked for RAND not ARPA and his work predated the commencement of the
ARPANET. However his model of a distributed network was highly influential on
the design of the ARPANET and served as a consultant during the initial
construction.

Unlike ARPA, Baran was concerned with command and control and how a
communication network could be resiliant enough to withstand nuclear conflict.
He analysed the weaknesses in AT&T's telephone network and proposed a more
robust and resiliant network model.

If we think of the nodes of the phone network as being loci for the transferral
of data, the phone network was highly centralised. The message would go from its
transmitter to a central switch which would route it to the intended receiver:

![Centralised network](static/centralised.png)

The problem is obvious: if the central switch went down, all data transferance
stop.

In fact this is an over-simplification. The phone network at the time was
actually decentralised:

![Decentralised network](static/decentralised.png)

This system is an improvement because each region has a switch and not all nodes
are dependent on the central switch at all times. If the central switch goes
down, the peripheral switches can still manage connections within their regions.
It just means that trans-regional messages are not longer possible. Conversely,
if one regional switch goes down, the other regions are not affected and can
communicate between themselves and each other. So there is greater resiliance
but still points of failure - at the central and regional switches.

Baran conceived a _distributed_ network as his model for the most resiliant
communications network. Instead of centralised or decentralised switches, nodes
would connect to eachother in aggregate:

![Distributed network](static/distributed.png)

Under this system, every node can eventually access every other node through
intermediary nodes, without going through a main switch that establishes the
connection.

This is far more resiliant than the previous two network types because if a
single node or multiple nodes go down, the message can be re-routed through
others.

Furthermore, by distributing the connections between nodes, the overall transfer
of data can be more efficient as there isn't a bottleneck of centralised
switches that can block up at times of high network activity. If one pathway is
blocked, another route can be taken.

The distributed model also opens up the opportunity to optimise transmission.
For a given node in the network, it becomes possible to find the shortest route
to another node. This would be very important in designing the IMP nodes of the
ARPANET.
