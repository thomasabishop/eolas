---
categories:
  - DevOps
tags: [AWS, backend]
---

# Fetch from Secrets Manager

## TypeScript

```ts
const getSecret = async (): Promise<SomeCredentials> => {
  const secretsManager = new AWS.SecretsManager();
  const response = await secretsManager
    .getSecretValue({ SecretId: process.env.SECRET_ARN as string })
    .promise();
  const secretValues = JSON.parse(response.SecretString as string);

  if (secretValues) {
    return {
      accessToken: secretValues.POCKET_ACCESS_TOKEN,
      consumerKey: secretValues.POCKET_CONSUMER_KEY,
    };
  } else {
    throw new Error("Failed to return Pocket credentials");
  }
};

type SomeCredentials = {
  accessToken: string;
  consumerKey: string;
};
```

// TODO: Add example of deferring to local env var

## Python

// TODO: Add Python example
