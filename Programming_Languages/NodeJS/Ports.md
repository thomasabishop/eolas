---
tags:
  - Programming_Languages
  - backend
  - node-js
  - node-modules
---

Like Bash, Node utilises [environment variables](../Shell%20Scripting/Environmental%20and%20shell%20variables.md) and the syntax is the same since Node must run in a Bash environment or emulator (like GitBash on Windows).

When working in development we are able to specify the specific port from which we want top serve our application. In production, we do not always have this control: the port will most likely be set by the provider of the server environment. 

While we may not know the specific port, whichever it is, it will be accessible via the `PORT` environment variable. So we can use this when writing our [event listeners](Events%20module.md#event-emitters):

````js
const port = process.env.PORT || 3000;
app.listen(port, () => console.log(`Listening on ${port}`));

````

This way, if a port is set by the provider it will use it. If not, it will fall back to 3000.
