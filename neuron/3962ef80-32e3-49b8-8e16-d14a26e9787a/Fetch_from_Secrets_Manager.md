---
tags:
  - AWS
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

## Python

```py
import json
import boto3

def get_secret():
    python_env = os.environ.get("PYTHON_ENV", "local")
    """In production, source creds from SecretsManager"""
    if python_env == "production":
        secrets_manager = boto3.client("secretsmanager")
        response = secrets_manager.get_secret_value(SecretId=os.environ["SECRET_ARN"])
        secret_values = json.loads(response["SecretString"])
        return secret_values["GOOGLE_CREDS"]
```
