---
tags: [networks]
created: Saturday, August 03, 2024
---

# Internet fundamentals

The internet is a _[network](Network_fundamentals.md) of networks_. A globally
connected set of computer networks that all use a suite of common
[protocols](Network_protocols.md).

The protocols governing the communication between networks on the internet are
specified in the **Internet Protocol Suite**.

This combines two protocols:

- **TCP**
  - The Transmission Control Protocol
- **IP**
  - The Internet Protocol

Hence the Internet Protocol Suite is also known as "TCP/IP".

The TCP/IP is a network stack comprising four layers, each with its own
protocols. From the top:

![TCP/IP stack diagram](static/TCP_IP.png)

- The [Link Layer](Link_Layer_of_Internet_Protocol.md) concerns communication
  between devices on the same local network. The transfer of information once it
  has been received from the internet or its transfer between devices before it
  sent out into the internet. Ethernet and WiFi are two core protocols utilised
  at this layer.

- The [Internet Layer](Internet_Layer_of_Internet_Protocol.md) is concerned with
  communication accross networks. It is responsible for identifying hosts on the
  inter-network by their addresses and routing data from network to network.

- The [Transport Layer](Transport_Layer_of_Internet_Protocol.md) creates a
  commmunication channel between two hosts using ports and sockets.

- The [Application Layer](Application_Layer_of_Internet_Protocol.md) concerned
  with software that utilises information received and sent over the internet,
  for instance web pages and emails. This is the highest level of abstraction
  for which all the lower levels serve as "plumbing". Examples of protocols
  operative at the Application Layer include HTTP and SSH.

See:
[Example_scenario_internet_data_transfer](Example_scenario_internet_data_transfer.md)
