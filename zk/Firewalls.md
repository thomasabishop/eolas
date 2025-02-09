---
tags: [networks, server-management]
created: Sunday, February 09, 2025
---

# Firewalls

A firewall is a server mechanism that filters incoming requests for resources
and services that it hosts.

Based on data about the requester, derived from the
[TLS](/zk/Transport_Layer_of_Internet_Protocol.md) packet headers, the firewall
decides whether or not to grant access to the requested resource.

It will typically comprise three actions:

- accept
- drop
- reject

Accept is obvious. To "drop" means to block the traffic without sending a reply.
To "reject" is to block the traffic but reply with an "unreachable" error.

An example of a firewall rule would be to drop incoming traffic from IP
addresses of non-technical employees to the SSH port (22) but allow technical
staff to access it.

Network traffic is matched agains a list of firewall rules in a sequence from
first to last. As you cannot cover all cases, you must specify a default action
when a rule is not matched.

Whilst firewalls are focused on incoming traffic, you can also apply rules to
outgoing traffic. A server will permit most outgoing traffic since, after all,
it can trust itself however you may want to stop the server connecting to known
malicious actors.

## Related software

IPTables is the standard Linux software for managing firewalls. There is also
Uncomplicated Firewall (UWF) which attaches to IPTables and simplifies the
process.

Another usefule software is Fail2ban which can automatically configure your
firewall to block brute force login attempts and DDOS attacks.
