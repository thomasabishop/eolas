---
tags:
  - Programming_Languages
  - backend
  - node-js
  - async
---

We know that Node works by managing [request-response transactions asynchronously](Single-threaded%20asynchronous%20architecture.md) but how does it achieve this? It does it via the Event Queue. This is the mechanism by which Node keeps track of incoming requests and their fulfillment status: whether the data has been returned successfully or if there has been error. 

Node is continually monitoring the Event Queue in the background. 

This makes Node ideal for applications that require a lot of disk or network I/O access. However it means it is not well-positioned to build applications that are CPU intensive such as image rendering and manipulation.
