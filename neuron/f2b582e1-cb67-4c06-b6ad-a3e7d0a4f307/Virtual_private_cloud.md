---
id: mdw5fe5a
tags: [AWS, networks]
created: Tuesday, February 20, 2024 | 08:31
---

# Virtual Private Cloud

AWS VPC is used to create a virtual network. This is typically used in concert
with [[zk/Elastic_Compute_Cloud]] to manage connections to a virtual server both
privately and accross the internet.

You define a network address range and then create subnets for managing
different connections and functionality. You use a public subnet for resources
that must be connected to the internet and a private subnet for resources that
are to remain isolated from the internet.

The diagram below details a basic VPC configuration:

![](static/aws-vpc-example.png)

- Within a given AWS region we have created a VPC network.
- This comprises public and private subnets
- Both subnets host an EC2 instance
- The public subnet has a bridge to the internet through the Internet Gateway
- Both subnets have a routing table to manage requests and access
