---
tags: [networks, proxies]
created: Monday, February 03, 2025
---

# Proxies

A standard proxy stands as a blocking layer between a client and a server. A
client makes a request to a server but before it reaches it, it is intercepted
by a proxy that reviews the request and decides whether to pass on to the
requested location.

As such, from the server's point of view, the request comes from the proxy not
the client.

An example application would be organisations who want to monitor or filter
their employees web activities.

A **reverse proxy** has the opposite orientation. It acts as buffer between a
server and a client, filtering the requests that are sent to a server.

This can also be for reasons of security, but most typically a reverse-proxy is
used to manage requests to different services that a server is running.

If a client requests `service-a.some-server/slug` the request is sent to the
proxy operating at the root level, it siphons the request to its intended
sub-service (`service-a`) and the port this service is running on.

So, from the point of view of Service A, the request doesn't come from the
external client but from the reverse proxy.

In addition to directing traffic, reverse proxies can also implement load
balancing: running procedures that ensure traffic is met at times of high
capacity, ensuring that the server's resources are not exhausted.
