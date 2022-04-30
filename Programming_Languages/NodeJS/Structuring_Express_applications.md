---
tags:
  - Programming_Languages
  - backend
  - node-js
  - express
  - rest
---

# Structuring Express applications

In the examples provided in [Creating a RESTFul API with Express](./Create_RESTful_API_with_Express.md), we had all our API routes being served via the `app` variable in `index.js`. This was very cluttered. It is best to structure your application by having a dedicated `/routes/` directory and within this, a dedicated file for each route. 

In general, the following application structure works well:

```
\
    routes\
    middlewear\
    config\
    public\

```

We will demonstrate this for the `/courses` route. 

## Using the `Router` object
Previously we instantiated an Expres instance with `app`:

```js
const express = require('express')
const app = express()
```
When we partition our routes we can no longer do this, since we are only serving a single route, not the whole app, so we instead use Express's `Router` object:

```js
const router = express.Router()
```

And then update all references to `app` with `router`, e.g:
```js
router.get('/api/courses', (req, res) => {
 res.send(courses)
})
```

We would then export:

```
module.exports = router
```

Now all the functions pertaining to that route are handled in a dedicated file. 

We would then import it within the main entry file, `index.js`  and invoke it. The invocation syntax here is the same as when we utilise [middlewear](./Middleware.md): 

```js
const courses = require('./routes/courses')
app.use('/api/courses', courses);
```

Given that we define the `courses` route in `index.js` as being served from `/api/courses`, we no longer have to use that slug within `courses.js`, we can change all our routes to `/` , e.g. 

```js
router.get('/', (req, res) => {
 res.send(courses)
})
```
````js
app.get("/:id", (req, res) => {
  res.send(req.params.id);
});
