---
tags:
  - AWS
  - aws-lambda
---

# AWS Lambda handler function

Every Lambda function begins the same way with a handler function. In NodeJS:

```js
module.exports.handler = function(event, context, callback){...}
```

The handler is the entry point for the Lambda. It is a function that Lambda can
call to start the execution of your code when an event triggers your Lambda
function.

You may put your whole code in the body of the handler, or you may call other
modules and keep the handler clean and focused on bootstrapping.

The `module.exports` part is just the standard way of exporting a module in
Node. `handler` is a property that is being exported.

You always have access to the parameters `event`, `context` and `callback`.

- `event`
  - The triggering event of the Lambda function stored as an object. The
    object's contents will be different depending on the trigger. It could be
    any AWS service that serves a trigger (S3, DynamoDB, API Gateway etc).
  - For example, if the triggering function is a request to API Gateway, the
    `event` object will contain information about the HTTP request such as
    headers, path, and the request body.
- `context`
  - contains information about the runtime environment and the current execution
    of the Lambda function. The context object provides properties and methods
    that you can use to interact with the AWS Lambda service and the current
    invocation.
- `callback`
  - an optional parameter that represents a callback function provided by AWS
    Lambda. The callback function allows you to signal the completion of your
    Lambda function's execution and return a response or an error. The callback
    function accepts two arguments: error and result. If the first argument is
    not null, AWS Lambda treats it as an error, and the Lambda function
    invocation fails. If the first argument is null, AWS Lambda treats the
    second argument as the result and considers the invocation successful. Using
    the callback function is more common in non-async handler functions. When
    you use async functions, you can return a response or throw an error
    directly, without using the callback function.

### Full example:

In JavaScript:

```js
module.exports.handler = async (event, context) => {
  // Your logic to handle the incoming event
  // For example, you can call other AWS services, process the event data, etc.

  // Return a response
  return {
    statusCode: 200,
    body: JSON.stringify({
      message: "Your Lambda function has successfully executed!",
    }),
  };
};
```

In Python:

```py
import json

def handler(event, context):
    # Your logic to handle the incoming event
    # For example, you can call other AWS services, process the event data, etc.

    # Return a response
    response = {
        'statusCode': 200,
        'body': json.dumps({
            'message': 'Your Lambda function has successfully executed!'
        })
    }
    return response
```
