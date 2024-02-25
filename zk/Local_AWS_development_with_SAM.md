---
tags: [AWS, docker]
---

# Local AWS development with SAM

We can run a local instance of our SAM stack for a given application without
sending requests to the cloud. This is implemented through Docker.

The SAM CLI handles all the Docker-related tasks, such as pulling the required
Lambda runtime images, creating containers, mounting your code and dependencies,
and running your Lambda functions inside those containers.

## Basic set up

Enter your project directory.

First build your SAM application:

```sh
sam build
```

We then run:

```sh
sam local start-api
```

If you have an API Gateway endpoint that you want to call over the local server.
You will be able to call it after executing the above.

This will be indicated by:

![](/img/local-sam-docker.png)

If we want to invoke the function directly we use:

```sh
 sam local invoke [FunctionName]
```

## Using environment variables

If you have an API key or database credentials, you are going to typically want
to use different values dependent on environment.

Even if the values are the same accross environments, it's a good idea to not
call a secret when working locally since this request is billable.

In the example below I show how to set up environment variables for an API key
locally and in production.

## Create secret

Go to AWS SecretsManager and add the API key as a secret. This will be sourced
in production.

## Create local ENV file

> These must be in JSON to work with SAM:

### Local env

```json
// local-env.json
{
  "FunctionName": {
    "API_KEY": "xxx-yyy-xxx",
    "NODE_ENV": "development"
  }
}
```

We save these to the root of the given function's directory not at the global
repo level.

> Be sure to add this to `.gitignore` so that it does not become public

### Update `template.yaml`

Every environment variable you intend to use, must exist in the `template.yaml`,
otherwise it will not be sourced at runtime:

```yaml
...
Resources:
  Properties:
    Environment:
      Variables:
        SECRET_ARN: "arn:aws:secretsmanager:eu-west-2:885135949562:secret:wakatime-api-key-X9oF3v",
        NODE_ENV: production
        API_KEY:
...
```

> We go ahead and populate the values for production. But we leave the variable
> we use in development blank, since we don't want it committed and we will
> source it at the SAM invocation. It still needs to exist though.

### Pass in the environment variable at invocation:

```sh
sam local start-api --env-vars /home/thomas/repos/lambdas/wakatime-api/get-coding-stats/local-env.json
```

In production, the variables required will be automatically sourced from the
`template.yaml`

### Create handler within the Lambda itself

You are obviously going to need to distinguish between the different deployments
when the Lambda executes. Here is an example helper function:

```ts
import * as AWS from "aws-sdk";

const secretsManager = new AWS.SecretsManager();

async function getApiKey(): Promise<string> {
  if (process.env.NODE_ENV === "production") {
    const response = await secretsManager
      .getSecretValue({ SecretId: process.env.SECRET_ARN as string })
      .promise();
    const secretValues = JSON.parse(response.SecretString as string);
    return secretValues.API_KEY;
  } else {
    return process.env.API_KEY as string;
  }
}
```
