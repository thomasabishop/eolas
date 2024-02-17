---
tags: [AWS, aws-lambda, backend]
---

# AWS Lambda examples

## Reconstruct CloudFront URLs

```js
exports.handler = (event, context, callback) => {
  // Extract the request from the CloudFront event that is sent to Lambda@Edge
  var request = event.Records[0].cf.request;

  // Extract the URI from the request
  var olduri = request.uri;

  // Match any '/' that occurs at the end of a URI. Replace it with a default index
  var newuri = olduri.replace(/\/$/, "/index.html");

  // Replace the received URI with the URI that includes the index page
  request.uri = newuri;

  // Return to CloudFront
  return callback(null, request);
};
```

Let's walk through the above example making reference to the general structure
of the
[AWS Lambda handler function](Lambda_handler_function.md):

1. The `event` parameter is invoked to gain access to the event that triggered
   the function. This is a CloudFront request event which is targetted with
   `event.Records[0].cf.request`
2. We classify this request as the `olduri` since it doesn't have the form we
   want.
3. We mutate the original request by replacing `/` with `/index.html`
4. We then re-assign the `request.uri` value to the value of the new URI.
5. Finally we invoke the `callback` parameter to signal the completion of the
   transformation and return the new request as the return value.
