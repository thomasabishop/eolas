---
tags: [networks, server-management]
created: Sunday, February 09, 2025
---

# Certificates and certificate authorities

> HTTPS is a secure tunnel for data transmission, but the certificate is what
> establishes trust and enables the secure tunnel in the first place.

Before secure communication over HTTPS can commence between a client and a
server, the client must confirm that the server is who it says it is. This is in
order to prevent man-in-the-middle attacks where malicious actors attempt to
impersonate legitimate websites.

Certificates exist to authenticate domains, prior to the exchange of encrypted
data. To do this, a server generates a certificate with a reputable Certificate
Authority, thereby verifying its identity with the CA. It sends this certificate
(which includes its [public key](./bbdcb54f_public_key_cryptography.md)) when
initiating a connection with a client.

In addition to the public key, the certificate provides:

- the domain name
- the CA that certified the domain
- the period of validity
- a digital signature from the CA

The client uses this data to validate the identity of the server it has sent a
request to. Browsers come pre-installed with a list of trusted CAs.

Certificates are called TLS/SSL certificates but the main protocol is TLS rather
than SSL.

Indications that a server is not to be trusted include:

- expired certificates
- certificates issued for the wrong domain
- self-signed certificates not issued by a trusted CA

## Certification process

Standard domain-validated authentication proceeds as follows:

1. Server generates public/private key pair
2. Server creates a certificate signing request containing its public key and
   domain name
3. CA validates the domain and signs the certificate with its private key
4. Server discloses its public key and CA signature
5. Client knows CAs public key and uses this to verify the signature
6. Server's public key is then trusted

### How validation executes between CA and server

To validate the domain (step 3 above), the CA gives the server a "challenge" to
prove they control the domain. This can include:

- Putting a specific token as a DNS TXT record (DNS validation)
- Putting a file at a certain URL (HTTP validation)
- Email validation: sending an email to standard admin address for the server.
  Server owner clicks the link.

### Related

See [Let's Encrypt](./Let's_Encrypt.md)
