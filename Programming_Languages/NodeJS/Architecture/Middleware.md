---
tags:
  - Programming_Languages
  - backend
  - node-js
  - middleware
---

# Middleware 
## What is middleware?

* Anything that terminates the `req, res` cycle counts as middleware. It is basically anything that acts as an intermediary once the request is received but before the resource is sent. A good example would be the `app.use(express.json()` or `app.use(bodyParser.json)` functions we call in order to be able to parse JSON that is sent from the client. 
* You will most likely have multiple middleware functions running at once. We call this intermediary part of the cycle the **request processing pipeline**. 
* Generally all middleware will be added as a property on the Express `app` instance with the `app.use(...)` syntax. 

## Creating custom middleware functions

### Basic schema

````js

app.use((req, res, next) => {
 	// do some middleware
	next()
})

````

### `next`

The `next` parameter is key, it allows Express to move onto the next middleware function once the custom middleware executes. Without it, the request processing pipeline will get blocked.

Middleware functions are basically asynchronous requests and as such they use a similar syntax as Promises (e.g `then`) for sequencing processes. 

### Example of sequence

```js
app.use((req, res, next) => {
    console.log('Do process A...')	
	next()
})

app.use((req, res, next) => {
    console.log('Do process B...')	
	next()
})

```

> It makes more sense of course to define our middleware within a function and then pass it as an argument to `app.use()`

## Including middleware based on environment 
With a full-scale Node application you will typically run three environments:
* Development
* Testing
* Production

We will not want to run certain types of middleware in all environments. For example, it would be costly to run logging in the app's production environment. It would make more sense to run this only in development.

### Accessing current Node environment
 We can control which middleware we run via the Node envrionment variables: `process.env` (see for instance [ports](./Ports.md)).

We could set [Morgan](/Programming_Languages/NodeJS/Modules/Third_party/Morgan.md) to run only in development with:

```js
if (app.get("env") === 'development') {
  app.use(morgan("common"));
  console.log('Morgan enabled')
}
```
