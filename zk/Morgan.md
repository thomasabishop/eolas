---
tags:
  - backend
  - node-js
  - middleware
---

# Morgan

Morgan is middleware that is used to log HTTP requests to the Express instance.

```js
app.use(morgan("dev"));
```

With Morgan in place, every time we run a request it will be logged on the
console that is running our Node application, e.g:

```plain
GET /api/courses 200 95 - 1.774 ms
```

This uses the `tiny` default which logs the bare minimum giving us: request
type; endpoint; response code; and time to execute. But there are more verbose
settings.

It defaults to logging on the console but can also be configured to write to a
log file.
