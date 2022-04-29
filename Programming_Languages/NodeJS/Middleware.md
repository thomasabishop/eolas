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

The `next` parameter is key, it allows Express to move onto the next middleware function once the custom middleware executes. Without it, the request processing pipeline will get blocked. middleware functions are basically asynchronous requests and as such they use a similar syntax as Promises (e.g `then`) for sequencing processes. 

### Example of sequence

````js
app.use((req, res, next) => {
    console.log('Do process A...')	
	next()
})

app.use((req, res, next) => {
    console.log('Do process B...')	
	next()
})

````

Would return the following once the server starts:

````plain
Do process A...
Do process B...

````

 > 
 > It makes more sense of course to define our middleware within a function and then pass it as an argument to `app.use()`

## Useful built-in middleware

### `express.static()`

 > 
 > `app.use(express.static())`

Allows you to serve static files. 
Let's say we have a file called `something.txt` that resides at `public/something.txt`
We can expose this to express with `app.use(static('public'))`. Then if we navigate to `localhost:3000/readme.txt` the file will be served in the browser. (Not the `public` subdirectory is not included in the URL, it will be served from root).

### `express.urlencoded()`

 > 
 > `app.use(express.urlencoded())`

Generally we handle the data of API requests via a JSON body and the `express.json()` middleware. However, in cases where the data is sent from the client in the form of `key=value&key=value` appendages to the request URL, `urlencoded` allows us to parse them.


## Third-party middleware
### Helmet

Helmet is middleware that makes it easier to set HTTP headers. 

### Morgan

Morgan is middleware that is used to log HTTP requests to the Express instance. 
```js
app.use(morgan('dev'))
```
With Morgan in place, every time we run a request it will be logged on the console that is running our Node application, e.g:

```plain
GET /api/courses 200 95 - 1.774 ms
```
This uses the `tiny` default which logs the bare minimum giving us: request type; endpoint; response code; and time to execute.

It defaults to logging on the console but can also be configured to write to a log file. 

## Including middleware based on environment 
With a full-scale Node application you will typically run three environments:
* Development
* Testing
* Production

We will not want to run certain types of middleware in all environments. For example, it would be costly to run logging in the app's production environment. It would make more sense to run this only in development.

### Accessing current Node environment
 We can control which middleware we run via the Node envrionment variables: `process.env` (see for instance [ports](./Ports.md)).

To determine the current environment we can use the variable `process.env.NODE_ENV`. This works globally regardless of the kind of Node app we are building. But in Express, there is a built in method for retrieving the current envrionment: `app.get('env')`. 

If you haven't manually set up your environments Node will return `undefined` but express defaults to `development`. 

```js

console.log(process.env.NODE_ENV); // undefined
console.log(app.get("env")); // development

```

### 
We can set Morgan to run only in development with:

```js
if (app.get("env") === 'development') {
  app.use(morgan("common"));
  console.log('Morgan enabled')
}
```
