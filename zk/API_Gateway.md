---
tags: [AWS, APIs]
---

# AWS API Gateway

We can use Gateway as the front-door to our application. It will create an
[HTTP](HTTP_request_types.md) endpoint that you can call from a
client. In response to a client request you can then call a
[lambda function](Lambda_handler_function.md) that
executes a backend process.

![](/img/gateway-services.png)

See
[using API Gateway as Lambda trigger](Practical_walkthrough_Lambda_creation_within_AWS.md)
for a basic example of usage.
