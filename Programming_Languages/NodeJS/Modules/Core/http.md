---
tags:
  - Programming_Languages
  - backend
  - node-js
  - node-modules
---

# `http` module

The HTTP Module allows us to create a web server that listens for HTTP requests on a given port. It is therefore perfect for creating backends for client-side JavaScript. 

## Creating a server

An HTTP server is another instance of an [event emitter](/Programming_Languages/NodeJS/Modules/Core/events.md)). It therefore has all the same methods as the `EventEmitter` class: `on`, `emit`, `addListener` etc. This demonstrates again how much of Node's core functionality is based on event emitters.

*Creating a server*
````js
const http = require('http')

const server = http.createServer() // Create server as emitter

// Register functions to run when listener is triggered 
server.on('connection', (socket) => {
	console.log('new connection...')
})

server.listen(3000)
console.log('Listening on port 3000')

````

This server is functionally equivalent to a generic event emitter:

````js
// Raise an event 
const emitter = new EventEmitter('messageLogged')

// Register a listener
emitter.on('messagedLogged', function() {
	console.log('The listener was called.')
})

````

Whenever a request is made to this server, it raises an event. We can therefore target it with the `on` method and make it execute a function when requests are made. 

If we were to start the server by running the file and we then used a browser to navigate to the port, we would see `new connection` logged every time we refresh the page.

### Sockets and `req, res`

A socket is a generic protocol for client-server communication. Crucially it **allows simultaneous communication both ways**. The client can contact the server but the server can also contact the client. Our listener function above uses a socket as the callback function but in most cases this is quite low-level, not distinguishing responses from requests. It is more likely that you would initiate a `request, resource` architecture in place of a socket:

````js
const server = http.createServer((req, res) => {
	if (req.url === '/'){
		res.write('hello')	
		res.end()
	}
})

````

#### Return JSON

Below is an example of using this architecture to return JSON to the client:

````js

const server = http.createServer((req, res) => {
	if (req.url === '/products'){
		res.write(JSON.stringify(['shoes', 'lipstick', 'cups']))	
		res.end()
	}
})


````

### Express

In reality you would rarely use the `http` module directly to create a server. This is because it is quite low level and each response must be written in a linear fashion as with the two URLs in the previous example. Instead we use Express which is a framework for creating servers and routing that is an abstraction on top of the core HTTP module. 
