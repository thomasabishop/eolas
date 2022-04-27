---
tags:
  - Programming_Languages
  - backend
  - node-js
  - middlewear
---

## What is middlewear?

* Anything that terminates the `req, res` cycle counts as middleware. It is basically anything that acts as an intermediary once the request is received but before the resource is sent. A good example would be the `app.use(express.json()` or `app.use(bodyParser.json)` functions we call in order to be able to parse JSON that is sent from the client. 
* You will most likely have multiple middlewear functions running at once. We call this intermediary part of the cycle the **request processing pipeline**. 
* Generally all middlewear will be added as a property on the Express `app` instance with the `app.use(...)` syntax. 

## Creating custom middlewear functions

### Basic schema

````js

app.use((req, res, next) => {
 	// do some middlewear
	next()
})

````

### `next`

The `next` parameter is key, it allows Express to move onto the next middlewear function once the custom middlewear executes. Without it, the request processing pipeline will get blocked. Middlewear functions are basically asynchronous requests and as such they use a similar syntax as Promises (e.g `then`) for sequencing processes. 

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
 > It makes more sense of course to define our middlewear within a function and then pass it as an argument to `app.use()`

## Useful built-in middlewear

### `express.static()`

 > 
 > `app.use(express.static())`

Allows you to serve static files. 
Let's say we have a file called `something.txt` that resides at `public/something.txt`
We can expose this to express with `app.use(static('public'))`. Then if we navigate to `localhost:3000/readme.txt` the file will be served in the browser. (Not the `public` subdirectory is not included in the URL, it will be served from root).

### `express.urlencoded()`

 > 
 > `app.use(express.urlencoded())`

Generally we handle the data of API requests via a JSON body and the `express.json()` middlewear. However, in cases where the data is sent from the client in the form of `key=value&key=value` appendages to the request URL, `urlencoded` allows us to parse them.


## Third-party middlewear
### Helmet

Helmet is middlewear that makes it easier to set HTTP headers. 

### Morgan

Morgan is middlewear that is used to log HTTP requests to the Express instance. 
```js
app.use(morgan('dev'))
```
With Morgan in place, every time we run a request it will be logged on the console that is running our Node application, e.g:

```plain
GET /api/courses 200 95 - 1.774 ms

```