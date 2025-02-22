---
tags: [networks, server-management, encryption]
created: Sunday, February 09, 2025
---

# Let's Encrypt

ACME (Automatic Certificate Management Environment) is an open source protocol
that automates the process of obtaining and renewing SSL/TLS certificates.

Let's Encrypt (LE) created this protocol and uses it to issue certificates.

Certbot is a popular ACME client that communicates with the LE servers to

- validate domain ownership
- request certificates
- install the certificates on the web server
- handle automatic renewals

Let's Encrypt was founded by the
[Internet Security Research Group](https://www.abetterinternet.org/). Certbot
was created independently by the EFF and is maintained by them.
