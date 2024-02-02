---
categories:
  - DevOps
tags: [AWS, aws-lambda, backend]
---

# Handle multiple API Gateway endpoints in a single lambda

With the following config we have a single lambda (`/query-waktime`) with
multiple endpoints:

```yml
Resources:
  QueryWakatimeFunction:
    Type: AWS::Serverless::Function
    Properties:
      CodeUri: src/query-wakatime/
      Handler: index.handler
      Events:
        MainMetrics:
          Type: Api
          Properties:
            Path: /query-wakatime/main-metrics
            Method: get
            Auth:
              Authorizer: AWS_IAM
        Durations:
          Type: Api
          Properties:
            Path: /query-wakatime/durations
            Method: get
            Auth:
              Authorizer: AWS_IAM
        TodayOnly:
          Type: Api
          Properties:
            Path: /query-wakatime/today-only
            Method: get
            Auth:
              Authorizer: AWS_IAM
```

Our endpoints are as follows:

- `/query-wakatime/main-metrics`
- `/query-wakatime/durations`
- `/query-wakatime/today-only`

Each returns a different dataset from an external API. The lambda function makes
a different request to the API based on the endpoint it receives and the time
period that is passed as a query string parameter, e.g.
`/query-wakatime?range=last_7_days`.

Below is a template for concisely handling requests to the different endpoints
in the single lambda function wihout excessive repetition.

```js
const getEndpoint = (path: string, timePeriod?: string | undefined) => {
  const basePath = "/users/current";
  switch (path) {
    case "/query-wakatime/main-metrics":
      return `${basePath}/stats/${timePeriod}`;
    case "/query-wakatime/durations":
      return `${basePath}/summaries?range=${timePeriod}`;
    case "/query-wakatime/today-only":
      return `${basePath}/status_bar/today`;
  }
};

export const handler = async (event) => {
  const fetchClient = new FetchClient("https://wakatime.com/api/v1/");
  const path = event.path;
  const timePeriod = event.queryStringParameters?.timePeriod;
  const endpoint = getEndpoint(path, timePeriod);

  const init: RequestInit = {
    headers: {
      Authorization: `Basic ${encodedApiKey}`,
    },
  };

  if (!endpoint) {
    throw new Error("Endpoint is undefined")
  }

 let data = await fetchClient.get(endpoint, init)
 let dataJson = (await data.json()) as string

 response = {
    statusCode: 200,
    body: JSON.stringify(dataJson),
    headers: responseHeaders,
    }
};



```
