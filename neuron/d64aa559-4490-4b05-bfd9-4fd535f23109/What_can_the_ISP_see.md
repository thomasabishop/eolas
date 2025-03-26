---
tags: [internet, encryption, privacy, Tor]
created: Friday, December 13, 2024
---

# What can the ISP see?

## Plain HTTP

The ISP can see all content exchanged: DNS lookups, IP address of the server you
connect to, requests and body content.

## Just HTTPS

With HTTPS alone, the content of the messages is encrypted but the ISP can see:

- DNS queries
- IP addresses you connect to
- Traffic patterns and metadata (when, how often, amount of data exchanged etc)

## HTTPS and encrypted DNS server

With HTTPS and an encrypted DNS server (e.g. Quad9) the DNS queries are hidden
but the IP addresses are not. So they could still derive your DNS lookups from
the IPs you end up connecting to.

## HTTPS and VPN

The ISP only sees the encrypted traffic to the VPN server. Your real IP and
destination IP is hidden.

However the VPN provider can potentially see DNS queries, depending on their
policy. Although a good VPN provider will encrypt DNS lookups like an encrypted
DNS server.

The VPN can also still see what IPs you are connecting to. You are basically
swiching trust from the ISP to the VPN provider. However reputable VPNs do not
have your billing and identity info (and payment can use cryptocurrencies) and
don't keep logs. Many also have policies about refusal to cooporate with
authorities in different juristictions. Also the VPN doesn't know your real IP.

## HTTPS, VPN, and encrypted DNS

DNS queries hidded from both ISP and VPN. Traffic is fully encrypted and routed
through VPN.

## Fingerprinting

Note that none of the above stops fingerprinting. Even with full encryption
there are methods of determining online behaviour through encrypted packet
analysis and usage patterns.

A way round this is to use SOCKS proxies which add hops or to use TOR. TOR
effectively solves the "have to trust VPN provider" problem.

With TOR:

- Traffic routed through 3+ nodes
- Each node only knows previous and next hop
- No single node knows both source and destination. Even Tor nodes can't see the
  full path

It also uses:

- Fixed packet sizes
- Timing obfuscation
- Traffic padding

Which makes pattern analysis and fingerprinting much harder than just a VPN.

Furthermore there is also the following protection from VPN weaknesses:

- No single provider to trust/compromise
- Decentralized network
- Free to use and no account needed
- No permanent exit node like with VPN
