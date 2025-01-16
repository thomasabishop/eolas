---
tags: [networks, procedural]
created: Monday, January 13, 2025
---

# Ping

`ping` is perhaps the most basic network debugging tool. It sends
[ICMP](ICMP_Protocol.md) echo request packets to a recipient host.

If the recipient receives the packet and is configured to reply, it sends an
ICMP echo response packet in return.

For example:

```
$ ping google.com
PING google.com (142.250.200.14) 56(84) bytes of data.
64 bytes from lhr48s29-in-f14.1e100.net (142.250.200.14): icmp_seq=1 ttl=116 time=19.1 ms
64 bytes from lhr48s29-in-f14.1e100.net (142.250.200.14): icmp_seq=2 ttl=116 time=19.2 ms
64 bytes from lhr48s29-in-f14.1e100.net (142.250.200.14): icmp_seq=3 ttl=116 time=19.1 ms
64 bytes from lhr48s29-in-f14.1e100.net (142.250.200.14): icmp_seq=4 ttl=116 time=21.1 ms
```

The first indicates the IP address of the host you are pinging (once per second,
by default). The subsequent lines are the response packets, echoed back from
this host.

The `icmp_seq` is the number of the request in the sequence. If there was to be
a gap in the sequence, this would be the clearest indication of a connection
problem.The packets should not arrive out of order since there is only one
packet being sent per second.

`time` is the round-trip time - from the sending of the packet to its return to
the sender.

If the packet cannot reach the destination host, the final router to see the
packet retunes a "host unreachable" packet to `ping`.
