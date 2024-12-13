---
tags: [world-wide-web, internet]
created: Friday, December 13, 2024
---

# Architecture of the World Wide Web

## Terms

<dl>
<dt>web</dt>
<dd>a set of resources delivered over the Internet using the HTTP protocol</dd>

<dt>web resource</dt>
<dd>any information that can be accessed using the web (document, image, video)</dd>

<dt>web server</dt>
<dd>a software program on a computer that hosts web resources</dd>

<dt>web browser</dt>
<dd>an application used to acccess web resources on web servers</dd>

</dl>

## The web is _distributed_, _addressable_, and _linked_

### Distributed

There is no centralised organisation or system that decides the content that can
be published. Any computer connected to the Internet can run a web server and
the person running it can make available any content they wish.

### _Addressable_

Every resource on the web has a unique address that includes both its location
and how to access it (URL):

![](../img/web-url.png)

- scheme
  - specifies the [Application Layer](Application_Layer_of_Internet_Protocol.md for
    accessing the resource. In the example this is HTTP but it could be FTP or another
    protocol, always bracketed with a colon
- authority
  - comprises the [DNS](Transport_Layer_of_Internet_Protocol.md) hostname of the
    server containing the resource. This could also be an
    [IP address](IP_addresses.md) and could also include a port number
- path
  - the location of the resource on the web server, organised hierarchically and
    analagous to a file path
- query
  - a modifier of the resource returned to the client. Its usage varies accross
    sites but is typically deterimined by backend implementation details

> Note a URL does not have to always contain _all_ this information. Consider an
> index page.
