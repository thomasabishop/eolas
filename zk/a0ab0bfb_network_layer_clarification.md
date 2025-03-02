---
tags: [networks, internet]
created: Sunday, March 02, 2025
---

# a0ab0bfb_network_layer_clarification

I have difficulty understanding the places at which the different layers of the
TCP/IP model of the Internet reside and their spatiality in terms of the overall
system. These are some clarifying remarks.

All layers exist on every device involved in the communication process. But not
all layers are accessed by every device in the overall transaction.

> While the entire encapsulated packet travels across the internet, different
> devices interact with different layers of that packet based on their role in
> the network.

The server and client access data at all layers:

- [Application](./Application_Layer_of_Internet_Protocol.md)
- [Transport](./Transport_Layer_of_Internet_Protocol.md)
- [Internet](./Internet_Layer_of_Internet_Protocol.md)
- [Link](./Link_Layer_of_Internet_Protocol.md)

This is because the data must be composed on the device, a route planned and
then sent accross the network where it is processed at the local network layer.

Routers however only care about routing the data, forwarding packets based on
their IP addresses, they only process data up to the Internet Layer.
