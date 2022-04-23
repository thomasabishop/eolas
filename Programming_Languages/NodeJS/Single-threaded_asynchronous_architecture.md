---
tags:
  - Programming_Languages
  - backend
  - node-js
  - async
---

In the context of back-end, we can think of a thread as an instance of a request-response transaction. 

For example a request is made from the client for a resource contained in a database. The back-end language is an intermediary between the client machine and the server. It receives the request and returns the resource as a response. 

Many backend frameworks are synchronous but multithreaded. This means that a thread can only process one request-response cycle at a time. The thread cannot initiate a new cycle until it has finished with its current cycle. 

If there was only one thread, this would be inefficient and unworkable. Consequently the framework will be multi-threaded: multiple request-response cycles can be executed at once by different threads. To increase scalability of applications built with frameworks of this nature you need to be able to spawn more threads commensurate to the increased demand and this increases the resource consumption of the framework (more cores, more memory etc). Moreover it is possible to reach a point where all threads are active and no more can be spawned. In this case there will simply be delays.

In contrast, Node only has a single thread but it works asynchronously, not synchronously. Thus it has a **single-threaded asynchronous architecture**. This means whilst there is only a single thread it can juggle responses by dispatching them asynchronously. When a request is made it sends it off and continues with its execution and handling new requests. Once these resolve, the data is returned to the main thread. 

![sync-thread.svg](../../img/sync-thread.svg)

![async.svg](../../img/async.svg)
