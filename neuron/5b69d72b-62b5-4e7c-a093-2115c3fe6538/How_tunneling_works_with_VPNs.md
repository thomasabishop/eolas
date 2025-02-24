---
tags: [networks, VPN]
created: Monday, February 24, 2025
---

# How tunnelling works with VPNs

A VPN is a good example of a [network tunnel](Network_tunnels.md) and the
technique of packet wrapping / encapsulation to bypass network restrictions.

When a user connects to a VPN, their device creates a connection to the VPN
server. All subsequent traffic is routed first through the tunnel, rather than
directly to the target host IP.

When the data arrives at the VPN server, the VPN wraps the packets inside new
packets that have the VPN server's addressing information. The nested packets
are encrypted before they are encapsulated and the tunnel they arrive through is
also encrypted end-to-end. Thus there is - in theory - no way to know where the
original packets come from.

When the data returns from the target host to the VPN server that requested it,
the VPN server decrypts the data and forwards it back through the secure tunnel
to the original user's device.

Whilst connected to the VPN, the user's IP appears to be identical to the IP of
the VPN server. This is because the outer packet header has the VPN's addressing
information, not the source IP's (this is encrypted within the payload). As the
target host only sees the VPN's headers, it appears as if the VPN user's IP is
the same as the VPN's.
