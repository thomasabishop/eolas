---
tags:
  - docker
  - AWS
---

# AWS SAM and Docker

_How would you use docker containers in AWS. How would this integrate with SAM.
What are the benefits over just deploying from local via SAM_

Amazon Web Services (AWS) provides several services for running Docker
containers, such as Amazon Elastic Container Service (ECS) and AWS Fargate. To
integrate Docker containers with AWS Serverless Application Model (SAM), you can
use the AWS Lambda container image support feature, which allows you to package
and deploy Lambda functions as container images.

Here's a brief overview of how to use Docker containers in AWS with SAM:

1. Create a Dockerfile for your Lambda function, using one of the AWS-provided
   base images for your preferred runtime (e.g., Python, Node.js, etc.).
2. Build the Docker image using the docker build command.
3. Push the Docker image to Amazon Elastic Container Registry (ECR) using the
   docker push command.
4. In your AWS SAM template (template.yaml), define a Lambda function with the
   ImageUri property pointing to the Docker image stored in ECR.
5. Deploy the serverless application using the sam deploy command.

## Benefits of using Docker containers with AWS SAM over deploying from local:

- Consistency:

  - Packaging your Lambda function as a container image ensures that the
    environment and dependencies are consistent across development, testing, and
    production stages. It eliminates the "it works on my machine" problem.

- Custom runtimes:

  - AWS Lambda provides a set of pre-defined runtimes, but with container image
    support, you can use custom runtimes, giving you more flexibility and
    control over the execution environment.

- Easier dependency management:

  - For complex applications with numerous dependencies or large package sizes,
    using container images simplifies dependency management and can help you
    stay within the Lambda package size limits.

- Reuse of existing Docker workflows:

  - If you already have Docker workflows in place for building, testing, and
    deploying containerized applications, you can easily extend these workflows
    for your Lambda functions, reducing the learning curve and operational
    overhead.

- Ease of local testing:
  - With AWS SAM CLI, you can test your Lambda functions locally as container
    images, closely mimicking the actual execution environment and reducing the
    chances of unexpected issues when deploying to AWS.

> While using Docker containers with AWS SAM has its benefits, it may not be
> suitable for every use case. If your Lambda functions have minimal
> dependencies and simple execution environments, deploying directly from local
> using SAM might be more straightforward and faster. However, for more complex
> applications, using Docker containers can provide better consistency,
> flexibility, and control over the execution environment.
