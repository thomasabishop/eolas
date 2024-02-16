---
categories:
  - DevOps
  - Backend
tags: [AWS, aws-lambda]
---

# Secrets or environment variables?

Choosing between environment variables and AWS Secrets Manager hinges on factors
such as use case, security needs, and the data type. Environment variables are
easier to use, free, and offer fast access but are less secure and lack features
like versioning. On the other hand, AWS Secrets Manager provides robust security
through encryption, access control, audit trails, and supports secret versioning
and rotation. However, it comes with additional costs and can introduce latency
and rate limits.

General recommendations suggest using AWS Secrets Manager for storing sensitive
data like API keys and passwords, due to its enhanced security features. For
less sensitive, non-critical data such as feature flags or environment-specific
URLs, environment variables are often adequate. Cost-conscious users who don't
need advanced features may find environment variables more economical.
Ultimately, the best choice depends on your specific requirements and
limitations.
